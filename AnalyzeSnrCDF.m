%% AnalyzeSnrCDF.m
% DESCRIPTION: 
%   Standalone script to analyze the Signal-to-Noise Ratio (SNR) distribution
%   across all Inter-Satellite Links (ISLs) in the constellation.
%   Generates a CDF plot without modifying the core App or SimUtils.
%
% DEPENDENCIES: SimUtils.m
% =========================================================================

clear; clc; close all;

%% 1. CONFIGURATION
% -------------------------------------------------------------------------
N_SATS = 1000;          % Number of satellites
MAX_RANGE = 3500;       % Max ISL range in km
FREQ_HZ = 26e9;         % Ka-Band (26 GHz)
BW_HZ = 400e6;          % 400 MHz Bandwidth

fprintf('--> Generating Constellation (N=%d)...\n', N_SATS);

%% 2. GENERATE SNAPSHOT
% -------------------------------------------------------------------------
% We use the static method from your existing SimUtils class
[pos, ~, ~] = SimUtils.generateConstellation(N_SATS, 1.0, 'Starlink');

%% 3. IDENTIFY VALID LINKS (GEOMETRY)
% -------------------------------------------------------------------------
fprintf('--> Calculating Geometry & Line of Sight...\n');

% Calculate all pairwise distances
D = squareform(pdist(pos)); 
N = size(pos, 1);

% Filter 1: Range Limits (Distance must be > 0 and <= MAX_RANGE)
% We use triu to get unique pairs only (i,j where j>i)
[row, col] = find(triu(D <= MAX_RANGE & D > 1, 1));

if isempty(row)
    error('No valid links found. Try increasing N or Range.');
end

% Filter 2: Earth Occlusion (Line of Sight Check)
% Re-implementing the LoS logic from SimUtils for this standalone analysis
P1 = pos(row, :); 
P2 = pos(col, :);

% Geometric distance of edges
Dist_Edge = D(sub2ind([N, N], row, col));

% Triangle Area / Height Calculation to find minimum altitude of path
CrossP = cross(P1, P2, 2); 
Area = vecnorm(CrossP, 2, 2);
H_min = Area ./ Dist_Edge; 

% Check if path clears Earth + Atmosphere
R_LIMIT = SimUtils.R_EARTH + SimUtils.H_ATM;
ValidLoS = H_min > R_LIMIT;

% Keep only valid LoS links
valid_indices = find(ValidLoS);
final_dists_km = Dist_Edge(valid_indices);

fprintf('--> Found %d valid ISL links.\n', length(final_dists_km));

%% 4. CALCULATE SNR (LINK BUDGET)
% -------------------------------------------------------------------------
% Constants consistent with SimUtils methodology
k_B = 1.380649e-23;   % Boltzmann
T_sys = 290;          % System Temp (K)
Noise_Watts = k_B * T_sys * BW_HZ;
Noise_dBW = 10 * log10(Noise_Watts);

% Link Parameters (From SimUtils.buildGraphs logic)
Tx_Power_dBW = 0; 
G_Tx_dBi = 30; 
G_Rx_dBi = 30;
Sys_Loss_dB = SimUtils.SYS_LOSS_DB;
c = SimUtils.C_LIGHT * 1000; % m/s for FSPL calculation

% Free Space Path Loss (FSPL)
d_meters = final_dists_km * 1000;
fspl_val = (4 * pi * d_meters * FREQ_HZ / c).^2;
fspl_db = 10 * log10(fspl_val);

% Link Budget Equation
% Rx = Tx + Gtx + Grx - FSPL - SysLoss
Rx_Power_dBW = Tx_Power_dBW + G_Tx_dBi + G_Rx_dBi - fspl_db - Sys_Loss_dB;

% SNR Calculation
SNR_dB = Rx_Power_dBW - Noise_dBW;

%% 5. PLOT CDF
% -------------------------------------------------------------------------
fprintf('--> Plotting CDF...\n');

figure('Name', 'SNR Distribution Analysis', 'Color', 'w');

% Use MATLAB's built-in cdfplot or manual plot for better control
h = cdfplot(SNR_dB);

% Add to section 5 (after CDF plot)
threshold_snr = -3; % dB (typical modem threshold)
fraction_above_threshold = sum(SNR_dB >= threshold_snr) / length(SNR_dB);
fprintf('Fraction of links above %.1f dB threshold: %.2f%%\n', ...
        threshold_snr, fraction_above_threshold * 100);

% Add a vertical line on the plot
hold on;
xline(threshold_snr, 'r--', 'LineWidth', 1.5, 'Label', 'Modem Threshold (-3 dB)');
legend('CDF', 'Typical Threshold');



% Styling
set(h, 'LineWidth', 2, 'Color', [0.00 0.48 0.75]); % MATLAB Blue
grid on;
title('CDF of Inter-Satellite Link SNR', 'FontSize', 14);
xlabel('SNR (dB)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Cumulative Probability', 'FontSize', 12, 'FontWeight', 'bold');

% Add Statistics Box
dim = [0.15 0.6 0.3 0.3];
statsStr = {
    sprintf('Mean SNR: %.2f dB', mean(SNR_dB)),
    sprintf('Min SNR:  %.2f dB', min(SNR_dB)),
    sprintf('Max SNR:  %.2f dB', max(SNR_dB)),
    sprintf('Total Links: %d', length(SNR_dB))
};
annotation('textbox', dim, 'String', statsStr, 'FitBoxToText', 'on', ...
           'BackgroundColor', 'w', 'EdgeColor', 'k');

fprintf('--> Done.\n');
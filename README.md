LEO Network Reliability Analyzer 🛰️🌐

A high-fidelity MATLAB simulation environment and GUI dashboard for evaluating routing algorithms in Low Earth Orbit (LEO) satellite networks (Mega-Constellations).

This project was developed as part of a Master's Thesis investigating the trade-offs between Standard Shortest-Path Routing and Reliability-Aware Routing (based on the "Effective Latency" metric proposed by Wang et al., 2024) under dynamic topology and stochastic channel conditions (Rayleigh Fading).

📖 Abstract / Project Overview

The rapid deployment of LEO satellite constellations equipped with Inter-Satellite Links (ISLs) promises global, low-latency broadband coverage. However, the high mobility of satellites and the susceptibility of mmWave links (Ka-Band) to fading phenomena pose significant challenges for reliable packet routing. Conventional shortest-path algorithms often select geometrically optimal but unstable paths, leading to frequent packet losses and retransmissions.

This simulation environment models dynamic Walker-Delta constellations and incorporates stochastic Rayleigh fading models to evaluate routing strategies. It demonstrates that sacrificing a marginal amount of latency can lead to a drastic increase in network robustness and Link Budget (SNR).

✨ Key Features

Interactive GUI Dashboard: A user-friendly interface built with MATLAB App Designer (uifigure) to control simulation parameters (Constellation Size, Monte Carlo trials, Reliability Weight $\alpha$).

Constellation Generation: Supports both organized Walker-Delta architectures (e.g., Starlink-like shells) and Stochastic (Binomial Point Process) topologies.

Advanced Routing Engine: * Standard Routing: Dijkstra's algorithm based purely on propagation distance.

Reliability-Aware Routing: Optimizes for "Effective Latency", incorporating Free Space Path Loss (FSPL), Thermal Noise, Rayleigh Fading outage probability, and M/M/1 queueing delay.

Physical Layer Modeling: Highly accurate modeling of Earth occlusion (Line-of-Sight), Ka-Band (26 GHz) link budgets, antenna gains, and system noise.

Comprehensive Metrics: Calculates End-to-End Latency, SNR Improvement (Link Budget Gain), Maximum Doppler Shift, and Network Jitter.

3D Route Inspector: An interactive 3D Earth visualization tool to inspect the selected routing paths in space.

📂 Project Structure

AppMonteCarlo.m: The main GUI application. It handles user inputs, runs the Monte Carlo simulation loop, updates visualizations (histograms), and renders the 3D constellation view.

SimUtils.m: The core physics and graph theory engine. A static class containing methods for orbital mechanics (generateConstellation), graph building (buildGraphs), link budget calculation, and path metric extraction (getPathMetrics).

AnalyzeSnrCDF.m: A standalone script for plotting the Cumulative Distribution Function (CDF) of the Signal-to-Noise Ratio (SNR) across all valid Inter-Satellite Links in the constellation.

🚀 Getting Started

Prerequisites

MATLAB (Recommended R2021a or newer for optimal UI figure support).

Mapping Toolbox (Optional, but recommended for rendering the Earth topography topo.mat in the 3D viewer).

Statistics and Machine Learning Toolbox (Used for statistical functions like cdfplot and probability distributions).

How to Run

Clone the repository to your local machine:

git clone [https://github.com/yourusername/LEO-Network-Analyzer.git](https://github.com/yourusername/LEO-Network-Analyzer.git)


Open MATLAB and navigate to the project directory.

To launch the main simulation dashboard, type the following in the Command Window:

AppMonteCarlo


To run the standalone SNR analysis, type:

AnalyzeSnrCDF


📊 Usage Guide

Simulation Setup: Enter the desired constellation size ($N$) and the number of Monte Carlo trials. Note: Very large $N$ (e.g., >3000) may require more RAM and computation time.

Routing Strategy: Adjust the slider to set the Reliability Weight ($\alpha$).

$0 \to$ Standard Shortest Path.

$100 \to$ Absolute focus on link reliability.

$80 \to$ Balanced approach (recommended).

Run Sim: Click the button to start the Monte Carlo engine. A waitbar will display the progress.

Analyze Results: View the generated histograms comparing Latency vs. Cost, Reliability (SNR Gain), and Doppler Dynamics.

3D Inspector: Once a simulation finishes, click "Open 3D Inspector" to visualize a specific scenario where the Standard and Reliable paths diverged.

VS Stoch: Click this to run a secondary comparison between a highly organized Walker-Delta topology and a completely random Stochastic topology.

📸 Screenshots

(Note: It is highly recommended to add screenshots of your GUI, the 3D Earth view, and the resulting histograms here after pushing to GitHub.)

✍️ Author

chrisvasill - Initial work & Master's Thesis

📚 References

Wang, R., Kishk, M. A., and Alouini, M.-S. (2024). "Ultra Reliable Low Latency Routing in LEO Satellite Constellations: A Stochastic Geometry Approach." IEEE Transactions on Wireless Communications.

Based on theoretical frameworks defined by 3GPP (TR 38.811/38.821) for Non-Terrestrial Networks (NTN).

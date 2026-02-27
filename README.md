LEO Network Reliability Analyzer

MATLAB R2021+ 

A high-fidelity MATLAB simulation environment and GUI dashboard for evaluating routing algorithms in Low Earth Orbit (LEO) satellite networks (Mega-Constellations).
📝 Project Overview

This project was developed as part of a Master's Thesis investigating the trade-offs between Standard Shortest-Path Routing and Reliability-Aware Routing. The routing is based on the "Effective Latency" metric proposed by Wang et al. (2024) under dynamic topology and stochastic channel conditions like Rayleigh Fading.
Key Features

    Interactive GUI Dashboard: A user-friendly interface built with MATLAB App Designer (uifigure) to control simulation parameters such as Constellation Size, Monte Carlo trials, and Reliability Weight α.

    Constellation Generation: Supports both organized Walker-Delta architectures (e.g., Starlink-like shells) and Stochastic (Binomial Point Process) topologies.

    Advanced Routing Engine:

        Standard Routing: Dijkstra's algorithm based purely on propagation distance.

        Reliability-Aware Routing: Optimizes for "Effective Latency", incorporating Free Space Path Loss (FSPL), Thermal Noise, Rayleigh Fading outage probability, and M/M/1 queueing delay.

    Physical Layer Modeling: Highly accurate modeling of Earth occlusion (Line-of-Sight), Ka-Band (26 GHz) link budgets, antenna gains, and system noise.

    3D Route Inspector: An interactive 3D Earth visualization tool to inspect the selected routing paths in space.

📂 Project Structure

    AppMonteCarlo.m: The main GUI application. It handles user inputs, runs the Monte Carlo simulation loop, and renders the 3D constellation view.

    SimUtils.m: The core physics and graph theory engine. A static class containing methods for orbital mechanics, link budget calculation, and path metric extraction.

    AnalyzeSnrCDF.m: A standalone script for plotting the Cumulative Distribution Function (CDF) of the SNR across all valid Inter-Satellite Links.

🚀 Getting Started
Prerequisites

    MATLAB (Recommended R2021a or newer).

    Mapping Toolbox (Optional, for rendering Earth topography).

    Statistics and Machine Learning Toolbox (Used for statistical functions).

Installation & Execution

    Clone the repository:
    Bash

    git clone https://github.com/yourusername/LEO-Network-Analyzer.git

    Open MATLAB and navigate to the project directory.

    To launch the main simulation dashboard, type in the Command Window:
    Matlab

    AppMonteCarlo

📖 Usage Guide

    Simulation Setup: Enter the desired constellation size (N) and the number of Monte Carlo trials. Note: Very large N (e.g., >3000) may require more RAM.

    Routing Strategy: Adjust the slider to set the Reliability Weight (α):

        0: Standard Shortest Path.

        80: Balanced approach (recommended).

        100: Absolute focus on link reliability.

    Analyze Results: View generated histograms comparing Latency vs. Cost, Reliability (SNR Gain), and Doppler Dynamics.

✍️ Author

chrisvasill - Initial work & Master's Thesis.
📚 References

    Wang, R., Kishk, M. A., and Alouini, M.-S. (2024). "Ultra Reliable Low Latency Routing in LEO Satellite Constellations: A Stochastic Geometry Approach." IEEE Transactions on Wireless Communications.

    Based on theoretical frameworks defined by 3GPP (TR 38.811/38.821) for Non-Terrestrial Networks (NTN).

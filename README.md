# LEO Network Reliability Analyzer

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021%2B-orange)](https://www.mathworks.com/)
[![License](https://img.shields.io/badge/License-MIT-blue)](LICENSE)

[cite_start]A high-fidelity MATLAB simulation environment and GUI dashboard for evaluating routing algorithms in Low Earth Orbit (LEO) satellite networks (Mega-Constellations)[cite: 3].

## 📖 Project Overview

[cite_start]This project was developed as part of a Master's Thesis investigating the trade-offs between Standard Shortest-Path Routing and Reliability-Aware Routing[cite: 4]. [cite_start]The simulation compares these strategies based on the "Effective Latency" metric (proposed by Wang et al., 2024) under dynamic topology and stochastic channel conditions (Rayleigh Fading)[cite: 4].

[cite_start]The rapid deployment of LEO satellite constellations equipped with Inter-Satellite Links (ISLS) promises global, low-latency broadband coverage[cite: 6]. [cite_start]However, the high mobility of satellites and the susceptibility of mmWave links (Ka-Band) to fading phenomena pose significant challenges for reliable packet routing[cite: 7].

[cite_start]Conventional shortest-path algorithms often select geometrically optimal but unstable paths, leading to frequent packet losses and retransmissions[cite: 8]. [cite_start]This simulation models dynamic Walker-Delta constellations and incorporates stochastic Rayleigh fading models to demonstrate that sacrificing a marginal amount of latency can lead to a drastic increase in network robustness and Link Budget (SNR)[cite: 9, 10].

## ✨ Key Features

* [cite_start]**Interactive GUI Dashboard:** A user-friendly interface built with MATLAB App Designer (`uifigure`) to control simulation parameters such as Constellation Size, Monte Carlo trials, and Reliability Weight ($a$)[cite: 12].
* [cite_start]**Constellation Generation:** Supports both organized Walker-Delta architectures (e.g., Starlink-like shells) and Stochastic (Binomial Point Process) topologies[cite: 13].
* **Advanced Routing Engine:**
    * [cite_start]**Standard Routing:** Dijkstra's algorithm based purely on propagation distance[cite: 15].
    * [cite_start]**Reliability-Aware Routing:** Optimizes for "Effective Latency", incorporating Free Space Path Loss (FSPL), Thermal Noise, Rayleigh Fading outage probability, and M/M/1 queueing delay[cite: 16].
* [cite_start]**Physical Layer Modeling:** Highly accurate modeling of Earth occlusion (Line-of-Sight), Ka-Band (26 GHz) link budgets, antenna gains, and system noise[cite: 17].
* [cite_start]**Comprehensive Metrics:** Calculates End-to-End Latency, SNR Improvement (Link Budget Gain), Maximum Doppler Shift, and Network Jitter[cite: 18].
* [cite_start]**3D Route Inspector:** An interactive 3D Earth visualization tool to inspect the selected routing paths in space[cite: 19].

## 📂 Project Structure

* `AppMonteCarlo.m`: The main GUI application. [cite_start]It handles user inputs, runs the Monte Carlo simulation loop, updates visualizations (histograms), and renders the 3D constellation view[cite: 22].
* `SimUtils.m`: The core physics and graph theory engine. [cite_start]A static class containing methods for orbital mechanics (`generateConstellation`), graph building (`buildGraphs`), link budget calculation, and path metric extraction (`getPathMetrics`)[cite: 23].
* [cite_start]`AnalyzeSnrCDF.m`: A standalone script for plotting the Cumulative Distribution Function (CDF) of the Signal-to-Noise Ratio (SNR) across all valid Inter-Satellite Links in the constellation[cite: 24].

## 🚀 Getting Started

### Prerequisites

* [cite_start]**MATLAB**: Recommended R2021a or newer for optimal UI figure support[cite: 27].
* [cite_start]**Mapping Toolbox**: Optional, but recommended for rendering the Earth topography (`topo.mat`) in the 3D viewer[cite: 28].
* [cite_start]**Statistics and Machine Learning Toolbox**: Used for statistical functions like `cdfplot` and probability distributions[cite: 29].

### Installation & Execution

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/yourusername/LEO-Network-Analyzer.git](https://github.com/yourusername/LEO-Network-Analyzer.git)
    ```
    [cite_start][cite: 31, 32]

2.  [cite_start]**Open MATLAB** and navigate to the project directory[cite: 33].

3.  **Run the Main Dashboard:**
    Type the following in the Command Window:
    ```matlab
    AppMonteCarlo
    ```
    [cite_start][cite: 34, 35]

4.  **Run SNR Analysis (Standalone):**
    To run the standalone SNR analysis, type:
    ```matlab
    AnalyzeSnrCDF
    ```
    [cite_start][cite: 36, 37]

## 🕹️ Usage Guide

1.  [cite_start]**Simulation Setup:** Enter the desired constellation size ($N$) and the number of Monte Carlo trials[cite: 39].
    > [cite_start]**Note:** Very large $N$ (e.g., $>3000$) may require more RAM and computation time[cite: 40].

2.  [cite_start]**Routing Strategy:** Adjust the slider to set the Reliability Weight ($a$)[cite: 41]:
    * [cite_start]**0:** Standard Shortest Path[cite: 42].
    * [cite_start]**80:** Balanced approach (**Recommended**)[cite: 44].
    * [cite_start]**100:** Absolute focus on link reliability[cite: 43].

3.  **Run Simulation:** Click the button to start the Monte Carlo engine. [cite_start]A waitbar will display the progress[cite: 46].

4.  [cite_start]**Analyze Results:** View the generated histograms comparing Latency vs. Cost, Reliability (SNR Gain), and Doppler Dynamics[cite: 47].

5.  [cite_start]**3D Inspector:** Once a simulation finishes, click "Open 3D Inspector" to visualize a specific scenario where the Standard and Reliable paths diverged[cite: 48].

6.  [cite_start]**VS Stoch:** Click this to run a secondary comparison between a highly organized Walker-Delta topology and a completely random Stochastic topology[cite: 49].

## 📚 References

* Wang, R., Kishk, M. A., and Alouini, M.-S. (2024). "Ultra Reliable Low Latency Routing in LEO Satellite Constellations: A Stochastic Geometry Approach." [cite_start]*IEEE Transactions on Wireless Communications*[cite: 53, 54].
* [cite_start]Based on theoretical frameworks defined by 3GPP (TR 38.811/38.821) for Non-Terrestrial Networks (NTN)[cite: 55].

## ✍️ Author

* [cite_start]**chrisvasill** - Initial work & Master's Thesis[cite: 51].

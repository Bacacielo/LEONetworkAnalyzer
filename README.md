# [cite_start]LEO Network Reliability Analyzer [cite: 1]

[cite_start]![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg) [cite: 2]
[cite_start]**MATLAB R2021+** [cite: 2]

[cite_start]A high-fidelity MATLAB simulation environment and GUI dashboard for evaluating routing algorithms in Low Earth Orbit (LEO) satellite networks (Mega-Constellations)[cite: 3].

## 📝 Project Overview
[cite_start]This project was developed as part of a Master's Thesis investigating the trade-offs between **Standard Shortest-Path Routing** and **Reliability-Aware Routing**[cite: 4]. The routing is based on the "Effective Latency" metric proposed by Wang et al. (2024) [cite_start]under dynamic topology and stochastic channel conditions like Rayleigh Fading[cite: 4].

### Key Features
* [cite_start]**Interactive GUI Dashboard:** A user-friendly interface built with MATLAB App Designer (`uifigure`) to control simulation parameters such as Constellation Size, Monte Carlo trials, and Reliability Weight $\alpha$[cite: 12].
* [cite_start]**Constellation Generation:** Supports both organized Walker-Delta architectures (e.g., Starlink-like shells) and Stochastic (Binomial Point Process) topologies[cite: 13].
* [cite_start]**Advanced Routing Engine:** [cite: 14]
    * [cite_start]**Standard Routing:** Dijkstra's algorithm based purely on propagation distance[cite: 15].
    * [cite_start]**Reliability-Aware Routing:** Optimizes for "Effective Latency", incorporating Free Space Path Loss (FSPL), Thermal Noise, Rayleigh Fading outage probability, and M/M/1 queueing delay[cite: 16].
* [cite_start]**Physical Layer Modeling:** Highly accurate modeling of Earth occlusion (Line-of-Sight), Ka-Band (26 GHz) link budgets, antenna gains, and system noise[cite: 17].
* [cite_start]**3D Route Inspector:** An interactive 3D Earth visualization tool to inspect the selected routing paths in space[cite: 19].

---

## 📂 Project Structure
* `AppMonteCarlo.m`: The main GUI application. [cite_start]It handles user inputs, runs the Monte Carlo simulation loop, and renders the 3D constellation view[cite: 22].
* `SimUtils.m`: The core physics and graph theory engine. [cite_start]A static class containing methods for orbital mechanics, link budget calculation, and path metric extraction[cite: 23].
* [cite_start]`AnalyzeSnrCDF.m`: A standalone script for plotting the Cumulative Distribution Function (CDF) of the SNR across all valid Inter-Satellite Links[cite: 24].

---

## 🚀 Getting Started

### Prerequisites
* [cite_start]**MATLAB** (Recommended R2021a or newer)[cite: 27].
* [cite_start]**Mapping Toolbox** (Optional, for rendering Earth topography)[cite: 28].
* [cite_start]**Statistics and Machine Learning Toolbox** (Used for statistical functions and probability distributions)[cite: 29].

### Installation & Execution
1. Clone the repository:
   ```bash
   git clone [https://github.com/yourusername/LEO-Network-Analyzer.git](https://github.com/yourusername/LEO-Network-Analyzer.git)
   [cite_start]``` [cite: 32]
2. [cite_start]Open MATLAB and navigate to the project directory[cite: 33].
3. To launch the main simulation dashboard, type in the Command Window:
   ```matlab
   AppMonteCarlo
   [cite_start]``` [cite: 35]

---

## 📖 Usage Guide
1. [cite_start]**Simulation Setup:** Enter the desired constellation size ($N$) and the number of Monte Carlo trials[cite: 39]. [cite_start]Note: Very large $N$ (e.g., $> 3000$) may require more RAM[cite: 40].
2. [cite_start]**Routing Strategy:** Adjust the slider to set the Reliability Weight ($\alpha$): [cite: 41]
   * [cite_start]`0`: Standard Shortest Path[cite: 42].
   * [cite_start]`80`: Balanced approach (recommended)[cite: 44].
   * [cite_start]`100`: Absolute focus on link reliability[cite: 43].
3. [cite_start]**Analyze Results:** View generated histograms comparing Latency vs. Cost, Reliability (SNR Gain), and Doppler Dynamics[cite: 47].
4. [cite_start]**3D Inspector:** Once a simulation finishes, click "Open 3D Inspector" to visualize scenarios where paths diverged[cite: 48].

---

## ✍️ Author
[cite_start]**chrisvasill** - Initial work & Master's Thesis[cite: 51].

## 📚 References
* Wang, R., Kishk, M. A., and Alouini, M.-S. (2024). "Ultra Reliable Low Latency Routing in LEO Satellite Constellations: A Stochastic Geometry Approach." [cite_start]*IEEE Transactions on Wireless Communications*[cite: 53, 54].
* [cite_start]Based on theoretical frameworks defined by 3GPP (TR 38.811/38.821) for Non-Terrestrial Networks (NTN)[cite: 55].

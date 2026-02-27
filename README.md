# LEO Network Reliability Analyzer

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
**MATLAB R2021+**

[cite_start]A high-fidelity MATLAB simulation environment and GUI dashboard for evaluating routing algorithms in Low Earth Orbit (LEO) satellite networks (Mega-Constellations)[cite: 3].

## 📝 Project Overview
[cite_start]This project was developed as part of a Master's Thesis investigating the trade-offs between **Standard Shortest-Path Routing** and **Reliability-Aware Routing**[cite: 4, 51]. The routing is based on the "Effective Latency" metric proposed by Wang et al. (2024) [cite_start]under dynamic topology and stochastic channel conditions like Rayleigh Fading[cite: 4, 53].

### Key Features
* [cite_start]**Interactive GUI Dashboard:** A user-friendly interface built with MATLAB App Designer (`uifigure`) to control simulation parameters such as Constellation Size, Monte Carlo trials, and Reliability Weight $\alpha$[cite: 12].
* [cite_start]**Constellation Generation:** Supports both organized Walker-Delta architectures (e.g., Starlink-like shells) and Stochastic (Binomial Point Process) topologies[cite: 13].
* **Advanced Routing Engine:**
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

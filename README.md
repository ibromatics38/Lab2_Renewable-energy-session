# Lab2_Renewable-energy-session

# ☀️ Advanced PV System Modeling with MPPT | Renewable Energy Lab 2

![MATLAB/Simulink](https://img.shields.io/badge/-MATLAB%2FSimulink-0076A8?logo=mathworks&logoColor=white)
![MPPT](https://img.shields.io/badge/-Maximum%20Power%20Point%20Tracking-4CAF50)
![Grid Integration](https://img.shields.io/badge/-Grid%20Integration-FF5722)

A detailed exploration of **PV system dynamics**, **DC voltage control**, and **Maximum Power Point Tracking (MPPT)** for optimal solar energy harvesting. Developed for the Renewable Energy Lab at *Universitat Politècnica de Catalunya*.

---

## 📌 Overview
This repository contains Assignment 2's report and simulations, focusing on:
- **PV array modeling** with temperature/irradiance dependency.
- **Voltage Source Converter (VSC)** control for DC voltage regulation.
- **MPPT implementation** for dynamic power optimization under varying environmental conditions.
- Grid integration analysis with step-change responses.

Key insights include power-voltage-current relationships under temperature fluctuations and irradiance variations.

---

## 🚀 Key Features
### 1. **PV Array Model**
   - Equations for irradiance/temperature-dependent output:
     \[
     I_{pv} = [I_{pv,n} + K_I(T-T_n)]\frac{G}{G_n}
     \]
   - Simulink implementation with series/parallel cell configurations.

### 2. **VSC DC Voltage Control**
   - PI controller tuning for stable DC voltage regulation:
     \[
     k_{pv} = 2\xi\omega_n C_{dc}, \quad k_{iv} = \omega_n^2 C_{dc}
     \]
   - Disturbance rejection strategies for grid synchronization.

### 3. **MPPT Algorithm**
   - Open-loop voltage reference adjustment based on PV temperature.
   - Case studies for varying irradiance (200–1200 W/m²) and temperature (238–358 K).

### 4. **Grid Interaction Analysis**
   - Step-change responses in grid current, power, and PV voltage.
   - Impact of temperature on PV efficiency and grid power injection.

---

## 📊 Simulation Highlights
| **Scenario**               | **Key Insight**                                                                 |
|----------------------------|---------------------------------------------------------------------------------|
| **Varying Temperature**    | 20% power drop at 358 K vs. nominal (298 K) due to reduced voltage efficiency.  |
| **High Irradiance (1200 W/m²)** | 12% current increase with stable DC voltage (1184 V).                       |
| **Step Change (1.5 sec)**  | Grid current stabilizes within 0.2 sec post-temperature spike.                  |

![MPPT Performance](https://via.placeholder.com/600x200?text=MPPT+Voltage+vs+Temperature+Variations)  
*Example: MPPT adjusts voltage to compensate for temperature effects (Section 4.1-4.5)*

---

## 🛠️ Prerequisites
- **MATLAB/Simulink** for model execution.
- Basic understanding of power electronics and solar PV dynamics.

---


---

## 📜 Technical Insights
### Temperature vs. Irradiance Effects
| **Parameter**   | **↑ Temperature**          | **↑ Irradiance**          |
|-----------------|----------------------------|---------------------------|
| **Voltage**     | ↓ 3-5% per 10 K rise       | ↔ Stable (1184 V)         |
| **Current**     | ↓ 2-3% per 10 K rise       | ↑ Proportional to G       |
| **Power**       | ↓ 5-8% per 10 K rise       | ↑ Linear with irradiance  |

### MPPT Efficiency
- Achieves **97% power tracking accuracy** under dynamic conditions.
- Compensates voltage drops by adjusting current during temperature spikes.

---

## 🌟 Acknowledgments
Supervised by **Prof. Marc Cheah Mañé** (UPC). Special thanks to the **Department of Electrical Engineering** for resources on renewable grid integration.

---

🔗 **Explore the [(https://github.com/ibromatics38/Lab2_Renewable-energy-session/blob/main/PV%20SYSTEM%20REPORT.pdf) ]for implementation details!**

---

### ✨ Why This Repository?
- **Dynamic Modeling**: Simulink-based PV and MPPT implementations.
- **Real-World Relevance**: IEEE-compliant grid interaction analysis.
- **Academic Ready**: Ideal for power electronics and renewable energy courses.

📩 **Contact**: [Your Email] | [LinkedIn Profile]  
💡 **Contribute**: Open to collaborations and optimizations!

## 📂 Repository Structure

# Air Quality Sensor Calibration

Calibration and analysis of low-cost electrochemical sensors for airborne measurements of CO, NO, NO2 and O3.

This project is based on my MSc thesis at the University of Cologne, Institute for Geophysics and Meteorology. The work focused on evaluating electrochemical sensors for ambient air-quality measurements and applying laboratory calibration to measurements collected during an airborne field campaign.

## Project Overview

The study used electrochemical sensors to measure:

- Carbon monoxide (CO)
- Nitric oxide (NO)
- Nitrogen dioxide (NO2)
- Ozone (O3)

The sensors were calibrated against reference instruments, including Picarro and CraNOx analysers. Calibration coefficients were then applied to high-frequency measurements collected during Zeppelin flights over Germany.

The analysis included:

- Sensor calibration and correction
- Processing of high-frequency time-series data
- Linear regression and correlation analysis
- Mean and standard deviation analysis
- Percentile analysis
- Comparison between sensor setups
- Investigation of temperature and humidity effects
- Comparison with European air-quality reference values

## Repository Structure

```text
air-quality-sensor-calibration/
├── matlab/
│   ├── Read_bin_data.m
│   ├── Datumstempel_erzeugen_N.m
│   ├── Berechnung_PLOT_New_version.m
│   ├── Calibration.m
│   ├── CLB_data_2_field_data.m
│   ├── Results.m
│   ├── mean_sd_plot.m
│   ├── Linear_Reg_Clb.m
│   ├── Linear_regression_Zeppelin.m
│   ├── Linear_corr.m
│   ├── Quantile.m
│   ├── Combo_chart.m
│   └── README.md
│
└── README.md
```

## Data

The original measurement data are not included in this repository.

The analysis used laboratory calibration measurements together with airborne field observations collected during a measurement campaign in Germany.

## MSc Thesis

**Characterization and Application of Electrochemical Sensors for Ambient, Airborne Measurements of CO, NO, NO2, and O3**

Institute for Geophysics and Meteorology  
University of Cologne

## Tools and Methods

- MATLAB
- Environmental data processing
- Time-series analysis
- Sensor calibration
- Linear regression
- Correlation analysis
- Statistical analysis
- Data quality assessment

## Author

**Aurela Sakaj**  
Climate & Environmental Data Scientist

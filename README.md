# Air Quality Sensor Calibration

Calibration and analysis of electrochemical sensors for airborne measurements of CO, NO, NO2 and O3.

This repository contains MATLAB code developed for my MSc thesis at the **Institute for Geophysics and Meteorology, University of Cologne**.

The project focused on evaluating low-cost electrochemical sensors for air-quality measurements. The sensors were calibrated under laboratory conditions against reference instruments and the calibration was then applied to measurements collected during an airborne field campaign in Germany.

## Project Overview

The study used electrochemical sensors for:

- Carbon monoxide (CO)
- Nitric oxide (NO)
- Nitrogen dioxide (NO2)
- Ozone (O3)

The sensors were calibrated against **Picarro** and **CraNOx** reference instruments.

The calibration was then applied to measurements collected during Zeppelin flights. The sensors recorded measurements at approximately one-second resolution, producing high-frequency atmospheric data for the analysis.

The aim was to understand how well the sensors performed under controlled and real atmospheric conditions and to investigate factors affecting the measurements.

## Analysis

The workflow included:

- Reading and processing raw sensor measurements
- Correcting sensor background signals
- Calibration against reference instruments
- Applying calibration coefficients to field measurements
- Processing high-frequency time-series data
- Linear regression and correlation analysis
- Mean and standard deviation analysis
- Percentile analysis
- Comparison between different sensor setups
- Investigation of temperature and humidity effects
- Comparison with European air-quality reference values
- Visualization of pollutant concentrations over time

## MATLAB Scripts

`Read_bin_data.m`  
Reads the binary measurement files and extracts the sensor channels.

`Datumstempel_erzeugen_N.m`  
Organizes measurements from the six sensor setups and prepares timestamps and variables used in the analysis.

`Berechnung_PLOT_New_version.m`  
Processes sensor signals together with temperature and humidity measurements.

`Calibration.m`  
Compares the electrochemical sensor measurements with Picarro and CraNOx reference measurements.

`CLB_data_2_field_data.m`  
Applies calibration coefficients to the airborne field measurements.

`Results.m`  
Produces concentration time-series plots and analysis outputs.

`mean_sd_plot.m`  
Calculates minute-level means and standard deviations.

`Linear_Reg_Clb.m`  
Performs linear regression on the calibration measurements.

`Linear_regression_Zeppelin.m`  
Performs regression analysis between sensor setups for the airborne measurements.

`Linear_corr.m`  
Compares measurements between sensor setups using linear relationships.

`Quantile.m`  
Calculates concentration percentiles.

`Combo_chart.m`  
Visualizes gas concentrations together with temperature and humidity.

## Field Measurements

The field measurements came from electrochemical sensors mounted on a Zeppelin during an airborne measurement campaign in Germany.

Six sensor setups were used, each containing sensors for CO, NO, NO2 and O3.

For one of the days analyzed in the thesis, the sensors recorded approximately **73,000 measurements**, allowing pollutant concentrations to be examined at very short timescales.

## Data

The original calibration and airborne measurement data are **not included** in this repository.

The scripts were written for the original thesis dataset and some depend on input files and intermediate variables generated during the analysis workflow.

## MSc Thesis

**Characterization and Application of Electrochemical Sensors for Ambient, Airborne Measurements of CO, NO, NO2, and O3**

Master of Science  
Institute for Geophysics and Meteorology  
University of Cologne

## Tools and Methods

- MATLAB
- Environmental data processing
- Atmospheric measurements
- Time-series analysis
- Sensor calibration
- Data quality assessment
- Linear regression
- Correlation analysis
- Statistical analysis
- Scientific visualization

## Author

**Aurela Sakaj**  
Climate & Environmental Data Scientist

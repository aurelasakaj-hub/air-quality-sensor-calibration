# Air Quality Sensor Calibration

MATLAB analysis of electrochemical sensors for airborne measurements of CO, NO, NO2 and O3.

This repository contains code from my MSc thesis at the Institute for Geophysics and Meteorology, University of Cologne.

The work focused on calibrating low-cost electrochemical gas sensors against reference instruments and applying the calibration to measurements collected during an airborne field campaign in Germany.

## Analysis

The sensors measured:

- CO
- NO
- NO2
- O3

Laboratory measurements from Picarro and CraNOx instruments were used as references for the calibration.

The calibrated sensors were then used to analyse high-frequency measurements collected during Zeppelin flights. The analysis included sensor correction, time-series processing, regression, correlation, mean and standard deviation, percentiles, and comparison between the different sensor setups.

Temperature and humidity were also considered because of their influence on the sensor response.

## MATLAB code

The `matlab` folder contains the scripts used in the analysis.

`Read_bin_data.m`  
Reads the binary sensor data and extracts the measurement channels.

`Datumstempel_erzeugen_N.m`  
Prepares timestamps and variables for the six sensor setups.

`Berechnung_PLOT_New_version.m`  
Processes the sensor measurements together with temperature and humidity data.

`Calibration.m`  
Calibrates the electrochemical sensors against Picarro and CraNOx measurements.

`CLB_data_2_field_data.m`  
Applies the calibration coefficients to the field measurements.

`Results.m`  
Generates concentration time series and analysis results.

`mean_sd_plot.m`  
Calculates mean values and standard deviations.

`Linear_Reg_Clb.m`  
Performs regression analysis for the calibration measurements.

`Linear_regression_Zeppelin.m`  
Performs regression analysis for the Zeppelin measurements.

`Linear_corr.m`  
Compares measurements between sensor setups.

`Quantile.m`  
Calculates concentration percentiles.

`Combo_chart.m`  
Plots gas concentrations together with temperature and humidity.

## Field data

The field measurements were collected with six sensor setups mounted on a Zeppelin during an airborne measurement campaign in Germany.

The sensors recorded data at approximately one-second resolution. One of the analysed days contained around 73,000 measurements.

The original measurement data are not included in this repository.

Some scripts therefore depend on input files and intermediate variables from the original thesis workflow.

## Thesis

**Characterization and Application of Electrochemical Sensors for Ambient, Airborne Measurements of CO, NO, NO2, and O3**

MSc thesis  
Institute for Geophysics and Meteorology  
University of Cologne

## Author

Aurela Sakaj

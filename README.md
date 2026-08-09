# Air Quality Sensor Calibration

MATLAB analysis of electrochemical sensors for airborne measurements of CO, NO, NO2 and O3.

This repository contains a cleaned and refactored version of the analysis workflow from my MSc thesis at the Institute for Geophysics and Meteorology, University of Cologne.

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

The `matlab` folder contains the main data-processing and calibration functions used in the analysis workflow.

`read_binary_sensor_data.m`  
Reads the binary sensor files and extracts timestamps, gas-sensor channels and environmental measurements.

`adc_counts_to_voltage.m`  
Converts raw ADC counts from the sensor board to voltage.

`decode_temperature_humidity.m`  
Converts the raw temperature and humidity measurements to temperature in degrees Celsius and relative humidity.

`read_reference_measurements.m`  
Reads calibration measurements from the Picarro and CraNOx reference instruments.

`align_time_series.m`  
Aligns measurements from different instruments in time before comparison and calibration.

`fit_linear_calibration.m`  
Fits a linear calibration between the sensor signal and reference-instrument measurements and calculates R2 and RMSE.

`apply_linear_calibration.m`  
Applies the fitted calibration coefficients to sensor measurements.

`minute_statistics.m`  
Aggregates high-frequency measurements and calculates one-minute means and standard deviations.

The code has been reorganized from the original thesis workflow to make the main processing and calibration steps easier to follow.

## Field data

The field measurements were collected with six sensor setups mounted on a Zeppelin during an airborne measurement campaign in Germany.

The sensors recorded data at approximately one-second resolution. One of the analysed days contained around 73,000 measurements.

The original measurement data are not included in this repository.

The MATLAB functions therefore document the main processing and calibration workflow rather than reproduce the complete field campaign analysis.

## Thesis

**Characterization and Application of Electrochemical Sensors for Ambient, Airborne Measurements of CO, NO, NO2, and O3**

MSc thesis  
Institute for Geophysics and Meteorology  
University of Cologne

## Author

Aurela Sakaj

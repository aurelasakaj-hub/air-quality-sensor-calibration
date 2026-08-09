function model = fit_linear_calibration(sensorSignal, referenceConcentration)
%FIT_LINEAR_CALIBRATION Fit a linear sensor-to-reference calibration.
%
%   model = FIT_LINEAR_CALIBRATION(sensorSignal, referenceConcentration)
%   fits
%
%       reference = slope * sensorSignal + intercept
%
%   using paired finite observations. The returned structure also reports
%   R2 and RMSE on the calibration data. Independent validation data should
%   be used when available to assess out-of-sample performance.

arguments
    sensorSignal (:,1) double
    referenceConcentration (:,1) double
end

if numel(sensorSignal) ~= numel(referenceConcentration)
    error('fit_linear_calibration:SizeMismatch', ...
        'sensorSignal and referenceConcentration must have the same length.');
end

valid = isfinite(sensorSignal) & isfinite(referenceConcentration);
sensorSignal = sensorSignal(valid);
referenceConcentration = referenceConcentration(valid);

if numel(sensorSignal) < 2
    error('fit_linear_calibration:InsufficientData', ...
        'At least two valid paired observations are required.');
end

coefficients = polyfit(sensorSignal, referenceConcentration, 1);
calibrated = polyval(coefficients, sensorSignal);
residual = referenceConcentration - calibrated;

tss = sum((referenceConcentration - mean(referenceConcentration)).^2);
sse = sum(residual.^2);
if tss == 0
    r2 = NaN;
else
    r2 = 1 - sse / tss;
end

model = struct( ...
    'Slope', coefficients(1), ...
    'Intercept', coefficients(2), ...
    'R2', r2, ...
    'RMSE', sqrt(mean(residual.^2)), ...
    'N', numel(sensorSignal));
end

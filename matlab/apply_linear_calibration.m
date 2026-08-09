function concentration = apply_linear_calibration(sensorSignal, model)
%APPLY_LINEAR_CALIBRATION Apply a model returned by fit_linear_calibration.

arguments
    sensorSignal (:,1) double
    model (1,1) struct
end

requiredFields = {'Slope','Intercept'};
if ~all(isfield(model, requiredFields))
    error('apply_linear_calibration:InvalidModel', ...
        'model must contain Slope and Intercept fields.');
end

concentration = model.Slope .* sensorSignal + model.Intercept;
end

function alignedValues = align_time_series(sourceTime, sourceValues, targetTime)
%ALIGN_TIME_SERIES Interpolate one time series onto another timestamp vector.

arguments
    sourceTime (:,1) datetime
    sourceValues (:,1) double
    targetTime (:,1) datetime
end

if numel(sourceTime) ~= numel(sourceValues)
    error('align_time_series:SizeMismatch', ...
        'sourceTime and sourceValues must have the same length.');
end

valid = ~isnat(sourceTime) & isfinite(sourceValues);
sourceTime = sourceTime(valid);
sourceValues = sourceValues(valid);

if numel(sourceValues) < 2
    error('align_time_series:InsufficientData', ...
        'At least two valid source observations are required.');
end

[sourceTime, uniqueIndex] = unique(sourceTime, 'stable');
sourceValues = sourceValues(uniqueIndex);

sourceSeconds = posixtime(sourceTime);
targetSeconds = posixtime(targetTime);
alignedValues = interp1(sourceSeconds, sourceValues, targetSeconds, ...
    'linear', NaN);
end

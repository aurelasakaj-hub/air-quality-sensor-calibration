function summary = minute_statistics(time, values)
%MINUTE_STATISTICS Calculate one-minute mean and standard deviation.
%
%   summary = MINUTE_STATISTICS(time, values) returns a table with the
%   beginning of each observed minute, the number of samples, the mean and
%   the standard deviation. Missing timestamps and non-finite values are
%   removed before aggregation.

arguments
    time (:,1) datetime
    values (:,1) double
end

if numel(time) ~= numel(values)
    error('minute_statistics:SizeMismatch', ...
        'time and values must have the same length.');
end

valid = ~isnat(time) & isfinite(values);
time = time(valid);
values = values(valid);

if isempty(values)
    summary = table(datetime.empty(0,1), zeros(0,1), zeros(0,1), zeros(0,1), ...
        'VariableNames', {'Time','N','Mean','StdDev'});
    return
end

[time, order] = sort(time);
values = values(order);
minuteTime = dateshift(time, 'start', 'minute');
[groupId, groupTime] = findgroups(minuteTime);

sampleCount = splitapply(@numel, values, groupId);
meanValue = splitapply(@mean, values, groupId);
stdValue = splitapply(@std, values, groupId);

summary = table(groupTime, sampleCount, meanValue, stdValue, ...
    'VariableNames', {'Time','N','Mean','StdDev'});
end

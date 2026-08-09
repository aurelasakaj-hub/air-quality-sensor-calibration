function [temperatureC, relativeHumidity] = decode_temperature_humidity( ...
    temperatureLowRaw, temperatureHighRaw, humidityLowRaw, humidityHighRaw)
%DECODE_TEMPERATURE_HUMIDITY Convert raw environmental-sensor bytes.
%
%   [temperatureC, relativeHumidity] = DECODE_TEMPERATURE_HUMIDITY(...)
%   converts the low/high temperature and humidity bytes used in the
%   measurement system to degrees Celsius and relative humidity (%).

arguments
    temperatureLowRaw  (:,1)
    temperatureHighRaw (:,1)
    humidityLowRaw     (:,1)
    humidityHighRaw    (:,1)
end

n = numel(temperatureLowRaw);
if any([numel(temperatureHighRaw), numel(humidityLowRaw), numel(humidityHighRaw)] ~= n)
    error('decode_temperature_humidity:SizeMismatch', ...
        'All input vectors must have the same length.');
end

% The upper two humidity bits are status bits and are masked out.
humidityHighMasked = bitand(uint8(humidityHighRaw), uint8(63));

temperatureC = (double(temperatureHighRaw) .* 64 + ...
    double(temperatureLowRaw) ./ 4) ./ (2^14) .* 165 - 40;

relativeHumidity = (double(humidityHighMasked) .* 256 + ...
    double(humidityLowRaw)) ./ (2^14) .* 100;
end

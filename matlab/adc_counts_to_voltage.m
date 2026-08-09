function voltage = adc_counts_to_voltage(adcCounts)
%ADC_COUNTS_TO_VOLTAGE Convert 32-bit ADC counts to sensor-board voltage.
%
%   The conversion follows the scaling used in the original measurement
%   workflow: 2.5 V reference, multiplied by two for the input range.

arguments
    adcCounts (:,1)
end

voltage = double(adcCounts) .* (2.5 / 2^32) .* 2;
end

function data = read_binary_sensor_data(filePath)
%READ_BINARY_SENSOR_DATA Read one electrochemical-sensor binary data file.
%
%   data = READ_BINARY_SENSOR_DATA(filePath) reads the fixed-width records
%   used in the Zeppelin sensor campaign and returns a table containing the
%   timestamp, gas-sensor ADC channels, environmental channels, supply
%   voltages and microcontroller serial-number fields.
%
%   The record layout is 71 bytes per observation. Raw ADC counts are kept
%   unchanged here; convert them separately with adc_counts_to_voltage.

arguments
    filePath (1,1) string
end

if ~isfile(filePath)
    error('read_binary_sensor_data:FileNotFound', ...
        'Binary file not found: %s', filePath);
end

recordBytes = 71;
fileInfo = dir(filePath);

if mod(fileInfo.bytes, recordBytes) ~= 0
    error('read_binary_sensor_data:UnexpectedFileSize', ...
        'File size (%d bytes) is not divisible by the expected record size (%d bytes).', ...
        fileInfo.bytes, recordBytes);
end

nRecords = fileInfo.bytes / recordBytes;

% Preallocate arrays. Using double for timestamps simplifies datetime
% construction; raw measurement channels retain their integer type.
yearValue   = zeros(nRecords,1);
monthValue  = zeros(nRecords,1);
dayValue    = zeros(nRecords,1);
hourValue   = zeros(nRecords,1);
minuteValue = zeros(nRecords,1);
secondValue = zeros(nRecords,1);

pressureRaw = zeros(nRecords,1,'uint16');

coWorkingRaw  = zeros(nRecords,1,'uint32');
coAuxRaw      = zeros(nRecords,1,'uint32');
noWorkingRaw  = zeros(nRecords,1,'uint32');
noAuxRaw      = zeros(nRecords,1,'uint32');
no2WorkingRaw = zeros(nRecords,1,'uint32');
no2AuxRaw     = zeros(nRecords,1,'uint32');
oxWorkingRaw  = zeros(nRecords,1,'uint32');
oxAuxRaw      = zeros(nRecords,1,'uint32');

temperatureLowRaw  = zeros(nRecords,1,'uint8');
temperatureHighRaw = zeros(nRecords,1,'uint8');
humidityLowRaw     = zeros(nRecords,1,'uint8');
humidityHighRaw    = zeros(nRecords,1,'uint8');

vccRaw      = zeros(nRecords,1,'uint16');
v5TotalRaw  = zeros(nRecords,1,'uint16');
v5IsbRaw    = zeros(nRecords,1,'uint16');
v4Raw       = zeros(nRecords,1,'uint16');
v3V3Raw     = zeros(nRecords,1,'uint16');

serial1 = zeros(nRecords,1,'uint32');
serial2 = zeros(nRecords,1,'uint32');
serial3 = zeros(nRecords,1,'uint32');
serial4 = zeros(nRecords,1,'uint32');

fileId = fopen(filePath,'rb');
if fileId < 0
    error('read_binary_sensor_data:OpenFailed', ...
        'Could not open binary file: %s', filePath);
end
cleanupObj = onCleanup(@() fclose(fileId)); %#ok<NASGU>

for k = 1:nRecords
    yearValue(k)   = fread(fileId,1,'*uint16');
    monthValue(k)  = fread(fileId,1,'*uint8');
    dayValue(k)    = fread(fileId,1,'*uint8');
    hourValue(k)   = fread(fileId,1,'*uint8');
    minuteValue(k) = fread(fileId,1,'*uint8');
    secondValue(k) = fread(fileId,1,'*uint8');

    pressureRaw(k) = fread(fileId,1,'*uint16');

    coWorkingRaw(k)  = fread(fileId,1,'*uint32');
    coAuxRaw(k)      = fread(fileId,1,'*uint32');
    noWorkingRaw(k)  = fread(fileId,1,'*uint32');
    noAuxRaw(k)      = fread(fileId,1,'*uint32');
    no2WorkingRaw(k) = fread(fileId,1,'*uint32');
    no2AuxRaw(k)     = fread(fileId,1,'*uint32');
    oxWorkingRaw(k)  = fread(fileId,1,'*uint32');
    oxAuxRaw(k)      = fread(fileId,1,'*uint32');

    temperatureLowRaw(k)  = fread(fileId,1,'*uint8');
    temperatureHighRaw(k) = fread(fileId,1,'*uint8');
    humidityLowRaw(k)     = fread(fileId,1,'*uint8');
    humidityHighRaw(k)    = fread(fileId,1,'*uint8');

    vccRaw(k)     = fread(fileId,1,'*uint16');
    v5TotalRaw(k) = fread(fileId,1,'*uint16');
    v5IsbRaw(k)   = fread(fileId,1,'*uint16');
    v4Raw(k)      = fread(fileId,1,'*uint16');
    v3V3Raw(k)    = fread(fileId,1,'*uint16');

    serial1(k) = fread(fileId,1,'*uint32');
    serial2(k) = fread(fileId,1,'*uint32');
    serial3(k) = fread(fileId,1,'*uint32');
    serial4(k) = fread(fileId,1,'*uint32');
end

sampleTime = datetime(yearValue, monthValue, dayValue, ...
    hourValue, minuteValue, secondValue);

data = table(sampleTime, pressureRaw, ...
    coWorkingRaw, coAuxRaw, noWorkingRaw, noAuxRaw, ...
    no2WorkingRaw, no2AuxRaw, oxWorkingRaw, oxAuxRaw, ...
    temperatureLowRaw, temperatureHighRaw, humidityLowRaw, humidityHighRaw, ...
    vccRaw, v5TotalRaw, v5IsbRaw, v4Raw, v3V3Raw, ...
    serial1, serial2, serial3, serial4, ...
    'VariableNames', { ...
    'Time','PressureRaw', ...
    'CO_WorkingRaw','CO_AuxRaw','NO_WorkingRaw','NO_AuxRaw', ...
    'NO2_WorkingRaw','NO2_AuxRaw','OX_WorkingRaw','OX_AuxRaw', ...
    'TemperatureLowRaw','TemperatureHighRaw','HumidityLowRaw','HumidityHighRaw', ...
    'VccRaw','V5TotalRaw','V5ISBRaw','V4Raw','V3V3Raw', ...
    'Serial1','Serial2','Serial3','Serial4'});
end

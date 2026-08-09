function reference = read_reference_measurements(filePath, instrument)
%READ_REFERENCE_MEASUREMENTS Read Picarro or CraNOx calibration data.
%
%   reference = READ_REFERENCE_MEASUREMENTS(filePath, "picarro") returns
%   Time, CO and H2O columns.
%
%   reference = READ_REFERENCE_MEASUREMENTS(filePath, "cranox") returns
%   Time, NO, NOx, NO2 and O3 columns.

arguments
    filePath (1,1) string
    instrument (1,1) string {mustBeMember(instrument,["picarro","cranox"])}
end

if ~isfile(filePath)
    error('read_reference_measurements:FileNotFound', ...
        'Reference file not found: %s', filePath);
end

switch instrument
    case "picarro"
        rows = readcell(filePath, 'Delimiter', ',', 'NumHeaderLines', 5);

        time = parse_time_column(rows(:,5));
        co = str2double(string(rows(:,2)));
        h2o = str2double(string(rows(:,4)));

        valid = ~isnat(time);
        reference = table(time(valid), co(valid), h2o(valid), ...
            'VariableNames', {'Time','CO_ppb','H2O_percent'});

    case "cranox"
        rows = readcell(filePath, 'Delimiter', ',', 'NumHeaderLines', 7);

        time = parse_time_column(rows(:,6));
        no = str2double(string(rows(:,2)));
        nox = str2double(string(rows(:,3)));
        no2 = str2double(string(rows(:,4)));
        o3 = str2double(string(rows(:,5)));

        valid = ~isnat(time);
        reference = table(time(valid), no(valid), nox(valid), no2(valid), o3(valid), ...
            'VariableNames', {'Time','NO_ppb','NOx_ppb','NO2_ppb','O3_ppb'});
end
end

function time = parse_time_column(rawTime)
timeText = strtrim(string(rawTime));
time = NaT(size(timeText));

formats = ["yyyy-MM-dd HH:mm:ss SSS", "yyyy-MM-dd HH:mm:ss"];
for k = 1:numel(formats)
    missing = isnat(time) & strlength(timeText) > 0;
    if ~any(missing)
        break
    end
    try
        time(missing) = datetime(timeText(missing), 'InputFormat', formats(k));
    catch
        % Keep NaT values and try the next supported format.
    end
end
end

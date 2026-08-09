%This  is a function that calculates the mean for every minute and the standard deviation

function [mean_vec, sd_vec, datetime_vec] = mean_sd_plot(x, y)
mean_vec = [];
sd_vec = [];
datetime_vec = [];

% create time vector
m = 0;
n = 1;
while m ~= 24
    datetime_vec = [datetime_vec; datetime(year(x(1)), month(x(1)), day(x(1)), m, n, 0)];
            mean_vec = [mean_vec; NaN];
            sd_vec = [sd_vec; NaN];
    
    n = n + 1;
    if n == 60
        m = m + 1;
        n = 0;
    end
end
datetime_vec = [datetime_vec; datetime(year(x(1)), month(x(1)), day(x(1))+1, 0, 0, 0)];
mean_vec = [mean_vec; NaN];
            sd_vec = [sd_vec; NaN];

buffer = y(1);  % initialization
count = 1;
for i = 2:length(x)
    %     hour(x(i)) == hour(datetime_vec(count))
    %     minute(x(i)) == minute(datetime_vec(count))
    if minute(x(i)) == mod(minute(datetime_vec(count)) - 1, 60)
        buffer = [buffer; y(i)];
    else
        count = count + 1;
        mean_vec(count) = mean(buffer);
        sd_vec(count) = std(buffer);

        buffer = [];
        buffer = y(i);
        %         pause
    end
end

figure
plot(datetime_vec, mean_vec)
errorbar(datenum(datetime_vec), mean_vec, sd_vec)
t = datenum(datetime_vec);
%xlabel('Time')
%ylabel('Gas Concentration')
datetick('x', 15)
grid on
h = gca;
%Tick locations can be set in the X/Y/ZRuler.MinorTick
h.XAxis.MinorTick = 'on'; % Must turn on minor ticks if they are off
h.XAxis.MinorTickValues = linspace(t(1), t(end), (10*24) + 1); % Minor ticks which don't line up with majors

mean_vec = mean_vec';
sd_vec = sd_vec';
datetime_vec = datetime_vec';

end
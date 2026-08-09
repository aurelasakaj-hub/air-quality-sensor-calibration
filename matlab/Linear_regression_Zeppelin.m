
warning off
%% Linear regression (y = sx+o) fit on CO data

figure('Units', 'normalized', 'Position', [0 0 1 1])
left={ mean_vec_CO_5,mean_vec_CO_5,mean_vec_CO_5,mean_vec_CO_5,mean_vec_CO_5,mean_vec_CO_5};
right={ mean_vec_CO_1,mean_vec_CO_2,mean_vec_CO_3,mean_vec_CO_4,mean_vec_CO_5,mean_vec_CO_6};
xlab=["CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2"];
ylab=["CO (ppb) St1","CO (ppb) St2", "CO (ppb) St3", "CO (ppb) St4", "CO (ppb) St5", "CO (ppb) St6"];
for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    s = coeffs(1);
    o = coeffs(2);
    subplot(3,2,i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    set(gca,'FontSize',16)
    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end

%% NO
figure('Units', 'normalized', 'Position', [0 0 1 1])
left={ mean_vec_NO_5,mean_vec_NO_5,mean_vec_NO_5,mean_vec_NO_5,mean_vec_NO_5,mean_vec_NO_5};
right={ mean_vec_NO_1,mean_vec_NO_2,mean_vec_NO_3,mean_vec_NO_4,mean_vec_NO_5,mean_vec_NO_6};
xlab=["NO (ppb) St2","NO (ppb) St2","NO (ppb) St2","NO (ppb) St2","NO (ppb) St2","NO (ppb) St2"];
ylab=["NO (ppb) St1","NO (ppb) St2","NO (ppb) St3","NO (ppb) St4","NO (ppb) St5","NO (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    s = coeffs(1);
    o = coeffs(2);
    subplot(3,2,i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    set(gca,'FontSize',16)

    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end

%% NO_2
figure('Units', 'normalized', 'Position', [0 0 1 1])
left={ mean_vec_NO2_5,mean_vec_NO2_5,mean_vec_NO2_5,mean_vec_NO2_5,mean_vec_NO2_5,mean_vec_NO2_5};
right={ mean_vec_NO2_1,mean_vec_NO2_2,mean_vec_NO2_3,mean_vec_NO2_4,mean_vec_NO2_5,mean_vec_NO2_6};
xlab=["NO_2 (ppb)St2","NO_2 (ppb) St2","NO_2 (ppb) St2","NO_2 (ppb) St2","NO_2 St2","NO_2 (ppb) St2"];
ylab=["NO_2 (ppb) St1","NO_2 (ppb) St2", "NO_2 (ppb) St3", "NO_2 (ppb) St4", "NO_2 (ppb) St5", "NO_2 (ppb) St6"];
for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    s = coeffs(1);
    o = coeffs(2);
    subplot(3,2,i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    set(gca,'FontSize',16)
    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end

%% OX
figure('Units', 'normalized', 'Position', [0 0 1 1])
left={ mean_vec_OX_5,mean_vec_OX_5,mean_vec_OX_5,mean_vec_OX_5,mean_vec_OX_5,mean_vec_OX_5};
right={ mean_vec_OX_1,mean_vec_OX_2,mean_vec_OX_3,mean_vec_OX_4,mean_vec_OX_5,mean_vec_OX_6};
xlab=["O_3 (ppb) St2","O_3 (ppb) St2","O_3 (ppb) St2","O_3 (ppb) St2","O_3 (ppb) St2","O_3 (ppb) St2"];
ylab=["O_3 (ppb) St1","O_3 (ppb) St2", "O_3 (ppb) St3", "O_3 (ppb) St4", "O_3 (ppb) St5", "O_3 (ppb) St6"];
for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    s = coeffs(1);
    o = coeffs(2);
    subplot(3,2,i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    set(gca,'FontSize',16)
    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end

function r2 = coeff_determination(x, y, s, o)

y_dash = y - mean(y);
y_hat = (s*x + o) - mean(y);

r2 = sum(y_hat.^2)./sum(y_dash.^2);
end


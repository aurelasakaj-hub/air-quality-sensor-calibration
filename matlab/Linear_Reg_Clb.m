%%CO
figure('Units', 'normalized', 'Position', [0 0 1 1])
%sgtitle('Linear regression (y = sx+o) fit on CO data','fontweight','bold','fontsize',32)

left={CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO};
right={CO_Sensor_St1,CO_Sensor_St2,CO_Sensor_St3,CO_Sensor_St4,CO_Sensor_St5,CO_Sensor_St6};
xlab=["CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro"];
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
    subplot(6,3,3*i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end
%%
%%
%%NO
figure('Units', 'normalized', 'Position', [0 0 1 1])
%sgtitle('Linear regression (y = sx+o) fit on NO data','fontweight','bold','fontsize',32)


left={NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX};
right={NO_Sensor_St1,NO_Sensor_St2,NO_Sensor_St3,NO_Sensor_St4,NO_Sensor_St5,NO_Sensor_St6};
xlab=["NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb)CraNOx","NO (ppb) CraNOx","NO (ppb) CraNOx"];
ylab=["NO (ppb) St1","NO (ppb) St2", "NO (ppb) St3", "NO (ppb) St4", "NO (ppb) St5", "NO (ppb) St6"];
for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    s = coeffs(1);
    o = coeffs(2);
    subplot(6,3,3*i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
    hold on
    t = linspace(min(x_new), max(x_new), 1000);
    plot(t, s*t+o)
    xlabel(xlab(i));
    ylabel(ylab(i));
    title(sprintf('R^2 = %.4f, s = %.4f, o = %.4f', coeff_determination(x_new, y_new, s, o), s, o))
    grid on
end

%% NO2

figure('Units', 'normalized', 'Position', [0 0 1 1])
%sgtitle('Linear regression (y = sx+o) fit on NO_2 data','fontweight','bold','fontsize',32)

left={NO2_ppb_CRANOX,NO2_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX};
right={NO2_Sensor_St1,NO2_Sensor_St2,NO2_Sensor_St3,NO2_Sensor_St4,NO2_Sensor_St5,NO2_Sensor_St6};
xlab=["NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb)CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx"];
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
    subplot(6,1,1*i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
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
%sgtitle('Linear regression (y = sx+o) fit on O_3 data','fontweight','bold','fontsize',32)

left={OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX};
right={OX_Sensor_St1,OX_Sensor_St2,OX_Sensor_St3,OX_Sensor_St4,OX_Sensor_St5,OX_Sensor_St6};
xlab=["O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb)CraNOx","O_3 (ppb) CraNOx","O_3 (ppb) CraNOx"];
ylab=["O_3 (ppb) St1","O_3 (ppb) St2", "O_3 (ppb) St3", "O_3 (ppb) St4", "O_3 (ppb) St5", "O_3 (ppb) St6"];
for i=1:length(left)
    x = left{i};
    y = right{i};
    
    % remove NaN values
    x_new = x(~isnan(x) & ~isnan(y));
    y_new = y(~isnan(x) & ~isnan(y));
    
    % Set up fittype and options.
% ft = fittype( 'poly1' );
% opts = fitoptions( 'Method', 'LinearLeastSquares' );
% opts.Robust = 'Bisquare';
% [fitresult, gof] = fit( x_new, y_new, ft, opts );

    
    coeffs = polyfit(x_new(:), y_new(:), 1);
    
    s = coeffs(1);
    o = coeffs(2);
    subplot(6,3,3*i);
    plot(x_new, y_new, 'r.', 'LineWidth', 2);
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

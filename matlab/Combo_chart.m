 
%% Combo Chart vs humidity 
% NO

figure_i2sensor = figure('name',sprintf('Voltage (v), Humidity, NO (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Humidity, NO (ppb)')
yyaxis left
plot(rel_Feuchte_Prozent_five, ADC_CH_2_NOB4_WE_Spannung_St5,'.');
set(gca,'XTickLabelRotation',45);
ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('NO (ppb)')
xlabel('Humidity (%)')

plot(rel_Feuchte_Prozent_five,NO_Gasconc_St5,'.');
set(gca,'FontSize',20)
hold on
legend('Voltage(v)','NO(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);
hold off 
%% 0X
figure_i2sensor = figure('name',sprintf('Voltage (mv), Humidity, O_3 (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Humidity, O_3 (ppb)')
yyaxis left
plot(rel_Feuchte_Prozent_five, ADC_CH_6_OXB431_WE_Spannung_St5);
%
set(gca,'XTickLabelRotation',45);

ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('O_3 (ppb)')
xlabel('Humidity (%)')

plot(rel_Feuchte_Prozent_five,OX_Gasconcentration_St5);
hold on
legend('Voltage(v)','O_3(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);
hold off 

%% CO

figure_i2sensor = figure('name',sprintf('Voltage (v), Humidity, CO (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Humidity, CO (ppb)')
yyaxis left
plot(rel_Feuchte_Prozent_three, ADC_CH_0_COB4_WE_Spannung_St3);
%
set(gca,'XTickLabelRotation',45);

ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('CO (ppb)')
xlabel('Humidity (%)')

plot(rel_Feuchte_Prozent_five,CO_Gasconcentration_St5);
hold on
legend('Voltage(mv)','NO(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);

%% NO2

figure_i2sensor = figure('name',sprintf('Voltage (mv), Humidity, NO_2 (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Humidity, NO_2 (ppb)')
yyaxis left
plot(rel_Feuchte_Prozent_five, ADC_CH_4_NO2B43F_WE_Spannung_St5);
%
set(gca,'XTickLabelRotation',45);

ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('NO_2 (ppb)')
xlabel('Humidity (%)')

plot(rel_Feuchte_Prozent_five,NO2_Gasconcentration_St5);
hold on
legend('Voltage(mv)','NO_2(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);


%% Combo chart vc Temperature 
% NO2

figure_i2sensor = figure('name',sprintf('Voltage (v), Temperature, NO_2 (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Temperature, NO_2 (ppb)')
yyaxis left
plot(Temperatur_C_five,ADC_CH_2_NOB4_WE_Spannung_St5);
%
set(gca,'XTickLabelRotation',45);

ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('NO_2 (ppb)')
xlabel('Temperature (^0C)')

plot(Temperatur_C_five,NO2_Gasconcentration_St5);
hold on
legend('Voltage(v)','NO_2(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);

 hold off

 % NO

figure_i2sensor = figure('name',sprintf('Voltage (v), Temperature, NO (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Temperature, NO (ppb)')
yyaxis left
plot(Temperatur_C_five,ADC_CH_2_NOB4_WE_Spannung_St5,'.');
set(gca,'FontSize',20)
set(gca,'XTickLabelRotation',45);
ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('NO (ppb)')
xlabel('Temperature (^0C)')

plot(Temperatur_C_five,NO_Gasconc_St5,'.');
hold on
legend('Voltage(v)','NO(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);

hold off

%% CO
figure_i2sensor = figure('name',sprintf('Voltage (v), Temperature, CO (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (mv), Temperature, CO (ppb)')
yyaxis left
plot(Temperatur_C_five,ADC_CH_0_COB4_WE_Spannung_St5);
%
set(gca,'XTickLabelRotation',45);

ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('CO (ppb)')
xlabel('Temperature (^0C)')

plot(Temperatur_C_five,CO_Gasconcentration_St5);
hold on
legend('Voltage(v)','CO(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);

hold off
%% OX
figure_i2sensor = figure('name',sprintf('Voltage (v), Temperature, O_3 (ppb) (St5)',filename),'NumberTitle','off');

set(figure_i2sensor, 'Position', [300, 150, 1024, 768]);

title('Voltage (v), Temperature, O_3 (ppb)')
yyaxis left
plot(Temperatur_C_five,ADC_CH_6_OXB431_WE_Spannung_St5);
set(gca,'XTickLabelRotation',45);
ylabel('Voltage (v)')
grid on
hold on
yyaxis right
ylabel('O_3 (ppb)')
xlabel('Temperature (^0C)')

plot(Temperatur_C_five,OX_Gasconcentration_St5);
hold on
legend('Voltage(v)','O_3(ppb)')
set(legend,...
    'Position',[0.770851373070419 0.93230881971882 0.118614716395671 0.0581778249939501]);

hold off


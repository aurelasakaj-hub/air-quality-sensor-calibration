Calculating quantile of each data set
%% O3
% St1
O3_ppb_St1 = quantile(OX_Gasconc_St1, [0 0.25 0.50 0.75 1])';
QuantilePoints = {'Minimum', '25th percentile', '50th percentile', '75th percentile', 'Maximum'}';
T = table(QuantilePoints, O3_ppb_St1);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 1)
%%

O3_ppb_St1 = quantile(OX_Selected_Conc_St2, [0 0.25 0.50 0.75 1])';
QuantilePoints = {'Minimum', '25th percentile', '50th percentile', '75th percentile', 'Maximum'}';
T = table(QuantilePoints, O3_ppb_St1);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 1)

% St2
O3_ppb_St2 = quantile(OX_Gasconcent_St2, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, O3_ppb_St2);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 2)
% St3
O3_ppb_St3 = quantile(OX_Gasconc_St3, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, O3_ppb_St3);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 3)
% St4
O3_ppb_St4 = quantile(OX_Gasconc_St4, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, O3_ppb_St4);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 4)
% St5
O3_ppb_St5 = quantile(OX_Gasconc_St5, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, O3_ppb_St5);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 5)
% St6
O3_ppb_St6 = quantile(OX_Gasconc_St6, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, O3_ppb_St6);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 6)

%% CO
% St1
CO_ppb_St1 = quantile(CO_Gasconc_St1, [0 0.25 0.50 0.75 1])';
QuantilePoints = {'Minimum', '25th percentile', '50th percentile', '75th percentile', 'Maximum'}';
T = table(QuantilePoints, CO_ppb_St1);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 7)
% St2
CO_ppb_St2 = quantile(CO_Gasconc_St2, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, CO_ppb_St2);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 8)
% St3
CO_ppb_St3 = quantile(CO_Gasconc_St3, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, CO_ppb_St3);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 9)
% St4
CO_ppb_St4 = quantile(CO_Gasconc_St4, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, CO_ppb_St4);
writetable(T, 'quantile.xlsx', 'Sheet', 10)
disp(T)
% St5
CO_ppb_St5 = quantile(CO_Gasconc_St5, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, CO_ppb_St5);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 11)
% St6
CO_ppb_St6 = quantile(CO_Gasconc_St6, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, CO_ppb_St6);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 12)

%% NO
% St1
NO_ppb_St1 = quantile(NO_Gasconc_St1, [0 0.25 0.50 0.75 1])';
QuantilePoints = {'Minimum', '25th percentile', '50th percentile', '75th percentile', 'Maximum'}';
T = table(QuantilePoints, NO_ppb_St1);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 13)
% St2
NO_ppb_St2 = quantile(NO_Gasconc_St2, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO_ppb_St2);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 14)
% St3
NO_ppb_St3 = quantile(NO_Gasconc_St3, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO_ppb_St3);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 15)
% St4
NO_ppb_St4 = quantile(NO_Gasconc_St4, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO_ppb_St4);
writetable(T, 'quantile.xlsx', 'Sheet', 16)
disp(T)
% St5
NO_ppb_St5 = quantile(NO_Gasconc_St5, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO_ppb_St5);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 17)
% St6
NO_ppb_St6 = quantile(NO_Gasconc_St6, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO_ppb_St6);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 18)

%% NO2
% St1
NO2_ppb_St1 = quantile(NO2_Gasconc_St1, [0 0.25 0.50 0.75 1])';
QuantilePoints = {'Minimum', '25th percentile', '50th percentile', '75th percentile', 'Maximum'}';
T = table(QuantilePoints, NO2_ppb_St1);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 19)
% St2
NO2_ppb_St2 = quantile(NO2_Gasconc_St2, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO2_ppb_St2);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 20)
% St3
NO2_ppb_St3 = quantile(NO2_Gasconc_St3, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO2_ppb_St3);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 21)
% St4
NO2_ppb_St4 = quantile(NO2_Gasconc_St4, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO2_ppb_St4);
writetable(T, 'quantile.xlsx', 'Sheet', 22)
disp(T)
% St5
NO2_ppb_St5 = quantile(NO2_Gasconc_St5, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO2_ppb_St5);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 23)
% St6
NO2_ppb_St6 = quantile(NO2_Gasconc_St6, [0 0.25 0.50 0.75 1])';
T = table(QuantilePoints, NO2_ppb_St6);
disp(T)
writetable(T, 'quantile.xlsx', 'Sheet', 24)
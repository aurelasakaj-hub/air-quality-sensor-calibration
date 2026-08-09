warning off
close all;

% set date
yr = "2020";
mn = "04";
dy = "18";

%load CO file 
file2_name = strcat(yr,'-',mn,'-',dy,'.csv');
T2 = readcell(file2_name,'NumHeaderLines',7);
[a2,b2] = size(T2);

datetime_CO_PICARRO = [];
CO_ppb_PICARRO = [];

for i=1:a2
    line = T2(i,:);
    ppbs = split(string(line{1,1}),",");
    ppb = double(ppbs(2));
    time = split(string(line{1,2}),":");
    datetime_CO_PICARRO = [datetime_CO_PICARRO; datetime(double(yr), double(mn), double(dy), double(time(1)), double(time(2)), double(time(3)))];
    CO_ppb_PICARRO(end+1) = ppb;
end
datetime_CO_PICARRO=datetime_CO_PICARRO';

figure;
%sgtitle('Picarro & Calibrated Sensor Data for CO','fontweight','bold','fontsize',19)
left={ CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO,CO_ppb_PICARRO};
right={mean_vec_CO_1,mean_vec_CO_2,mean_vec_CO_3,mean_vec_CO_4,mean_vec_CO_5,mean_vec_CO_6};
right_time = {datetime_vec_CO_1, datetime_vec_CO_2, datetime_vec_CO_3, datetime_vec_CO_4, datetime_vec_CO_5, datetime_vec_CO_6};
xlab=["CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro","CO (ppb) Picarro"];
ylab=["CO (ppb) St1","CO (ppb) St2","CO (ppb) St3","CO (ppb) St4","CO (ppb) St5","CO (ppb) St6"];

%Coefficient_CO=[0.417632609648574,0.417632609648574,0.417632609648574,0.417632609648574,0.417632609648574,0.417632609648574];
for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    y= [nan(sum(isnan(y)),1);y(~isnan(y))']'; %% Only for the date 21.04 this shouldn't be used

%Here I find and apply to the sensor data the correction factor based on CraNOx data
    if i == 0
        Coefficient_CO(i) = max(y)/max(x);
    else
        Coefficient_CO(i) = max(x)/max(y); 
    end
    %%setup 3 performes the best
y(y>0) = y(y>0).*Coefficient_CO(i);
y(y<0) = y(y<0).*Coefficient_CO(i); 
% 
% 
 Clb_values_CO{i} = y;
%   
%    Mean_vec_CO_1={mean_vec_CO_1};
%    Clb_values_CO(1) = Mean_vec_CO_1;
%       
Clb = Clb_values_CO{i};
    subplot(6,2,2*i);
    yyaxis left;
    plot(datetime_CO_PICARRO, x);
    ylabel('CO ppb Picarro')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))

end
%%
Clb_CO_1=Clb_values_CO{1,1};
Clb_CO_2=Clb_values_CO{1,2};
Clb_CO_3=Clb_values_CO{1,3};
Clb_CO_4=Clb_values_CO{1,4};
Clb_CO_5=Clb_values_CO{1,5};
Clb_CO_6=Clb_values_CO{1,6};

Coeff_CO = {Clb_CO_1,Clb_CO_2,Clb_CO_3,Clb_CO_4,Clb_CO_5,Clb_CO_6};

%% load NO file 
file2_name = strcat(yr,'-',mn,'-',dy,'.CRANOX.csv');
T2 = readcell(file2_name,'NumHeaderLines',7);
[a2,b2] = size(T2);

datetime_NO_CRANOX = [];
NO_ppb_CRANOX = [];

for i=1:a2
    line = T2(i,:);
    ppbs = split(string(line{1,1}),",");
    ppb = double(ppbs(2));
    time = split(string(line{1,2}),":");
    datetime_NO_CRANOX = [datetime_NO_CRANOX; datetime(double(yr), double(mn), double(dy), double(time(1)), double(time(2)), double(time(3)))];
    NO_ppb_CRANOX(end+1) = ppb;
end
datetime_NO_CRANOX=datetime_NO_CRANOX';
%
%Coefficient_NO=[0.805981866870158,0.805981866870158,0.805981866870158,0.805981866870158,0.805981866870158,0.805981866870158]
figure;
%sgtitle('CraNOx & Calibrated Sensor Data for NO','fontweight','bold','fontsize',19)
left={ NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX,NO_ppb_CRANOX};
right={mean_vec_NO_1,mean_vec_NO_2,mean_vec_NO_3,mean_vec_NO_4,mean_vec_NO_5,mean_vec_NO_6};
right_time = {datetime_vec_NO_1, datetime_vec_NO_2, datetime_vec_NO_3, datetime_vec_NO_4, datetime_vec_NO_5, datetime_vec_NO_6};
xlab=["NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb) CraNOx","NO (ppb)CraNOx"];
ylab=["NO (ppb) St1","NO (ppb) St2","NO (ppb) St3","NO (ppb) St4","NO (ppb) St5","NO (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
   y= [nan(sum(isnan(y)),1);y(~isnan(y))']'; %% Only for the date 21.04 this shouldn't be used
    
 %Here I find and apply to the sensor data the correction factor based on CraNOx data
    if i == 0
        Coefficient_NO(i) = max(y)/max(x);
    else
        Coefficient_NO(i) = max(x)/max(y); 
    end
    
y(y>0) = y(y>0).*Coefficient_NO(i);
y(y<0) = y(y<0).*Coefficient_NO(i); 

  Clb_values_NO{i} = y;
  
 Mean_vec_NO_1={mean_vec_NO_1};
 Clb_values_NO(1) = Mean_vec_NO_1;

Clb = Clb_values_NO{i};
    subplot(6,3,3*i);
    yyaxis left;
    plot(datetime_NO_CRANOX, x);
    ylabel('NO ppb CraNOx')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))

end

Clb_NO_1=Clb_values_NO{1,1};
Clb_NO_2=Clb_values_NO{1,2};
Clb_NO_3=Clb_values_NO{1,3};
Clb_NO_4=Clb_values_NO{1,4};
Clb_NO_5=Clb_values_NO{1,5};
Clb_NO_6=Clb_values_NO{1,6};
 
Coeff_NO = {Clb_NO_1,Clb_NO_2,Clb_NO_3,Clb_NO_4,Clb_NO_5,Clb_NO_6};
%%
% load NO2 file 
file2_name = strcat(yr,'-',mn,'-',dy,'.CRANOX.csv');
T2 = readcell(file2_name,'NumHeaderLines',7);
[a2,b2] = size(T2);

datetime_NO2_CRANOX = [];
NO2_ppb_CRANOX = [];

for i=1:a2
    line = T2(i,:);
    ppbs = split(string(line{1,1}),",");
    ppb = double(ppbs(2));
    time = split(string(line{1,2}),":");
    datetime_NO2_CRANOX = [datetime_NO2_CRANOX; datetime(double(yr), double(mn), double(dy), double(time(1)), double(time(2)), double(time(3)))];
    NO2_ppb_CRANOX(end+1) = ppb;
end
datetime_NO2_CRANOX=datetime_NO2_CRANOX';

figure;
%sgtitle('CraNOx & Calibrated Sensor Data for NO_2','fontweight','bold','fontsize',19)
left={ NO2_ppb_CRANOX,NO2_ppb_CRANOX,NO2_ppb_CRANOX,NO2_ppb_CRANOX,NO2_ppb_CRANOX,NO2_ppb_CRANOX};
right={mean_vec_NO2_1,mean_vec_NO2_2,mean_vec_NO2_3,mean_vec_NO2_4,mean_vec_NO2_5,mean_vec_NO2_6};
right_time = {datetime_vec_NO2_1, datetime_vec_NO2_2, datetime_vec_NO2_3, datetime_vec_NO2_4, datetime_vec_NO2_5, datetime_vec_NO2_6};
xlab=["NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb) CraNOx","NO_2 (ppb)CraNOx"];
ylab=["NO_2 (ppb) St1","NO_2 (ppb) St2","NO_2 (ppb) St3","NO_2 (ppb) St4","NO_2 (ppb) St5","NO_2 (ppb) St6"];
%%
% A1=max(mean_vec_NO2_1)-mean_vec_NO2_1+min(mean_vec_NO2_1);
% A2=max(mean_vec_NO2_2)-mean_vec_NO2_2+min(mean_vec_NO2_2);
% A3=max(mean_vec_NO2_3)-mean_vec_NO2_3+min(mean_vec_NO2_3);
% A4=max(mean_vec_NO2_4)-mean_vec_NO2_4+min(mean_vec_NO2_4);
% A5=max(mean_vec_NO2_5)-mean_vec_NO2_5+min(mean_vec_NO2_5);
% A6=max(mean_vec_NO2_6)-mean_vec_NO2_6+min(mean_vec_NO2_6);
% Right={A1,A2,A3,A4,A5,A6}
% %%

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    y= [nan(sum(isnan(y)),1);y(~isnan(y))']';  %% Only for the date 21.04.shouldn't be used
    
 %Here I find and apply to the sensor data the correction factor based on CraNOx data
    if i == 0
        Coefficient_NO2(i) = max(y)/max(x);
    else
        Coefficient_NO2(i) = max(x)/max(y); 
    end
    
y(y>0) = y(y>0).*Coefficient_NO2(i);
y(y<0) = y(y<0).*Coefficient_NO2(i); 

 Clb_values_NO2{i} = y;
 Mean_vec_NO2_1={mean_vec_NO2_1};
 Clb_values_NO2(1) = Mean_vec_NO2_1;

Clb = Clb_values_NO2{i};
% Clbb=Right{i};

    subplot(6,3,3*i);
    yyaxis left;
    plot(datetime_NO2_CRANOX, x);
    ylabel('NO_2 ppb CraNOx')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    
end

Clb_NO2_1=Clb_values_NO2{1,1};
Clb_NO2_2=Clb_values_NO2{1,2};
Clb_NO2_3=Clb_values_NO2{1,3};
Clb_NO2_4=Clb_values_NO2{1,4};
Clb_NO2_5=Clb_values_NO2{1,5};
Clb_NO2_6=Clb_values_NO2{1,6};
%%
% Clb_NO2_1=Right{1,1};
% Clb_NO2_2=Right{1,2};
% Clb_NO2_3=Right{1,3};
% Clb_NO2_4=Right{1,4};
% Clb_NO2_5=Right{1,5};
% Clb_NO2_6=Right{1,6};
%%
Coeff_NO2 = {Clb_NO2_1,Clb_NO2_2,Clb_NO2_3,Clb_NO2_4,Clb_NO2_5,Clb_NO2_6};
    
%%
% load OX file 
file2_name = strcat(yr,'-',mn,'-',dy,'.CRANOX.csv');
T2 = readcell(file2_name,'NumHeaderLines',7);
[a2,b2] = size(T2);

datetime_OX_CRANOX = [];
OX_ppb_CRANOX = [];

for i=1:a2
    line = T2(i,:);
    ppbs = split(string(line{1,1}),",");
    ppb = double(ppbs(5));
    time = split(string(line{1,2}),":");
    datetime_OX_CRANOX = [datetime_OX_CRANOX; datetime(double(yr), double(mn), double(dy), double(time(1)), double(time(2)), double(time(3)))];
    OX_ppb_CRANOX(end+1) = ppb;
end
datetime_OX_CRANOX=datetime_OX_CRANOX';

%
%Coefficient_OX=[0.176234454215361,0.176234454215361,0.176234454215361,0.176234454215361,0.176234454215361,0.176234454215361];
figure;
%sgtitle('CraNOx & Calibrated Sensor Data for OX','fontweight','bold','fontsize',19)
left={ OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX,OX_ppb_CRANOX};
right={mean_vec_OX_1,mean_vec_OX_2,mean_vec_OX_3,mean_vec_OX_4,mean_vec_OX_5,mean_vec_OX_6};
right_time = {datetime_vec_OX_1, datetime_vec_OX_2, datetime_vec_OX_3, datetime_vec_OX_4, datetime_vec_OX_5, datetime_vec_OX_6};
xlab=["O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb) CraNOx","O_3 (ppb)CraNOx"];
ylab=["O_3 (ppb) St1","O_3 (ppb) St2","O_3 (ppb) St3","O_3 (ppb) St4","O_3 (ppb) St5","O_3 (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    y= [nan(sum(isnan(y)),1);y(~isnan(y))']';  %% Only for the date 21.04. shouldn't be used
    
 %Here I find and apply to the sensor data the correction factor based on CraNOx data
    if i == 0
        Coefficient_OX(i) = max(y)/max(x);
    else
        Coefficient_OX(i) = max(x)/max(y); 
    end
    
y(y>0) = y(y>0).*Coefficient_OX(i);
y(y<0) = y(y<0).*Coefficient_OX(i); 

  Clb_values_OX{i} = y;
  Mean_vec_OX_1={mean_vec_OX_1};
  Clb_values_OX(1) = Mean_vec_OX_1;

 
Clb = Clb_values_OX{i};
    subplot(6,3,3*i);
    yyaxis left;
    plot(datetime_OX_CRANOX, x);
    ylabel('O_3 ppb CraNOx')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    
end

Clb_OX_1=Clb_values_OX{1,1};
Clb_OX_2=Clb_values_OX{1,2};
Clb_OX_3=Clb_values_OX{1,3};
Clb_OX_4=Clb_values_OX{1,4};
Clb_OX_5=Clb_values_OX{1,5};
Clb_OX_6=Clb_values_OX{1,6};

Coeff_OX = {Clb_OX_1,Clb_OX_2,Clb_OX_3,Clb_OX_4,Clb_OX_5,Clb_OX_6};

% For finding R square with curve fitting I interpolate to get the same size
%% CO
%
CO_Sensor_St1=interp1(datetime_vec_CO_1,Clb_CO_1,datetime_CO_PICARRO);
CO_Sensor_St2=interp1(datetime_vec_CO_2,Clb_CO_2,datetime_CO_PICARRO);
CO_Sensor_St3=interp1(datetime_vec_CO_3,Clb_CO_3,datetime_CO_PICARRO);
CO_Sensor_St4=interp1(datetime_vec_CO_4,Clb_CO_4,datetime_CO_PICARRO);
CO_Sensor_St5=interp1(datetime_vec_CO_5,Clb_CO_5,datetime_CO_PICARRO);
CO_Sensor_St6=interp1(datetime_vec_CO_6,Clb_CO_6,datetime_CO_PICARRO);
%%
%%NO
NO_Sensor_St1=interp1(datetime_vec_NO_1,mean_vec_NO_1,datetime_NO_CRANOX);
NO_Sensor_St2=interp1(datetime_vec_NO_2,Clb_NO_2,datetime_NO_CRANOX);
NO_Sensor_St3=interp1(datetime_vec_NO_3,Clb_NO_3,datetime_NO_CRANOX);
NO_Sensor_St4=interp1(datetime_vec_NO_4,Clb_NO_4,datetime_NO_CRANOX);
NO_Sensor_St5=interp1(datetime_vec_NO_5,Clb_NO_5,datetime_NO_CRANOX);
NO_Sensor_St6=interp1(datetime_vec_NO_6,Clb_NO_6,datetime_NO_CRANOX);

%NO2
NO2_Sensor_St1=interp1(datetime_vec_NO2_1,Clb_NO2_1,datetime_NO2_CRANOX);
NO2_Sensor_St2=interp1(datetime_vec_NO2_2,Clb_NO2_2,datetime_NO2_CRANOX);
NO2_Sensor_St3=interp1(datetime_vec_NO2_3,Clb_NO2_3,datetime_NO2_CRANOX);
NO2_Sensor_St4=interp1(datetime_vec_NO2_4,Clb_NO2_4,datetime_NO2_CRANOX);
NO2_Sensor_St5=interp1(datetime_vec_NO2_5,Clb_NO2_5,datetime_NO2_CRANOX);
NO2_Sensor_St6=interp1(datetime_vec_NO2_6,Clb_NO2_6,datetime_NO2_CRANOX);

%%OX
OX_Sensor_St1=interp1(datetime_vec_OX_1,mean_vec_OX_1,datetime_OX_CRANOX);
OX_Sensor_St2=interp1(datetime_vec_OX_2,Clb_OX_2,datetime_OX_CRANOX);
OX_Sensor_St3=interp1(datetime_vec_OX_3,Clb_OX_3,datetime_OX_CRANOX);
OX_Sensor_St4=interp1(datetime_vec_OX_4,Clb_OX_4,datetime_OX_CRANOX);
OX_Sensor_St5=interp1(datetime_vec_OX_5,Clb_OX_5,datetime_OX_CRANOX);
OX_Sensor_St6=interp1(datetime_vec_OX_6,Clb_OX_6,datetime_OX_CRANOX);

% Coefficient_CO_18=[1.13,0.3,0.42,0.069,0.3,0.3];
% Coefficient_NO_18=[2.766,1.1,1.072,0.8,0.5,0.81];
% Coefficient_NO2_18=[0.5,1.01,1.8,1.68,0.86,0.88];
% Coefficient_OX_18=[3.297,0.176,0.487,0.2,0.4,0.84];



% Coefficient_CO_17=[0.1897,0.4631,0.6221,0.0867,0.5570,0.5435];
% Coefficient_NO_17=[1.5437,2.4732,3.0759,2.3946,1.0731,2.2460];
% Coefficient_NO2_17=[0.0806,2.3612,5,0103,4.6248,1.9628,2.2162];
% Coefficient_OX_17=[1.3110,0.6451,0.8055,0.9775,0.8864,1.0419];
%%Applying the correction factors from calibration 

% Coefficient_CO=[0.1897,0.4631,0.6221,0.0867,0.5570,0.5435];
% Coefficient_NO=[1.5437,2.4732,3.0759,2.3946,1.0731,2.2460];
% Coefficient_NO2=[0.0806,2.3612,5,0103,4.6248,1.9628,2.2162];
% Coefficient_OX=[1.3110,0.6451,0.8055,0.9775,0.8864,1.0419];



%% 
% Coefficient_CO_18=[0.24,0.3,0.42,0.069,0.3,0.3];
% Coefficient_NO_18=[0.98,1.1,1.072,0.8,0.512,0.81];
% Coefficient_NO2_18=[1.2,1.01,1.8,1.68,0.86,0.88];
% Coefficient_OX_18=[0.3,0.176,0.487,0.2,0.4,0.84];

%%Ox
% Best performance
% Setup 2 *Setup 3
% Coefficient_OX_18_st2=[0.176,0.176,0.176,0.176,0.176,0.176];


%%NO2
% Best performance
% Setup 2,5 *Setup 3
% Coefficient_NO2_18_St_2=[1.01,1.01,1.01,1.01,1.01,1.01];
% Coefficient_NO2_18_St5=[0.86,0.86,0.86,0.86,0.86,0.86];

%CO
% Setup 2 or Setup 3 *Setup 4

% Coefficient_CO_18_St2=[0.3,0.3,0.3,0.3,0.3,0.3];
% Coefficient_CO_18_St3=[0.42,0.42,0.42,0.42,0.42,0.42];
% Coefficient_CO_18_St4=[0.069,0.069,0.069,0.069,0.069,0.069]; R2=0.9398

%NO
%Setup 5 
% Coefficient_NO_18_St5=[0.512,0.512,0.512,0.512,0.512,0.512];



 Coefficient_CO_18=[0.069,0.069,0.069,0.069,0.069,0.069]; %Setup 4
 
 Coefficient_NO_18=[1.072,1.072,1.072,1.072,1.072,1.072]; %Setup 3

 Coefficient_NO2_18=[1.01,1.01,1.01,1.01,1.01,1.01]; %Setup 2

 Coefficient_OX_18=[0.487,0.487,0.487,0.487,0.487,0.487]; %Setup 3

figure;
left={CO_Gasconcentration_St1,CO_Gasconcentration_St2,CO_Gasconcentration_St3,CO_Gasconcentration_St4,CO_Gasconcentration_St5,CO_Gasconcentration_St6};
right={CO_Gasconcentration_St1,CO_Gasconcentration_St2,CO_Gasconcentration_St3,CO_Gasconcentration_St4,CO_Gasconcentration_St5,CO_Gasconcentration_St6};
right_time = {Timestamp_One,Timestamp_Two, Timestamp_Three,Timestamp_Four,Timestamp_Five,Timestamp_Six};
xlab=["CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2","CO (ppb) St2"];
ylab=["CO (ppb) St1","CO (ppb) St2", "CO (ppb) St3", "CO (ppb) St4", "CO (ppb) St5", "CO (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    
 %%Here I apply to the sensor data the correction factor based on Picarro data
    
y(y>0) = y(y>0).*Coefficient_CO_18(i);
y(y<0) = y(y<0).*Coefficient_CO_18(i); 

 Clb_values_CO_18{i} = y;
 
Clb = Clb_values_CO_18{i};
    subplot(6,1,1*i);
    yyaxis left;
    plot(t, x);
    ylabel('CO ppb Picarro')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    
end

CO_Gasconc_St1=Clb_values_CO_18{1,1};
CO_Gasconc_St2=Clb_values_CO_18{1,2};
CO_Gasconc_St3=Clb_values_CO_18{1,3};
CO_Gasconc_St4=Clb_values_CO_18{1,4};
CO_Gasconc_St5=Clb_values_CO_18{1,5};
CO_Gasconc_St6=Clb_values_CO_18{1,6};

%% NO

left={NO_Gasconcentration_St1,NO_Gasconcentration_St2,NO_Gasconcentration_St3,NO_Gasconcentration_St4,NO_Gasconcentration_St5,NO_Gasconcentration_St6};
right={NO_Gasconcentration_St1,NO_Gasconcentration_St2,NO_Gasconcentration_St3,NO_Gasconcentration_St4,NO_Gasconcentration_St5,NO_Gasconcentration_St6};
right_time = {Timestamp_One,Timestamp_Two,Timestamp_Three,Timestamp_Four,Timestamp_Five,Timestamp_Six};
xlab=["NO (ppb) St1","NO (ppb) St2","NO (ppb) St3","NO (ppb) St4","NO (ppb) St5","NO (ppb) St6"];
ylab=["NO (ppb) St1","NO (ppb) St2","NO (ppb) St3","NO (ppb) St4","NO (ppb) St5","NO (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    
 %%Here I apply to the sensor data the correction factor based on Picarro data
    
y(y>0) = y(y>0).*Coefficient_NO_18(i);
y(y<0) = y(y<0).*Coefficient_NO_18(i); 

 Clb_values_NO_18{i} = y;
 
Clb = Clb_values_NO_18{i};
    subplot(6,1,1*i);
   yyaxis left;
    plot(t, x);
    ylabel(ylab(i))
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    lgd=legend ({'Original data','Calibrated data'},'Location','northwest')
    lgd.FontSize = 8;
   
%     subplot(1,1,1);
%     yyaxis left;
%     plot(Timestamp_Five, NO_Gasconcentration_St5);
%     ylabel('NO ppb St5')
%     yyaxis right;
%     plot(Timestamp_Five,NO_Gasconc_St5);
%     ylabel('NO ppb St5')
%     lgd=legend ({'Original data','Calibrated data'},'Location','northwest')
%     lgd.FontSize = 12;
    
end

NO_Gasconc_St1=Clb_values_NO_18{1,1};
NO_Gasconc_St2=Clb_values_NO_18{1,2};
NO_Gasconc_St3=Clb_values_NO_18{1,3};
NO_Gasconc_St4=Clb_values_NO_18{1,4};
NO_Gasconc_St5=Clb_values_NO_18{1,5};
NO_Gasconc_St6=Clb_values_NO_18{1,6};




%%
%%NO2
figure;
%sgtitle('CraNOx & Calibrated Sensor Data for NO_2','fontweight','bold','fontsize',19)
left={NO2_Gasconcentration_St1,NO2_Gasconcentration_St2,NO2_Gasconcentration_St3,NO2_Gasconcentration_St4,NO2_Gasconcentration_St5,NO2_Gasconcentration_St6};
right={NO2_Gasconcentration_St1,NO2_Gasconcentration_St2,NO2_Gasconcentration_St3,NO2_Gasconcentration_St4,NO2_Gasconcentration_St5,NO2_Gasconcentration_St6};
right_time = {Timestamp_One,Timestamp_Two,Timestamp_Three,Timestamp_Four,Timestamp_Five,Timestamp_Six};
xlab=["NO_2 (ppb)","NO_2 (ppb) ","NO_2 (ppb) ","NO_2 (ppb) ","NO_2 (ppb) ","NO_2 (ppb)"];
ylab=["NO_2 (ppb) St1","NO_2 (ppb) St2","NO_2 (ppb) St3","NO_2 (ppb) St4","NO_2 (ppb) St5","NO_2 (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};    
 %Here I find and apply to the sensor data the correction factor based on CraNOx data
    
y(y>0) = y(y>0).*Coefficient_NO2_18(i);
y(y<0) = y(y<0).*Coefficient_NO2_18(i); 

 Clb_values_NO2_18{i} = y;

Clb = Clb_values_NO2_18{i};
    subplot(6,1,1*i);
    yyaxis left;
    plot(t, x);
    ylabel('NO_2 ppb CraNOx')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    
end

NO2_Gasconc_St1=Clb_values_NO2_18{1,1};
NO2_Gasconc_St2=Clb_values_NO2_18{1,2};
NO2_Gasconc_St3=Clb_values_NO2_18{1,3};
NO2_Gasconc_St4=Clb_values_NO2_18{1,4};
NO2_Gasconc_St5=Clb_values_NO2_18{1,5};
NO2_Gasconc_St6=Clb_values_NO2_18{1,6};
 
%% OX
figure;
%sgtitle('CraNOx & Calibrated Sensor Data for OX','fontweight','bold','fontsize',19)
left={OX_Gasconcentration_St1,OX_Gasconcentration_St2,OX_Gasconcentration_St3,OX_Gasconcentration_St4,OX_Gasconcentration_St5,OX_Gasconcentration_St6};
right={OX_Gasconcentration_St1,OX_Gasconcentration_St2,OX_Gasconcentration_St3,OX_Gasconcentration_St4,OX_Gasconcentration_St5,OX_Gasconcentration_St6};
right_time = {Timestamp_One,Timestamp_Two,Timestamp_Three,Timestamp_Four,Timestamp_Five,Timestamp_Six};
xlab=["O_3 (ppb)","O_3 (ppb)","O_3 (ppb)","O_3 (ppb)","O_3 (ppb)","O_3 (ppb)"];
ylab=["O_3 (ppb) St1","O_3 (ppb) St2","O_3 (ppb) St3","O_3 (ppb) St4","O_3 (ppb) St5","O_3 (ppb) St6"];

for i=1:length(left)
    x = left{i};
    y = right{i};
    t = right_time{i};
    
 %Here I find and apply to the sensor data the correction factor based on CraNOx data
   
y(y>0) = y(y>0).*Coefficient_OX_18(i);
y(y<0) = y(y<0).*Coefficient_OX_18(i); 

 Clb_values_OX_18{i} = y;
 
Clb = Clb_values_OX_18{i};
    subplot(6,1,1*i);
    yyaxis left;
    plot(t, x);
    ylabel('O_3 ppb CraNOx')
    yyaxis right;
    plot(t,Clb);
    ylabel(ylab(i))
    
end

OX_Gasconc_St1=Clb_values_OX_18{1,1};
OX_Gasconc_St2=Clb_values_OX_18{1,2};
OX_Gasconc_St3=Clb_values_OX_18{1,3};
OX_Gasconc_St4=Clb_values_OX_18{1,4};
OX_Gasconc_St5=Clb_values_OX_18{1,5};
OX_Gasconc_St6=Clb_values_OX_18{1,6};


% Here I read into variables all the csv files that are in the path. Each
% column of the csv has the data for one channel. I save them with endings
% St1,St2 ect to use them later.

Csv_1=csvread('Setup_1.csv');

ADC_CH_2_NOB4_WE_St1=Csv_1(:,1)'; 
ADC_CH_3_NOB4_AUX_St1=Csv_1(:,2)';
ADC_CH_0_COB4_WE_St1=Csv_1(:,3)'; 
ADC_CH_1_COB4_AUX_St1=Csv_1(:,4)'; 
ADC_CH_4_NO2B43F_WE_St1=Csv_1(:,7)';
ADC_CH_5_NO2B43F_AUX_St1=Csv_1(:,8)';
ADC_CH_6_OXB431_WE_St1=Csv_1(:,5)'; 
ADC_CH_7_OXB431_AUX_St1=Csv_1(:,6)'; 


%%
Csv_2=csvread('Setup_2.csv');

ADC_CH_0_COB4_WE_St2=Csv_2(:,1)';
ADC_CH_1_COB4_AUX_St2=Csv_2(:,2)';
ADC_CH_2_NOB4_WE_St2=Csv_2(:,3)';
ADC_CH_3_NOB4_AUX_St2=Csv_2(:,4)';
ADC_CH_4_NO2B43F_WE_St2=Csv_2(:,5)';
ADC_CH_5_NO2B43F_AUX_St2=Csv_2(:,6)';
ADC_CH_6_OXB431_WE_St2=Csv_2(:,7)';
ADC_CH_7_OXB431_AUX_St2=Csv_2(:,8)';

Csv_3=csvread('Setup_3.csv');

ADC_CH_0_COB4_WE_St3=Csv_3(:,1)';
ADC_CH_1_COB4_AUX_St3=Csv_3(:,2)';
ADC_CH_2_NOB4_WE_St3=Csv_3(:,3)';
ADC_CH_3_NOB4_AUX_St3=Csv_3(:,4)';
ADC_CH_4_NO2B43F_WE_St3=Csv_3(:,5)';
ADC_CH_5_NO2B43F_AUX_St3=Csv_3(:,6)';
ADC_CH_6_OXB431_WE_St3=Csv_3(:,7)';
ADC_CH_7_OXB431_AUX_St3=Csv_3(:,8)';

% 
Csv_4=csvread('Setup_4.csv');

ADC_CH_0_COB4_WE_St4=Csv_4(:,1)';
ADC_CH_1_COB4_AUX_St4=Csv_4(:,2)';
ADC_CH_2_NOB4_WE_St4=Csv_4(:,3)';
ADC_CH_3_NOB4_AUX_St4=Csv_4(:,4)';
ADC_CH_4_NO2B43F_WE_St4=Csv_4(:,5)';
ADC_CH_5_NO2B43F_AUX_St4=Csv_4(:,6)';
ADC_CH_6_OXB431_WE_St4=Csv_4(:,7)';
ADC_CH_7_OXB431_AUX_St4=Csv_4(:,8)';

 Csv_5=csvread('Setup_5.csv');
 
ADC_CH_0_COB4_WE_St5=Csv_5(:,1)';
ADC_CH_1_COB4_AUX_St5=Csv_5(:,2)';
ADC_CH_2_NOB4_WE_St5=Csv_5(:,3)';
ADC_CH_3_NOB4_AUX_St5=Csv_5(:,4)';
ADC_CH_4_NO2B43F_WE_St5=Csv_5(:,5)';
ADC_CH_5_NO2B43F_AUX_St5=Csv_5(:,6)';
ADC_CH_6_OXB431_WE_St5=Csv_5(:,7)';
ADC_CH_7_OXB431_AUX_St5=Csv_5(:,8)';


% 
Csv_6=csvread('Setup_6.csv');

ADC_CH_0_COB4_WE_St6=Csv_6(:,1)';
ADC_CH_1_COB4_AUX_St6=Csv_6(:,2)';
ADC_CH_2_NOB4_WE_St6=Csv_6(:,3)';
ADC_CH_3_NOB4_AUX_St6=Csv_6(:,4)';
ADC_CH_4_NO2B43F_WE_St6=Csv_6(:,5)';
ADC_CH_5_NO2B43F_AUX_St6=Csv_6(:,6)';
ADC_CH_6_OXB431_WE_St6=Csv_6(:,7)';
ADC_CH_7_OXB431_AUX_St6=Csv_6(:,8)';


%b,c,d,e,f,g tells the amount of data for each setup and each column (first columns in this case). I will use this in the for loop to organize the timestamp for each setup.

b=size(Csv_1(:,1),1);
c=size(Csv_2(:,1),1);
d=size(Csv_3(:,1),1);
e=size(Csv_4(:,1),1);
f=size(Csv_5(:,1),1);
g=size(Csv_6(:,1),1);

%I organize the Zeitstempel in the datetime format for each setup . 

Zeitstempel_String = int2str(setup_1_Zeitstempel);
b=b+1;
for Timestamp_one=1:(b-1)
    Timestamp_One(Timestamp_one) = datetime(setup_1_Zeitstempel(Timestamp_one,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_one=Timestamp_one+1;
end

Zeitstempel_String = int2str(setup_2_Zeitstempel);
c=c+1;
for Timestamp_two=1:(c-1)
    Timestamp_Two(Timestamp_two) = datetime(setup_2_Zeitstempel(Timestamp_two,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_two=Timestamp_two+1;
end

Zeitstempel_String = int2str(setup_3_Zeitstempel);

d=d+1;
for Timestamp_three=1:(d-1)
    Timestamp_Three(Timestamp_three) = datetime(setup_3_Zeitstempel(Timestamp_three,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_three=Timestamp_three+1;
end

Zeitstempel_String = int2str(setup_4_Zeitstempel);
e=e+1;
for Timestamp_four=1:(e-1)
    Timestamp_Four(Timestamp_four) = datetime(setup_4_Zeitstempel(Timestamp_four,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_four=Timestamp_four+1;
end

Zeitstempel_String = int2str(setup_5_Zeitstempel);
f=f+1;
for Timestamp_five=1:(f-1)
    Timestamp_Five(Timestamp_five) = datetime(setup_5_Zeitstempel(Timestamp_five,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_five=Timestamp_five+1;
end

Zeitstempel_String = int2str(setup_6_Zeitstempel);
g=g+1;
for Timestamp_six=1:(g-1)
    Timestamp_Six(Timestamp_six) = datetime(setup_6_Zeitstempel(Timestamp_six,:),'InputFormat','yyyy MM dd HH mm ss');
    Timestamp_six=Timestamp_six+1;

end
toc


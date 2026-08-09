

%In this section I read into variables the low and high temperature for
%each setup. They are saved first with names setup_1, setup_2,
%setup_3,setup_4, setup_5, setup_6. Each column has one variable. First
%Temperatur_Low,Second Temperature_High, Third rel_Feuchte_LOW and Fourth
%rel_Feuchte_High.

tic

Temperatur_LOW_one=Setup_1(:,2)';
Temperatur_LOW_two=Setup_2(:,2)';
Temperatur_LOW_three=Setup_3(:,2)';
Temperatur_LOW_four=Setup_4(:,2)';
Temperatur_LOW_five=Setup_5(:,2)';
Temperatur_LOW_six=Setup_6(:,2)';

Temperatur_HIGH_one=Setup_1(:,3)';
Temperatur_HIGH_two=Setup_2(:,3)';
Temperatur_HIGH_three=Setup_3(:,3)';
Temperatur_HIGH_four=Setup_4(:,3)';
Temperatur_HIGH_five=Setup_5(:,3)';
Temperatur_HIGH_six=Setup_6(:,3)';

rel_Feuchte_LOW_one=Setup_1(:,4)';
rel_Feuchte_LOW_two=Setup_2(:,4)';
rel_Feuchte_LOW_three=Setup_3(:,4)';
rel_Feuchte_LOW_four=Setup_4(:,4)';
rel_Feuchte_LOW_five=Setup_5(:,4)';
rel_Feuchte_LOW_six=Setup_6(:,4)';

rel_Feuchte_HIGH_one=Setup_1(:,5)';
rel_Feuchte_HIGH_two=Setup_2(:,5)';
rel_Feuchte_HIGH_three=Setup_3(:,5)';
rel_Feuchte_HIGH_four=Setup_4(:,5)';
rel_Feuchte_HIGH_five=Setup_5(:,5)';
rel_Feuchte_HIGH_six=Setup_6(:,5)';

%Berechnung der rel. Feuchte und Temperatur

% High Byte der rel. Feuchte muss maskiert werden, da im Datenblatt nur die
% ersten 5 Bits genutzt werden!

Bitmaske_rel_Feuchte_high_byte = 63;
Feuchte_rel_HIGH_masked_one = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_one);
Feuchte_rel_HIGH_masked_two = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_two);
Feuchte_rel_HIGH_masked_three = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_three);
Feuchte_rel_HIGH_masked_four = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_four);
Feuchte_rel_HIGH_masked_five = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_five);
Feuchte_rel_HIGH_masked_six = bitand(Bitmaske_rel_Feuchte_high_byte(1,1), rel_Feuchte_HIGH_six);

% Konvertierung in double

Feuchte_rel_HIGH_masked_one = double(Feuchte_rel_HIGH_masked_one);
Feuchte_rel_HIGH_masked_two = double(Feuchte_rel_HIGH_masked_two);
Feuchte_rel_HIGH_masked_three = double(Feuchte_rel_HIGH_masked_three);
Feuchte_rel_HIGH_masked_four = double(Feuchte_rel_HIGH_masked_four);
Feuchte_rel_HIGH_masked_five = double(Feuchte_rel_HIGH_masked_five);
Feuchte_rel_HIGH_masked_six = double(Feuchte_rel_HIGH_masked_six);

rel_Feuchte_LOW_one = double(rel_Feuchte_LOW_one);
rel_Feuchte_LOW_two = double(rel_Feuchte_LOW_two);
rel_Feuchte_LOW_three = double(rel_Feuchte_LOW_three);
rel_Feuchte_LOW_four = double(rel_Feuchte_LOW_four);
rel_Feuchte_LOW_five = double(rel_Feuchte_LOW_five);
rel_Feuchte_LOW_six = double(rel_Feuchte_LOW_six);

Temperatur_HIGH_one = double(Temperatur_HIGH_one);
Temperatur_HIGH_two = double(Temperatur_HIGH_two);
Temperatur_HIGH_three = double(Temperatur_HIGH_three);
Temperatur_HIGH_four = double(Temperatur_HIGH_four);
Temperatur_HIGH_five = double(Temperatur_HIGH_five);
Temperatur_HIGH_six= double(Temperatur_HIGH_six);


Temperatur_LOW_one = double(Temperatur_LOW_one);
Temperatur_LOW_two = double(Temperatur_LOW_two);
Temperatur_LOW_three = double(Temperatur_LOW_three);
Temperatur_LOW_four= double(Temperatur_LOW_four);
Temperatur_LOW_five = double(Temperatur_LOW_five);
Temperatur_LOW_six= double(Temperatur_LOW_six);



% Berechnung der Temperatur und Feuchte mit maskierten Zahlen (siehe
% Datenblatt) Feuchte und Temperatursensor 

for temp=1:(b-1)
    Temperatur_C_one(1,temp) = ( Temperatur_HIGH_one(1,temp)*64+Temperatur_LOW_one(1,temp)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_one(1,temp) =  (Feuchte_rel_HIGH_masked_one(1,temp)*256+rel_Feuchte_LOW_one(1,temp))/2^14*100;
end
%
for tempc=1:(c-1)
    Temperatur_C_two(1,tempc) = ( Temperatur_HIGH_two(1,tempc)*64+Temperatur_LOW_two(1,tempc)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_two(1,tempc) =  (Feuchte_rel_HIGH_masked_two(1,tempc)*256+rel_Feuchte_LOW_two(1,tempc))/2^14*100;
end

for tempd=1:(d-1)
    Temperatur_C_three(1,tempd) = ( Temperatur_HIGH_three(1,tempd)*64+Temperatur_LOW_three(1,tempd)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_three(1,tempd) =  (Feuchte_rel_HIGH_masked_three(1,tempd)*256+rel_Feuchte_LOW_three(1,tempd))/2^14*100;
end

for tempe=1:(e-1)
    Temperatur_C_four(1,tempe) = ( Temperatur_HIGH_four(1,tempe)*64+Temperatur_LOW_four(1,tempe)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_four(1,tempe) =  (Feuchte_rel_HIGH_masked_four(1,tempe)*256+rel_Feuchte_LOW_four(1,tempe))/2^14*100;
end

for tempf=1:(f-1)
    Temperatur_C_five(1,tempf) = ( Temperatur_HIGH_five(1,tempf)*64+Temperatur_LOW_five(1,tempf)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_five(1,tempf) =  (Feuchte_rel_HIGH_masked_five(1,tempf)*256+rel_Feuchte_LOW_five(1,tempf))/2^14*100;
end
%
for tempg=1:(g-1)
    Temperatur_C_six(1,tempg) = ( Temperatur_HIGH_six(1,tempg)*64+Temperatur_LOW_six(1,tempg)/4)/(2^14)*165-40;
    rel_Feuchte_Prozent_six(1,tempg) =  (Feuchte_rel_HIGH_masked_six(1,tempg)*256+rel_Feuchte_LOW_six(1,tempg))/2^14*100;
end

%% Spannungen Plotten

%Werte in double

Spannung_3_3_V = double(Spannung_3_3_V);
Spannung_4V = double(Spannung_4V);
Spannung_5V_gesamt=double(Spannung_5V_gesamt);
Spannung_5V_ISB = double(Spannung_5V_ISB);
Spannung_VCC_Akku_oder_Netz = double(Spannung_VCC_Akku_oder_Netz);
% 
% %Spannungsteiler-Faktoren
 faktor_3_3_V=(11000+4750)/4750;
 faktor_4V=(15000+5100)/5100;
 faktor_5V_gesamt=(12100+3100)/3100;
 faktor_5V_ISB=(12100+3100)/3100;
 faktor_VCC_Akku_oder_Netz=(20000+2750)/2750;
 
%%
% ADC Channel
% Konvertierung in double

 ADC_CH_0_COB4_WE_St1 = double(ADC_CH_0_COB4_WE_St1);
 ADC_CH_0_COB4_WE_St2 = double(ADC_CH_0_COB4_WE_St2);
 ADC_CH_0_COB4_WE_St3 = double(ADC_CH_0_COB4_WE_St3);
 ADC_CH_0_COB4_WE_St4 = double(ADC_CH_0_COB4_WE_St4);
 ADC_CH_0_COB4_WE_St5 = double(ADC_CH_0_COB4_WE_St5);
 ADC_CH_0_COB4_WE_St6 = double(ADC_CH_0_COB4_WE_St6);
 
ADC_CH_1_COB4_AUX_St1 = double(ADC_CH_1_COB4_AUX_St1);
ADC_CH_1_COB4_AUX_St2 = double(ADC_CH_1_COB4_AUX_St2);
ADC_CH_1_COB4_AUX_St3 = double(ADC_CH_1_COB4_AUX_St3);
ADC_CH_1_COB4_AUX_St4 = double(ADC_CH_1_COB4_AUX_St4);
ADC_CH_1_COB4_AUX_St5 = double(ADC_CH_1_COB4_AUX_St5);
ADC_CH_1_COB4_AUX_St6 = double(ADC_CH_1_COB4_AUX_St6);

 ADC_CH_2_NOB4_WE_St1= double(ADC_CH_2_NOB4_WE_St1);
 ADC_CH_2_NOB4_WE_St2= double(ADC_CH_2_NOB4_WE_St2);
 ADC_CH_2_NOB4_WE_St3= double(ADC_CH_2_NOB4_WE_St3);
 ADC_CH_2_NOB4_WE_St4= double(ADC_CH_2_NOB4_WE_St4);
 ADC_CH_2_NOB4_WE_St5= double(ADC_CH_2_NOB4_WE_St5);
 ADC_CH_2_NOB4_WE_St6= double(ADC_CH_2_NOB4_WE_St6);

 ADC_CH_3_NOB4_AUX_St1 = double(ADC_CH_3_NOB4_AUX_St1);
 ADC_CH_3_NOB4_AUX_St2 = double(ADC_CH_3_NOB4_AUX_St2);
 ADC_CH_3_NOB4_AUX_St3 = double(ADC_CH_3_NOB4_AUX_St3);
 ADC_CH_3_NOB4_AUX_St4 = double(ADC_CH_3_NOB4_AUX_St4);
 ADC_CH_3_NOB4_AUX_St5 = double(ADC_CH_3_NOB4_AUX_St5);
 ADC_CH_3_NOB4_AUX_St6 = double(ADC_CH_3_NOB4_AUX_St6);

 ADC_CH_4_NO2B43F_WE_St1 = double(ADC_CH_4_NO2B43F_WE_St1);
 ADC_CH_4_NO2B43F_WE_St2 = double(ADC_CH_4_NO2B43F_WE_St2);
 ADC_CH_4_NO2B43F_WE_St3 = double(ADC_CH_4_NO2B43F_WE_St3);
 ADC_CH_4_NO2B43F_WE_St4 = double(ADC_CH_4_NO2B43F_WE_St4);
 ADC_CH_4_NO2B43F_WE_St5 = double(ADC_CH_4_NO2B43F_WE_St5);
 ADC_CH_4_NO2B43F_WE_St6 = double(ADC_CH_4_NO2B43F_WE_St6);
 
 ADC_CH_5_NO2B43F_AUX_St1 = double(ADC_CH_5_NO2B43F_AUX_St1);
 ADC_CH_5_NO2B43F_AUX_St2 = double(ADC_CH_5_NO2B43F_AUX_St2);
 ADC_CH_5_NO2B43F_AUX_St3 = double(ADC_CH_5_NO2B43F_AUX_St3);
 ADC_CH_5_NO2B43F_AUX_St4 = double(ADC_CH_5_NO2B43F_AUX_St4);
 ADC_CH_5_NO2B43F_AUX_St5 = double(ADC_CH_5_NO2B43F_AUX_St5);
 ADC_CH_5_NO2B43F_AUX_St6 = double(ADC_CH_5_NO2B43F_AUX_St6);


 ADC_CH_6_OXB431_WE_St1 = double(ADC_CH_6_OXB431_WE_St1);
 ADC_CH_6_OXB431_WE_St2 = double(ADC_CH_6_OXB431_WE_St2);
 ADC_CH_6_OXB431_WE_St3= double(ADC_CH_6_OXB431_WE_St3);
 ADC_CH_6_OXB431_WE_St4 = double(ADC_CH_6_OXB431_WE_St4);
 ADC_CH_6_OXB431_WE_St5 = double(ADC_CH_6_OXB431_WE_St5);
 ADC_CH_6_OXB431_WE_St6= double(ADC_CH_6_OXB431_WE_St6);
 
 ADC_CH_7_OXB431_AUX_St1 = double(ADC_CH_7_OXB431_AUX_St1);
 ADC_CH_7_OXB431_AUX_St2= double(ADC_CH_7_OXB431_AUX_St2);
 ADC_CH_7_OXB431_AUX_St3= double(ADC_CH_7_OXB431_AUX_St3);
 ADC_CH_7_OXB431_AUX_St4 = double(ADC_CH_7_OXB431_AUX_St4);
 ADC_CH_7_OXB431_AUX_St5= double(ADC_CH_7_OXB431_AUX_St5);
 ADC_CH_7_OXB431_AUX_St6= double(ADC_CH_7_OXB431_AUX_St6);

%%
for laufvar_adc_b=1:(b-1)
ADC_CH_0_COB4_WE_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_0_COB4_WE_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_1_COB4_AUX_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_2_NOB4_WE_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_3_NOB4_AUX_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_4_NO2B43F_WE_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_5_NO2B43F_AUX_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_6_OXB431_WE_St1(1,laufvar_adc_b)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St1(1,laufvar_adc_b) =  ADC_CH_7_OXB431_AUX_St1(1,laufvar_adc_b)*2.5/2^32*2;
end
 
for laufvar_adc_c=1:(c-1)
ADC_CH_0_COB4_WE_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_0_COB4_WE_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_1_COB4_AUX_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_2_NOB4_WE_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_3_NOB4_AUX_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_4_NO2B43F_WE_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_5_NO2B43F_AUX_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_6_OXB431_WE_St2(1,laufvar_adc_c)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St2(1,laufvar_adc_c) =  ADC_CH_7_OXB431_AUX_St2(1,laufvar_adc_c)*2.5/2^32*2;
 end
 
 
 for laufvar_adc_d=1:(d-1)
ADC_CH_0_COB4_WE_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_0_COB4_WE_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_1_COB4_AUX_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_2_NOB4_WE_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_3_NOB4_AUX_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_4_NO2B43F_WE_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_5_NO2B43F_AUX_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_6_OXB431_WE_St3(1,laufvar_adc_d)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St3(1,laufvar_adc_d) =  ADC_CH_7_OXB431_AUX_St3(1,laufvar_adc_d)*2.5/2^32*2;
 end

 
  for laufvar_adc_e=1:(e-1)
ADC_CH_0_COB4_WE_Spannung_St4(1,laufvar_adc_e) =      ADC_CH_0_COB4_WE_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St4(1,laufvar_adc_e) =     ADC_CH_1_COB4_AUX_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St4(1,laufvar_adc_e) =      ADC_CH_2_NOB4_WE_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St4(1,laufvar_adc_e) =     ADC_CH_3_NOB4_AUX_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St4(1,laufvar_adc_e) =   ADC_CH_4_NO2B43F_WE_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St4(1,laufvar_adc_e) =  ADC_CH_5_NO2B43F_AUX_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St4(1,laufvar_adc_e) =    ADC_CH_6_OXB431_WE_St4(1,laufvar_adc_e)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St4(1,laufvar_adc_e) =   ADC_CH_7_OXB431_AUX_St4(1,laufvar_adc_e)*2.5/2^32*2;
  end
 
   for laufvar_adc_f=1:(f-1)
ADC_CH_0_COB4_WE_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_0_COB4_WE_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_1_COB4_AUX_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_2_NOB4_WE_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_3_NOB4_AUX_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_4_NO2B43F_WE_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_5_NO2B43F_AUX_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_6_OXB431_WE_St5(1,laufvar_adc_f)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St5(1,laufvar_adc_f) =  ADC_CH_7_OXB431_AUX_St5(1,laufvar_adc_f)*2.5/2^32*2;
   end
  
     for laufvar_adc_g=1:(g-1)
ADC_CH_0_COB4_WE_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_0_COB4_WE_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_1_COB4_AUX_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_1_COB4_AUX_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_2_NOB4_WE_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_2_NOB4_WE_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_3_NOB4_AUX_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_3_NOB4_AUX_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_4_NO2B43F_WE_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_4_NO2B43F_WE_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_5_NO2B43F_AUX_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_5_NO2B43F_AUX_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_6_OXB431_WE_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_6_OXB431_WE_St6(1,laufvar_adc_g)*2.5/2^32*2;
ADC_CH_7_OXB431_AUX_Spannung_St6(1,laufvar_adc_g) =  ADC_CH_7_OXB431_AUX_St6(1,laufvar_adc_g)*2.5/2^32*2;
  end
 
	toc
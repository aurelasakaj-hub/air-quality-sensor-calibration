clc;
clear;
close all;
folder = dir('S*_*');
for i = 1 : length(folder)
    clear a;clear ADC_CH_0_COB4_WE;clear ADC_CH_1_COB4_AUX;clear ADC_CH_2_NOB4_WE;clear ADC_CH_3_NOB4_AUX;
    clear ADC_CH_4_NO2B43F_WE;clear ADC_CH_5_NO2B43F_AUX;clear ADC_CH_6_OXB431_WE;clear ADC_CH_7_OXB431_AUX;
%     clear Zeitstempel; 
%     clear Temperatur_LOW; clear Temperatur_HIGH; clear rel_Feuchte_LOW; clear rel_Feuchte_HIGH; clear Spannung_VCC_Akku_oder_Netz;
%     clear Spannung_5V_gesamt; clear Spannung_5V_ISB; clear Spannung_4V; clear Spannung_3_3_V; clear Seriennummer_uC_1; clear Seriennummer_uC_2;
%     clear Seriennummer_uC_3; clear Seriennummer_uC_4;
	fprintf('Processing Folder No.%d = %s\n', i, folder(i).name);
	subfolder = dir(strcat(folder(i).name,'/*'));
    subfolder = subfolder(3); 
    files = dir(strcat(folder(i).name,'/',subfolder.name,'/*.bin'));
    for j = 1:length(files)
       
%         disp(files(j).name);
        filename = strcat(folder(i).name,'/',subfolder.name,'/',files(j).name);
%         disp(filename);
        fileID = fopen(filename);
			bool_var_a_da = exist ('a', 'var');
			if(bool_var_a_da == 0)
				a = 1;
            end
	tic
		while ~feof(fileID)
				try
                    
					Zeitstempel(a,1)= fread(fileID,1,'*uint16');   % 2 Byte
					Zeitstempel(a,2) = fread(fileID,1,'*uint8');   % 2 Byte
					Zeitstempel(a,3) = fread(fileID,1,'*uint8');   % 2 Byte
					Zeitstempel(a,4) = fread(fileID,1,'*uint8');   % 2 Byte
					Zeitstempel(a,5) = fread(fileID,1,'*uint8');   % 2 Byte
					Zeitstempel(a,6) = fread(fileID,1,'*uint8');   % 2 Byte
					Abs_Druck(a) = fread(fileID,1,'*uint16');    % 2 Byte
					
					ADC_CH_0_COB4_WE(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_1_COB4_AUX(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_2_NOB4_WE(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_3_NOB4_AUX(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_4_NO2B43F_WE(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_5_NO2B43F_AUX(a) =  fread(fileID,1,'*uint32');    % 4 Byte
					ADC_CH_6_OXB431_WE(a) =  fread(fileID,1,'*uint32');   % 4 Byte
					ADC_CH_7_OXB431_AUX(a) =  fread(fileID,1,'*uint32');   % 4 Byte
					Temperatur_LOW(a) =  fread(fileID,1,'*uint8');  % 1 Byte
					Temperatur_HIGH(a) =  fread(fileID,1,'*uint8');  % 1 Byte
					rel_Feuchte_LOW(a) =  fread(fileID,1,'*uint8'); % 1 Byte
					rel_Feuchte_HIGH(a) =  fread(fileID,1,'*uint8'); % 1 Byte
					Spannung_VCC_Akku_oder_Netz (a)=  fread(fileID,1,'*uint16'); % 2 Byte
					Spannung_5V_gesamt (a)=  fread(fileID,1,'*uint16'); % 2 Byte
					Spannung_5V_ISB(a) = fread(fileID,1,'*uint16'); % 2 Byte
					Spannung_4V(a) = fread(fileID,1,'*uint16'); % 2 Byte
					Spannung_3_3_V (a)=  fread(fileID,1,'*uint16'); % 2 Byte
					Seriennummer_uC_1 (a) = fread(fileID,1,'*uint32');
					Seriennummer_uC_2 (a) = fread(fileID,1,'*uint32');
					Seriennummer_uC_3 (a) = fread(fileID,1,'*uint32');
					Seriennummer_uC_4 (a) = fread(fileID,1,'*uint32');
					a=a+1;        
				catch
				fprintf(['File  No.',num2str(j),' : ',files(j).name,' Completed\n']);
               	end        
        end
            
	toc
%     dlmwrite(sprintf('file%d.csv',j), a,'delimiter', ',', 'precision', 10);    
			fprintf('\n')	
    end
    
    if i==1
        z =[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
        setup_1_Zeitstempel=Zeitstempel;
        Setup_1=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
        
		dlmwrite(sprintf('Setup_1.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_1_a.csv'),a,'precision',15)
        fprintf('setup_1 write done')	
        fprintf('\n')
        
        elseif i==2
        z=[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
		setup_2_Zeitstempel=Zeitstempel;
        Setup_2=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
        
        dlmwrite(sprintf('Setup_2.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_2_a.csv'),a,'precision',15)
        fprintf('setup_2 write done')	
        fprintf('\n')
        
		elseif i==3
        z=[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
		setup_3_Zeitstempel=Zeitstempel;
        Setup_3=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
       
        dlmwrite(sprintf('Setup_3.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_3_a.csv'),a,'precision',15)
        fprintf('setup_3 write done')	
        fprintf('\n')
        
		elseif i==4
        z=[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
		setup_4_Zeitstempel=Zeitstempel;
        Setup_4=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
       
        dlmwrite(sprintf('Setup_4.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_4_a.csv'),a,'precision',15)
        fprintf('setup_4 write done')	
        fprintf('\n')	
        fprintf('\n')
        
		elseif i==5
        z=[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
		setup_5_Zeitstempel=Zeitstempel;
        Setup_5=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
       
        dlmwrite(sprintf('Setup_5.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_5_a.csv'),a,'precision',15)
        fprintf('setup_5 write done')	
        fprintf('\n')
        
       
        else
        z=[ADC_CH_0_COB4_WE;ADC_CH_1_COB4_AUX;ADC_CH_2_NOB4_WE;ADC_CH_3_NOB4_AUX;ADC_CH_4_NO2B43F_WE;ADC_CH_5_NO2B43F_AUX;ADC_CH_6_OXB431_WE;ADC_CH_7_OXB431_AUX]';
		setup_6_Zeitstempel=Zeitstempel;
        Setup_6=[Abs_Druck;Temperatur_LOW;Temperatur_HIGH;rel_Feuchte_LOW;rel_Feuchte_HIGH;Spannung_VCC_Akku_oder_Netz;Spannung_5V_gesamt;Spannung_5V_ISB;Spannung_4V;Spannung_3_3_V;Seriennummer_uC_1;Seriennummer_uC_2;Seriennummer_uC_3;Seriennummer_uC_4]';
        
		dlmwrite(sprintf('Setup_6.csv'),z,'precision',15)
        dlmwrite(sprintf('Setup_6_a.csv'),a,'precision',15)
        fprintf('setup_6 write done')	
        fprintf('\n')
    end
    		
end
Datumstempel_erzeugen_N
Berechnung_PLOT_New_version
All_Con_New

%% plot mean and std dev plots
% CO gas
% setup 1
mean_sd_plot(Timestamp_One, CO_Gasconcentration_St1)
title('Mean values per minute with +/- 1SD error bar (CO setup 1)')
% setup 2
mean_sd_plot(Timestamp_Two, CO_Gasconcentration_St2)
title('Mean values per minute with +/- 1SD error bar (CO setup 2)')
% setup 3
mean_sd_plot(Timestamp_Three, CO_Gasconcentration_St3)
title('Mean values per minute with +/- 1SD error bar (CO setup 3)')
% setup 4
mean_sd_plot(Timestamp_Four, CO_Gasconcentration_St4)
title('Mean values per minute with +/- 1SD error bar (CO setup 4)')
% setup 5
mean_sd_plot(Timestamp_Five, CO_Gasconcentration_St5)
title('Mean values per minute with +/- 1SD error bar (CO setup 5)')
% setup 6
mean_sd_plot(Timestamp_Six, CO_Gasconcentration_St6)
title('Mean values per minute with +/- 1SD error bar (CO setup 6)')

% NO2 gas
% setup 1
mean_sd_plot(Timestamp_One, NO2_Gasconcentration_St1)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 1)')
% setup 2
mean_sd_plot(Timestamp_Two, NO2_Gasconcentration_St2)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 2)')
% setup 3
mean_sd_plot(Timestamp_Three, NO2_Gasconcentration_St3)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 3)')
% setup 4
mean_sd_plot(Timestamp_Four, NO2_Gasconcentration_St4)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 4)')
% setup 5
mean_sd_plot(Timestamp_Five, NO2_Gasconcentration_St5)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 5)')
% setup 6
mean_sd_plot(Timestamp_Six, NO2_Gasconcentration_St6)
title('Mean values per minute with +/- 1SD error bar (NO2 setup 6)')

% NO gas
% setup 1
mean_sd_plot(Timestamp_One, NO_Gasconcentration_St1)
title('Mean values per minute with +/- 1SD error bar (NO setup 1)')
% setup 2
mean_sd_plot(Timestamp_Two, NO_Gasconcentration_St2)
title('Mean values per minute with +/- 1SD error bar (NO setup 2)')
% setup 3
mean_sd_plot(Timestamp_Three, NO_Gasconcentration_St3)
title('Mean values per minute with +/- 1SD error bar (NO setup 3)')
% setup 4
mean_sd_plot(Timestamp_Four, NO_Gasconcentration_St4)
title('Mean values per minute with +/- 1SD error bar (NO setup 4)')
% setup 5
mean_sd_plot(Timestamp_Five, NO_Gasconcentration_St5)
title('Mean values per minute with +/- 1SD error bar (NO setup 5)')
% setup 6
mean_sd_plot(Timestamp_Six, NO_Gasconcentration_St6)
title('Mean values per minute with +/- 1SD error bar (NO setup 6)')

% OX gas
% setup 1
mean_sd_plot(Timestamp_One, OX_Gasconcentration_St1)
title('Mean values per minute with +/- 1SD error bar (OX setup 1)')
% setup 2
mean_sd_plot(Timestamp_Two, OX_Gasconcentration_St2)
title('Mean values per minute with +/- 1SD error bar (OX setup 2)')
% setup 3
mean_sd_plot(Timestamp_Three, OX_Gasconcentration_St3)
title('Mean values per minute with +/- 1SD error bar (OX setup 3)')
% setup 4
mean_sd_plot(Timestamp_Four, OX_Gasconcentration_St4)
title('Mean values per minute with +/- 1SD error bar (OX setup 4)')
% setup 5
mean_sd_plot(Timestamp_Five, OX_Gasconcentration_St5)
title('Mean values per minute with +/- 1SD error bar (OX setup 5)')
% setup 6
mean_sd_plot(Timestamp_Six, OX_Gasconcentration_St6)
title('Mean values per minute with +/- 1SD error bar (OX setup 6)')
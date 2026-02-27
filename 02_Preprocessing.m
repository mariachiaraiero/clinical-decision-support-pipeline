clear all;
close all;
clc;

load('dataset.mat');
load('construction_set.mat');
load('test_set.mat');
load('matr_amm.mat');

load('fit_best_rip_1.mat')
fit_best_rip_1 = fit_best_rip;
load('fit_best_rip_2.mat')
fit_best_rip_2 = fit_best_rip;
load('fit_best_rip_3.mat')
fit_best_rip_3 = fit_best_rip;
load('fit_best_rip_4.mat')
fit_best_rip_4 = fit_best_rip;
load('fit_best_rip_5.mat')
fit_best_rip_5 = fit_best_rip;
load('fit_best_rip_6.mat')
fit_best_rip_6 = fit_best_rip;
load('fit_best_rip_new.mat')
fit_best_rip_new = fit_best_rip;


load('fit_best_rip_sign_1.mat')
load('fit_best_rip_sign_2.mat')
load('fit_best_rip_sign_3.mat')
load('fit_best_rip_sign_4.mat')
load('fit_best_rip_sign_5.mat')
load('fit_best_rip_sign_6.mat')
load('fit_best_rip_sign_new.mat')


load('sol_best_rip_dec_1.mat');
sol_best_rip_dec_1 = sol_best_rip_dec;
load('sol_best_rip_dec_2.mat');
sol_best_rip_dec_2 = sol_best_rip_dec;
load('sol_best_rip_dec_3.mat');
sol_best_rip_dec_3 = sol_best_rip_dec;
load('sol_best_rip_dec_4.mat');
sol_best_rip_dec_4 = sol_best_rip_dec;
load('sol_best_rip_dec_5.mat');
sol_best_rip_dec_5 = sol_best_rip_dec;
load('sol_best_rip_dec_6.mat');
sol_best_rip_dec_6 = sol_best_rip_dec;
load('sol_best_rip_dec_new.mat');
sol_best_rip_dec_new = sol_best_rip_dec;


% % conto claase 0 e 1
% c1 = 0;
% c0 = 0;
% for i = 1:574
%     if m_test_set(i,54) == 1
%         c1 = c1 + 1;   
%     else 
%         c0 = c0 + 1;   
%     end 
% end

% %-------------OBIETTIVO 1-------------
% 
% %1. valori ammissibili
% % se effettuo il controllo per colonne posso studiare ogni volta una
% % determinata ammissibilià ed eliminare la riga incriminata. Non posso però
% % usare un ciclo for in quanto se elimino righe l'indice diventa più alto
% % dell'effettive dimensioni della matrice -> ciclo while
% 
% % copia della matrice originale 
% matr_originale = matr;
% 
% i = 1;
% 
% % Ciclo while per scorrere le righe della matrice e che termina se finisce
% % la matrice
% while i <= size(matr, 1)
% 
%     %controllo ammissibilità gender (bin)
%     if (matr(i,2)~=1 && matr(i,2)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità age (ok da boxplot)
%     elseif (~isinteger(matr(i,3)))
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità vent_duration (ko da boxplot)
%     elseif (~isinteger(matr(i,4)) || matr(i,4)>1000)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità height (ok da boxplot)
%     elseif (~isinteger(matr(i,5)))
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità weight (ko da boxplot)
%     elseif (matr(i,6)<40 || matr(i,6)>200)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità chronic_pulmonary_disease (bin)
%     elseif (matr(i,7)~=1 && matr(i,7)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità fluid_electrolyte_disorders (bin)
%     elseif (matr(i,8)~=1 && matr(i,8)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità hypertension (bin)
%     elseif (matr(i,9)~=1 && matr(i,9)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità congestive_heart_failure (bin)
%     elseif (matr(i,10)~=1 &&  matr(i,10)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità diabetes_uncomplicated (bin)
%     elseif (matr(i,11)~=1 && matr(i,11)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità liver_disease (bin)
%     elseif (matr(i,12)~=1 && matr(i,12)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità diabetes_complicated (bin)
%     elseif (matr(i,13)~=1 && matr(i,13)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità chronic_kidney_disease (bin)
%     elseif (matr(i,14)~=1 && matr(i,14)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità gcs (ok)
%     %controllo ammissibilità sapsii (ok)
%     %controllo ammissibilità sofa (ok)
% 
%     %controllo ammissibilità steroids (bin)
%     elseif (matr(i,18)~=1|| matr(i,18)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità curares (bin)
%     elseif (matr(i,19)~=1|| matr(i,19)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità sedatives (bin)
%     elseif (matr(i,20)~=1|| matr(i,20)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità vasopressors (bin)
%     elseif (matr(i,21)~=1|| matr(i,21)~=0)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità sedation_days (ko da boxplot)
%     elseif (~isinteger(matr(i,22)) || matr(i,22)<0 || matr(i,22)>60 )
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità calcium_median (ko)
%     %controllo ammissibilità calcium_st_dev (ko)
% 
%     %controllo ammissibilità lactic_acid_median (ko da boxplot)
%     elseif (matr(i,25)>6)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità lactic_acid_st_dev (ko da boxplot)
%     elseif (matr(i,26)>2.5)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità pH_median (ok da boxplot)
% 
%     %controllo ammissibilità pH_st_dev (ko da boxplot)
%     elseif (matr(i,28)>0.13)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità PCO2_median (ko da boxplot)
%     elseif (matr(i,29)>80)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità PCO2_st_dev (ko da boxplot)
%     elseif (matr(i,30)>(2*10^5))
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità PO2_median (ko da boxplot)
%     elseif (matr(i,31)>450)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità PO2_st_dev (ko da boxplot)
%     elseif (matr(i,32)>(2.5*10^5))
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità SO2_median (ko da boxplot)
%     elseif (matr(i,33)<89)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità SO2_iqr (ko da boxplot)
%     elseif (matr(i,34)>20)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità wbc_median (ko da boxplot)
%     elseif (matr(i,35)>150)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità wbc_st_dev (ko da boxplot)
%     elseif (matr(i,36)>23)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità creatinine_median (ko da boxplot)
%     elseif (matr(i,37)>7.5)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità creatinine_st_dev (ko da boxplot)
%     elseif (matr(i,38)>3)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità hemoglobin_median (ko da boxplot)
%     elseif (matr(i,39)>16.3)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità hemoglobin_st_dev (ko da boxplot)
%     elseif (matr(i,40)>60)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità heart_rate_median (ko da boxplot)
%     elseif (~isinteger(matr(i,41)) || matr(i,41)>135)
%         % Elimina la riga corrente
%         matr(i, :) = [];
% 
%     %controllo ammissibilità heart_rate_iqr (ko da boxplot)
%     elseif ( matr(i, 42)>57) 
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità respiratory_rate_median (ok da boxplot)
%     elseif (~isinteger(matr(i,43)))
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità respiratory_rate_iqr (ok da boxplot)
%     elseif (matr(i, 44)>20) 
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità temperature_median (ko da boxplot)
%     elseif (matr(i,45)<34)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità temperature_st_dev (ko da boxplot)
%     elseif (matr(i,46)>70)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità FiO2_median (ko da boxplot)
%     elseif (matr(i,47)>87)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità FiO2_iqr (ko da boxplot)
%     elseif (matr(i,48)>55)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità pip_median (ko da boxplot)
%     elseif (matr(i,49)>45)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità pip_st_dev (ko da boxplot)
%     elseif (matr(i,50)>300)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità peep_median (ok da boxplot)
% 
%     %controllo ammissibilità peep_st_dev (ko da boxplot)
%     elseif (matr(i,52)>20)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità plateau_pressure_median (ko da boxplot)
%     elseif (matr(i,53)>40)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità plateau_pressure_st_dev (ko da boxplot)
%     elseif (matr(i,54)>30)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità mean_airway_pressure_median (ko da boxplot)
%     elseif (matr(i,55)>26)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità mean_airway_pressure_st_dev (ko da boxplot)
%     elseif (matr(i,56)>(2.5*10^4))
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità minute_ventilation_median (ok da boxplot)
% 
%     %controllo ammissibilità minute_ventilation_st_dev(ko da boxplot)
%     elseif (matr(i,58)>1400)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità tidal_volume_median (ko da boxplot)
%     elseif (matr(i,59)>800)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     %controllo ammissibilità tidal_volume_iqr (ko da boxplot)
%     elseif (matr(i,60)>65)
%          % Elimina la riga corrente
%          matr(i, :) = [];
% 
%     end
% 
% 
%     % Passa alla riga successiva solo se la riga corrente non viene eliminata
%     i = i + 1;
% end
% 
% %nuove righe della matrice 
% c = size(matr, 1);
% 
% 
% %--------------------------------------
% 
% %2. calcolo BMI dei pazienti: peso/altezza^2
% bmi = 0;
% bmi_total = zeros(1,c);
% c_bmi = 1;
% 
% for i = 1:c
%     bmi = matr(i,6)/(matr(i,5)*10^(-2))^2; %conversione da cm a m
%     bmi_total(1,c_bmi) = bmi;
%     c_bmi = c_bmi + 1;
%     bmi = 0;
% end
% 
% %--------------------------------------
% 
% %3. Eliminare dal dataset la colonna relativa all’altezza e inserire quella relativa al BMI
% % (sostituire i valori della colonna altezza(5) con quelli del vettore bmi_total
% 
% for i = 1:c
%     matr(i, 5) = bmi_total(i);
% end
% 
% %--------------------------------------
% 
% %4. costruire nuova variabile SAPSII_COD
% sapsii_cod = zeros(1,c);
% for i = 1:c
%     if matr(i,16) <= 25
%         sapsii_cod(1,i) = 1;
%     elseif matr(i,16) <= 40
%             sapsii_cod(1,i) = 2;
%     elseif matr(i,16) <= 52
%             sapsii_cod(1,i) = 3;
%     elseif matr(i,16) <= 64
%             sapsii_cod(1,i) = 4;
%     elseif matr(i,16) <= 77
%             sapsii_cod(1,i) = 5;
%     else
%         sapsii_cod(1,i) = 6;
%     end
% end
% 
% %--------------------------------------
% 
% %5. Eliminare colonna SAPSII e inserire SAPSII_COD
% for i = 1:c
%     matr(i, 16) = sapsii_cod(i);
% end
% 
% %--------------------------------------
% 
% %6. comorbidità->una nuova variabile aggregata COMORB
% comorb = zeros(1,c);
% n_comorbieta = 0;
% for i = 1:c
%     if matr(i,7) == 1
%         n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,8) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,9) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,10) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,11) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,12) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,13) == 1
%          n_comorbieta = n_comorbieta + 1;
%     elseif matr(i,14) == 1
%          n_comorbieta = n_comorbieta + 1;
%     end
%     if n_comorbieta==1
%         comorb(1,i) = 0.2;
%     elseif n_comorbieta==2
%         comorb(1,i) = 0.4;
%     elseif n_comorbieta==3
%         comorb(1,i) = 0.6;
%     elseif n_comorbieta==4
%         comorb(1,i) = 0.8;
%     elseif n_comorbieta >= 5
%         comorb(1,i) = 1;
%     end
% end
% 
% %--------------------------------------
% 
% %7. 
% 
% for i=7:14
%     matr(:,i)=[];
% end
% 
% matr = [matr(:,1:6) comorb' matr(:,7:end)];

% %--------------OBIETTIVO 2---------------
% 
% % Calcolo il numero di righe del Test Set (30%) e del Construction Set (70%) 
% n_righe_test_set = round(0.3 * c);
% n_righe_construction_set = c - n_righe_test_set;
% 
% % vettore di indici casuali per selezionare le righe in modo randomico
% random_righe = randperm(c);
% 
% % Selezioniamo le righe per la Test Set
% m_test_set = matr(random_righe(1:n_righe_test_set), :);
% 
% % Selezioniamo le righe per la Construction Set
% m_construction_set = matr(random_righe(n_righe_test_set+1:end), :);

%--------------OBIETTIVO 3---------------

%9. matr1 contenente solo le colonne delle variabili da discretizzare
% (escludere la colonna relativa a ID soggetto e la colonna della classe)

% cancello colonna ID (1), classe (54), gender (2) ,  gcs (8), sofa (10),
% sapsii_cod (9), curares (12), sedatives (13), vasopresoors (14), steroids(11), comcomrb(7)

% matr1 = m_construction_set(:,[3:6 15:53]);
% class = m_construction_set(:,54);
% [matr_discr, cutpoints] = chimerge_discr(matr1, class, 0.01);
% 
% %10
% matr_discr = [matr_discr(:,1) m_construction_set(:,2) matr_discr(:,2:end)];
% matr_discr = [matr_discr(:,6) m_construction_set(:,[7:14]) matr_discr(:,7:end)];
% 
% %11
% constr_discr = matr_discr;
% constr_discr(:,53) = m_construction_set(:,54);

%---------------SVOLGIMENTO-----------------

% 12. impostazione parametri in gamain_Iparte.m

% 13. creazione popolazione iniziale -> creation.m -> pool_in

% 14. caricamento matrici in gamain_Iparte.m

% 15. 6 prove con pc e pm diversi su gamain_Iparte.m -> ottengo 6
% fit_best_rip e 6 sol_best_rip_dec che vado a salvare 

% 16. Identificare la coppia pc-pm che permette di ottenere il maggior 
% numero di soluzioni con la stessa fitness tra le 50 ottenute da ciascuna
% prova



% trovare valore più frequente della fitness per ogni coppia
fit_freq_1 = mode(fit_best_rip_sign_1);
fit_freq_2 = mode(fit_best_rip_sign_2);
fit_freq_3 = mode(fit_best_rip_sign_3);
fit_freq_4 = mode(fit_best_rip_sign_4);
fit_freq_5 = mode(fit_best_rip_sign_5);
fit_freq_6 = mode(fit_best_rip_sign_6);

c_1 = 0;
c_2 = 0;
c_3 = 0;
c_4 = 0;
c_5 = 0;
c_6 = 0;

% vedere quante volte si ripete in ogni prova il valore più frequente
for i = 1:50
     if(fit_best_rip_sign_1(i,1)==fit_freq_1)
         c_1 = c_1 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign_2(i,1)==fit_freq_2)
         c_2 = c_2 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign_3(i,1)==fit_freq_3)
         c_3 = c_3 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign_4(i,1)==fit_freq_4)
         c_4 = c_4 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign_5(i,1)==fit_freq_5)
         c_5 = c_5 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign_6(i,1)==fit_freq_6)
         c_6 = c_6 + 1;
     end
end

ris_rip = [c_1, c_2, c_3, c_4, c_5, c_6];
max_rip = max(ris_rip);






% dai risultati ottenuti si deduce che la fitness con maggiore ripetibilità
% (7) si trova nella prima, quinta e settima prova

% criterio di scelta (prof) -> prendere quella con pc e pm più alti. Partire dal
% pc più alto e parità di pc il pm più alto

% prova 1: pc=0.95 e pm=0.08
% prova 5: pc=1 e pm=0.1
% prova 6: pc=1 e pm=0.12

% scelta prova 6 -> pc=1 e pm=0.12

% 17. gamain_Iparte.m -> impostati pc=1, pm=0.12 e usata una popolazione
% pool_in_new con il doppio dei pazienti di pool_in (13.).
% faccio partire la prova e ottengo fit_best_rip_new e
% sol_best_rip_dec_new

% 18. Scegliere, tra tutte le soluzioni ottenute (15. , 17.) 
% la soluzione migliore (fitness minore), a parità di 
% valore di fitness, quella con il minor numero di variabili selezionate.

% Calcola il valore minimo in ciascuna delle cinque matrici
fit_min = min([min(fit_best_rip_sign_1), min(fit_best_rip_sign_2), min(fit_best_rip_sign_3), ...
    min(fit_best_rip_sign_4), min(fit_best_rip_sign_5), min(fit_best_rip_sign_6),min(fit_best_rip_sign_new)]);

min_1 = min(fit_best_rip_sign_1);
min_2 = min(fit_best_rip_sign_2);
min_3 = min(fit_best_rip_sign_3);
min_4 = min(fit_best_rip_sign_4);
min_5 = min(fit_best_rip_sign_5);
min_6 = min(fit_best_rip_sign_6);
min_new = min(fit_best_rip_sign_new);
%la fit_min = 0.1122

% Inizializza un vettore per memorizzare le posizioni di fit_min
fit_min_positions = [];

% Cerca il valore minimo in tutte le matrici e registra le posizioni

for i = 1:50
    if(fit_best_rip_sign_1(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [1,i]]; %prima colonna indica in che prova si trova, la seconda la riga
    end

     if(fit_best_rip_sign_2(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [2,i]];
     end

     if(fit_best_rip_sign_3(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [3,i]];
     end

     if(fit_best_rip_sign_4(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [4,i]];
     end

     if(fit_best_rip_sign_5(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [5,i]];
     end

     if(fit_best_rip_sign_6(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [6,i]];
     end

     if(fit_best_rip_sign_new(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [7,i]];
     end
end

% il valore minio della fitness si trova nella seconda prova in posizione
% 50 e basta

%dove sono gli 1
posizioni_1 = find(sol_best_rip_dec_5(47,:) == 1)

display(sol)
%quanti sono gli uni
v_2 = sum(sol_best_rip_dec_2(37,:) == 1);
v_5 = sum(sol_best_rip_dec_5(47,:) == 1);
v_6 = sum(sol_best_rip_dec_6(3,:) == 1);

%cifre significative
fit_best_rip_sign_new = zeros(50,1);

for i = 1:50
    n = 4;
    y = round(fit_best_rip_new(i,1), n - 1 - floor(log10(abs(fit_best_rip_new(i,1)))));
    fit_best_rip_sign_new(i,1) = y;
end

%--------grafici a ripetibilita'-----------

% fit_best_rip_1 è il vettore di dati
data = fit_best_rip_sign_new;

% Calcola la frequenza di ciascun valore nel vettore
unique_values = unique(data);
frequency = histcounts(data, [unique_values; max(unique_values)+1]);

% Visualizza il grafico a barre
bar(1:numel(unique_values), frequency); % Imposta un intervallo di valori uniformemente distanziati sull'asse x

% Imposta le etichette sull'asse x
xticks(1:numel(unique_values));
xticklabels(unique_values);
xtickangle(90); % Imposta l'angolo di rotazione a 90 gradi per le etichette sull'asse x

% Trova l'indice della colonna più alta
[max_frequency, max_index] = max(frequency);

% Evidenzia la colonna più alta in rosso
hold on
bar(max_index, max_frequency, 'r'); % Imposta il colore rosso per la barra corrispondente alla colonna più alta
hold off

% Aggiungi etichette e titoli
xlabel('Valore della Fitness');
ylabel('Frequenza della Fitness');
title('Ripetizione dei valori della Fitness nella prova new');
% 
% % ----------------------------------------------------

load("construction_set.mat");
construction_set = m_construction_set;
%2. creazione Training Set e Validation Set
c1 = 0;
c0 = 0;
for i = 1:1339   
    if construction_set(i,54) == 1
        c1 = c1 + 1;   
    else 
        c0 = c0 + 1;   
    end 
end
%c1 è minore di c0 quindi è la classe meno rappresentata
%calcolare il 60% della c1
n_paz=round(0.6*c1);
matr_c1=zeros(c1,54);
matr_c0=zeros(c0,54);
r0=1;
r1=1;
for i=1:(c0+c1)
    if(construction_set(i,54)==1)
        matr_c1(r1,:) = construction_set(i,:);
        r1 = r1 + 1;
    else
        matr_c0(r0,:) = construction_set(i,:);
        r0 = r0 + 1;
    end
end

%Definisci il numero desiderato di righe casuali per il training set
num_training_samples = n_paz;

% % Genera indici casuali per matr_c1 e matr_c0
random_indices_c1 = randperm(size(matr_c1, 1));
random_indices_c0 = randperm(size(matr_c0, 1));

% Seleziona le prime num_training_samples righe da matr_c1 e matr_c0
training_set_c1 = matr_c1(random_indices_c1(1:num_training_samples), :);
training_set_c0 = matr_c0(random_indices_c0(1:num_training_samples), :);

% Crea il training set combinando le righe selezionate da matr_c1 e matr_c0
train_set = [training_set_c1; training_set_c0];

% Rimuovi le righe selezionate dal training set per ottenere il validation set
validation_set_c1 = matr_c1(random_indices_c1(num_training_samples+1:end), :);
validation_set_c0 = matr_c0(random_indices_c0(num_training_samples+1:end), :);

% Crea il validation set combinando le rimanenti righe di matr_c1 e matr_c0
valid_set = [validation_set_c1; validation_set_c0];

train_set_new = train_set(:, [1 14 34 38 40 46 54]);
valid_set_new = valid_set(:, [1 14 34 38 40 46 54]);

tr_set_rid = train_set_new;
tr_set_rid(:,1) = [];
val_set_rid = valid_set_new;
val_set_rid(:,1) = [];

mdl=fitcknn(tr_set_rid(:, 1:end-1), tr_set_rid(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ... 
'IncludeTies',true, 'BreakTies', 'nearest');

% 13.
out_tr = predict(mdl, tr_set_rid (:, 1:end-1)); 
out_val = predict(mdl, val_set_rid(:, 1:end-1)); 

% 14.
a = confusionmat(train_set_new(:,7), out_tr);
b = confusionmat(valid_set_new(:,7), out_val);

figure(1)
confusionchart(a,[0 1])
figure(2)
confusionchart(b,[0 1])






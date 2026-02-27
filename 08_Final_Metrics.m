 clear all 
 close all

 
%cod random knn
TN_d=785;
FN_d=119;
FP_d=682;
TP_d=149;

Acc_cod_d = (TN_d + TP_d) / (TN_d + TP_d + FN_d + FP_d)
Acc_b_cod_d = 1/2 * ((TN_d / (TN_d + FP_d)) + (TP_d / (TP_d + FN_d)))
error_rate_cod_d = (FN_d + FP_d) / (TN_d + TP_d + FN_d + FP_d)
specificity_cod_d = TN_d / (TN_d + FP_d)
sensitivity_cod_d = TP_d / (TP_d + FN_d)
NPV_cod_d = TN_d / (TN_d + FN_d)
PPV_cod_d = TP_d / (TP_d + FP_d)

% Acc_cod_d =0.5383
% Acc_b_cod_d = 0.5455
% error_rate_cod_d = 0.4617
% specificity_cod_d = 0.5351
% sensitivity_cod_d = 0.5560
% NPV_cod_d = 0.8684
% PPV_cod_d = 0.1793

%cod dendrogram knn 
TN_d=828;
TP_d=156;
FP_d=636;
FN_d=107;

Acc_cod_d = (TN_d + TP_d) / (TN_d + TP_d + FN_d + FP_d)
Acc_b_cod_d = 1/2 * ((TN_d / (TN_d + FP_d)) + (TP_d / (TP_d + FN_d)))
error_rate_cod_d = (FN_d + FP_d) / (TN_d + TP_d + FN_d + FP_d)
specificity_cod_d = TN_d / (TN_d + FP_d)
sensitivity_cod_d = TP_d / (TP_d + FN_d)
NPV_cod_d = TN_d / (TN_d + FN_d)
PPV_cod_d = TP_d / (TP_d + FP_d)

% Acc_cod_d = 0.5698
% Acc_b_cod_d = 0.5794
% error_rate_cod_d = 0.4302
% specificity_cod_d = 0.5656
% sensitivity_cod_d = 0.5932
% NPV_cod_d = 0.8856
% PPV_cod_d = 0.1970

%cod som knn
TN_s = 821;
TP_s = 152;
FP_s = 642;
FN_s = 105;

Acc_cod_s = (TN_s + TP_s) / (TN_s + TP_s + FN_s + FP_s)
Acc_b_cod_s = 1/2 * ((TN_s / (TN_s + FP_s)) + (TP_s / (TP_s + FN_s)))
error_rate_cod_s = (FN_s + FP_s) / (TN_s + TP_s + FN_s + FP_s)
specificity_cod_s = TN_s / (TN_s + FP_s)
sensitivity_cod_s = TP_s / (TP_s + FN_s)
NPV_cod_s = TN_s / (TN_s + FN_s)
PPV_cod_s = TP_s / (TP_s + FP_s)

% Acc_cod_s = 0.5657
% Acc_b_cod_s = 0.5763
% error_rate_cod_s = 0.4343
% specificity_cod_s = 0.5612
% sensitivity_cod_s = 0.5914
% NPV_cod_s = 0.8866
% PPV_cod_s = 0.1914

%YN random knn
TN_r_yn = 749;
TP_r_yn = 130;
FP_r_yn = 718;
FN_r_yn = 138;

Acc_r_yn = (TN_r_yn + TP_r_yn) / (TN_r_yn + TP_r_yn + FN_r_yn + FP_r_yn)
Acc_b_r_yn = 1/2 * ((TN_r_yn / (TN_r_yn + FP_r_yn)) + (TP_r_yn / (TP_r_yn + FN_r_yn)))
error_rate_r_yn = (FN_r_yn + FP_r_yn) / (TN_r_yn + TP_r_yn + FN_r_yn + FP_r_yn)
specificity_r_yn = TN_r_yn / (TN_r_yn + FP_r_yn)
sensitivity_r_yn = TP_r_yn / (TP_r_yn + FN_r_yn)
NPV_r_yn = TN_r_yn / (TN_r_yn + FN_r_yn)
PPV_r_yn = TP_r_yn / (TP_r_yn + FP_r_yn)

% Acc_r_yn = 0.5066
% Acc_b_r_yn = 0.4978
% error_rate_r_yn = 0.4934
% specificity_r_yn = 0.5106
% sensitivity_r_yn = 0.4851
% NPV_r_yn = 0.8444
% PPV_r_yn = 0.1533

%YN DENDROGRAM KNN
TN_d_yn =952 ;
TP_d_yn =159 ;
FP_d_yn = 517;
FN_d_yn = 105;

Acc_d_yn = (TN_d_yn + TP_d_yn) / (TN_d_yn + TP_d_yn + FN_d_yn + FP_d_yn)
Acc_b_d_yn = 1/2 * ((TN_d_yn / (TN_d_yn + FP_d_yn)) + (TP_d_yn / (TP_d_yn + FN_d_yn)))
error_rate_d_yn = (FN_d_yn + FP_d_yn) / (TN_d_yn + TP_d_yn + FN_d_yn + FP_d_yn)
specificity_d_yn = TN_d_yn / (TN_d_yn + FP_d_yn)
sensitivity_d_yn = TP_d_yn / (TP_d_yn + FN_d_yn)
NPV_d_yn = TN_d_yn / (TN_d_yn + FN_d_yn)
PPV_d_yn = TP_d_yn / (TP_d_yn + FP_d_yn)

% Acc_d_yn = 0.6411
% Acc_b_d_yn = 0.6252
% error_rate_d_yn = 0.3589
% specificity_d_yn = 0.6481
% sensitivity_d_yn = 0.6023
% NPV_d_yn = 0.9007
% PPV_d_yn = 0.2352

%yn som knn
TN_s_yn =877 ;
TP_s_yn =154 ;
FP_s_yn = 549;
FN_s_yn = 89;

Acc_s_yn = (TN_s_yn + TP_s_yn) / (TN_s_yn + TP_s_yn + FN_s_yn + FP_s_yn)
Acc_b_s_yn = 1/2 * ((TN_s_yn / (TN_s_yn + FP_s_yn)) + (TP_s_yn / (TP_s_yn + FN_s_yn)))
error_rate_s_yn = (FN_s_yn + FP_s_yn) / (TN_s_yn + TP_s_yn + FN_s_yn + FP_s_yn)
specificity_s_yn = TN_s_yn / (TN_s_yn + FP_s_yn)
sensitivity_s_yn = TP_s_yn / (TP_s_yn + FN_s_yn)
NPV_s_yn = TN_s_yn / (TN_s_yn + FN_s_yn)
PPV_s_yn = TP_s_yn / (TP_s_yn + FP_s_yn)

% Acc_s_yn = 0.6177
% Acc_b_s_yn = 0.6244
% error_rate_s_yn = 0.3823
% specificity_s_yn = 0.6150
% sensitivity_s_yn = 0.6337
% NPV_s_yn = 0.9079
% PPV_s_yn = 0.2191


 %MLP - Y/N variables – tr/val random – selezione manuale della struttura della rete
 TN = 860; %(1,1)
 FN = 609; %(2,1)
 FP = 80;  %(1,2)
 TP = 184; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.6024
% Acc_b = 0.5735
% error_rate = 0.3976
% specificity = 0.9149
% sensitivity = 0.2320
% NPV = 0.5854
% PPV = 0.6970

 %MLP - Y/N variables – tr/val random – selezione della struttura della rete tramite GA-Lab4
 TN = 976; %(1,1)
 FN = 94; %(2,1)
 FP = 491;  %(1,2)
 TP = 174; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.6628
% Acc_b = 0.6573
% error_rate = 0.3372
% specificity = 0.6653
% sensitivity = 0.6493
% NPV = 0.9121
% PPV = 0.2617

 %MLP - Y/N variables – tr/val dendrogramma – selezione della struttura della rete tramite 
 TN = 962; %(1,1)
 FN = 502; %(2,1)
 FP = 75;  %(1,2)
 TP = 185; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.6653
% Acc_b = 0.5985
% error_rate =0.3347
% specificity =0.9277
% sensitivity = 0.2693
% NPV = 0.6571
% PPV = 0.7115

%Bayesiano – codified variables – tr/val random
TN = 1131; %(1,1) 1409
FN = 173; %(2,1) 231
FP = 336;  %(1,2) 58
TP = 95; %(2,2) 37
%i secondi sono quelli con 52 variabili

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.7066
% Acc_b = 0.5627
% error_rate =0.2934
% specificity =0.7710
% sensitivity = 0.3545
% NPV = 0.8673
% PPV = 0.2204

%Bayesiano – codified variables – tr/val dendrogramma
TN = 899; %(1,1)
FN = 122; %(2,1)
FP = 565;  %(1,2)
TP = 141; %(2,2)

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.6022
% Acc_b = 0.5751
% error_rate =0.3978
% specificity =0.6141
% sensitivity = 0.5361
% NPV = 0.8805
% PPV = 0.1997

%Bayesiano – codified variables – tr/val SOM
TN = 924; %(1,1)
FN = 127; %(2,1)
FP = 539;  %(1,2)
TP = 130; %(2,2)

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.6126
% Acc_b = 0.5686
% error_rate =0.3872
% specificity =0.6316
% sensitivity = 0.5058
% NPV = 0.8792
% PPV = 0.1943

%-------------------------- Obiettivo 2----------------------------
%2)
load("test_set (1).mat");
load("construction_set (1).mat");

% Inizializzazione delle matrici di massimo e minimo
massimi = zeros(1, 52);
minimi = zeros(1, 52);

% Ciclo attraverso ogni colonna della matrice
for j = 2:53
    % Trova il massimo e il minimo della colonna corrente
    massimi(j-1) = max(construction_set(:, j));
    minimi(j-1) = min(construction_set(:, j));
end

test_set_norm=zeros(1088,53);
test_set_norm(:,1)=test_set(:,1);

for j=2:53
    for i=1:1088
        test_set_norm(i,j)=(test_set(i,j)-minimi(j-1))/(massimi(j-1)-minimi(j-1));
    end
end

test_set_norm_new=test_set_norm;
test_set_norm_new(:,1)=[];
test_set_norm_new(:,53)=test_set(:,54);

%3)
test_set_norm=test_set_norm_new(:,:);

for j=1:53
    for i=1:1088
        if test_set_norm(i,j)>1 || test_set_norm(i,j)<0
      test_set_norm(i,j)=round(test_set_norm(i,j));
        end
   end 
end


%4)
%Classificatore MPL manuale (yn dendro)
test_set_norm_MPL_manuale = test_set_norm_YN;

%classificatore MPL GA 
% colonne_da_selezionare = [ 2, 3, 4, 5, 6, 11, 14, 15, 16, 17, 18, 19, 20, 22, 24, ...
%    25, 26, 27, 31, 33, 37, 38, 40, 41, 42, 44, 49, 50, 51, 52, 53];
test_set_norm_MPL_ga = test_set_norm(:,[2:6 11 14:20 22 24:27 31 33 37 38 40:42 44 49:53]); 


%classificatore kNN – Y/N variables – tr/val random, dendro, som
% colonne da selezionare = [4 6 11 13 14 17 18 23:25 27 29 31:34 36:38 40
% 43 44 46 47 50 54]
test_set_norm_YN = test_set_norm(:,[3 5 10 12 13 16 17 22:24 26 28 30:33 35:37 39 42 43 45 46 49 53]);

%calssificatore kNN – codified variables – tr/val random, dendro, som
%selezionate le variabili 22 26 30 31
% Usare come variabili selezionate le seguenti 4 variabili: calcium_median, ph_median, 
% po2_median e po2_std (22 26 30 31)
test_set_norm_cod = test_set_norm(:,[22 26 30 31 53]);

%Bayesiano sono state selezionate quelle della prof  
test_set_norm_Bay = test_set_norm(:,[22 26 30 31 53]);

%5 testare i test set sui 12 classificatori

%---kNN cod dendro
load("knn_cod_dendro.mat");
Knn_cod_dendro = Knn;
out_test_cod_dendro = predict(Knn_cod_dendro, test_set_norm_cod (:, 1:end-1));

% Calcolare la matrice di confusione
A_test_cod_dendro = confusionmat(test_set_norm_cod (:, end), out_test_cod_dendro);

% Visualizzare la matrice di confusione
figure(1)
confusionchart(A_test_cod_dendro, [0 1])
title('Cod Dendro Test set');

%---kNN cod random
load("knn_cod_rnd.mat");
Knn_cod_rnd = Knn;
out_test_cod_rnd = predict(Knn_cod_rnd, test_set_norm_cod (:, 1:end-1));

% Calcolare la matrice di confusione
A_test_cod_rnd = confusionmat(test_set_norm_cod (:, end), out_test_cod_rnd);

% Visualizzare la matrice di confusione
figure(2)
confusionchart(A_test_cod_rnd, [0 1])
title('Cod Random Test set');

%---kNN cod som
load("knn_cod_som.mat");
Knn_cod_som = Knn;
out_test_cod_som = predict(Knn_cod_som, test_set_norm_cod (:, 1:end-1));

% Calcolare la matrice di confusione
A_test_cod_som = confusionmat(test_set_norm_cod (:, end), out_test_cod_som);

% Visualizzare la matrice di confusione
figure(3)
confusionchart(A_test_cod_som, [0 1])
title('Cod SOM Test set');

%---kNN yn dendro
load("knn_yn_dendro.mat");
Knn_yn_dendro = Knn;
out_test_yn_dendro = predict(Knn_yn_dendro,test_set_norm_YN(:, 1:end-1));

% Calcolare la matrice di confusione
A_test_yn_dendro = confusionmat(test_set_norm_YN(:, end), out_test_yn_dendro);

% Visualizzare la matrice di confusione
figure(4)
confusionchart(A_test_yn_dendro, [0 1])
title('YN Dendro Test set');


%---kNN yn rnd 
load("knn_yn_rnd.mat");
Knn_yn_rnd = Knn_yn_random;
out_test_yn_rnd = predict(Knn_yn_rnd,test_set_norm_YN(:, 1:end-1));

% Calcolare la matrice di confusione
A_test_yn_rnd = confusionmat(test_set_norm_YN(:, end), out_test_yn_rnd);

% Visualizzare la matrice di confusione
figure(5)
confusionchart(A_test_yn_rnd, [0 1])
title('YN Random Test set');

%---kNN yn som
load("knn_yn_som.mat");
Knn_yn_som = Knn;
out_test_yn_som = predict(Knn_yn_som,test_set_norm_YN(:, 1:end-1));

% Calcolare la matrice di confusione
A_test_yn_som = confusionmat(test_set_norm_YN(:, end), out_test_yn_som);

% Visualizzare la matrice di confusione
figure(6)
confusionchart(A_test_yn_som, [0 1])
title('YN SOM Test set');

%---MPL manuale
load("mpl_yn_manuale.mat");
mpl_yn_manuale = net4_7;
y_test_mpl_manuale = mpl_yn_manuale(test_set_norm_MPL_manuale(:, 1:end-1)');

% Classificazione dei risultati
classi_test_manuale = y_test_mpl_manuale  >= 0.5;

% Conversione delle classificazioni in vettori di etichette
classi_test_manuale = double(classi_test_manuale)';

% Creazione della matrice di confusione
A_test_mpl_manuale = confusionmat(test_set_norm_MPL_manuale(:, end), classi_test_manuale);

% Visualizzazione della matrice di confusione
figure(7);
confusionchart(A_test_mpl_manuale, [0 1]);
title('MPL manuale Test set');

%---MPL ga
load("mpl_yn_ga.mat");
mpl_yn_ga = net_ga_7;
y_test_mpl_ga = mpl_yn_ga(test_set_norm_MPL_ga(:, 2:end-1)');

% Classificazione dei risultati
classi_test_ga = y_test_mpl_ga  >= 0.5;

% Conversione delle classificazioni in vettori di etichette
classi_test_ga = double(classi_test_ga)';

% Creazione della matrice di confusione
A_test_mpl_ga = confusionmat(test_set_norm_MPL_ga(:, end), classi_test_ga);

% Visualizzazione della matrice di confusione
figure(8);
confusionchart(A_test_mpl_ga, [0 1]);
title('MPL GA Test set');

%---MPL dendro
load("mpl_yn_dendro.mat");
mpl_yn_ga_dendro = net_ga_6;
y_test_mpl_ga_dendro = mpl_yn_ga_dendro(test_set_norm_MPL_ga(:, 2:end-1)');

% Classificazione dei risultati
classi_test_ga_dendro = y_test_mpl_ga_dendro  >= 0.5;

% Conversione delle classificazioni in vettori di etichette
classi_test_ga_dendro = double(classi_test_ga_dendro)';

% Creazione della matrice di confusione
A_test_mpl_ga_dendro = confusionmat(test_set_norm_MPL_ga(:, end), classi_test_ga_dendro);

% Visualizzazione della matrice di confusione
figure(9);
confusionchart(A_test_mpl_ga_dendro, [0 1]);
title('MPL GA dendro Test set');

%---Bayesiano random
load('Mdl_random.mat');
X_random = test_set_norm_Bay(:, 1:4);
Y_random = test_set_norm_Bay(:, 5);
label_random = predict(Mdl_random, X_random);
figure(10);
confusionchart(Y_random, label_random);
title('Confusion Matrix - Test By Random');

%---Bayesiano dendro
load('Mdl_dendro.mat');
X_dendro = test_set_norm_Bay(:, 1:4);
Y_dendro = test_set_norm_Bay(:, 5);
label_dendro = predict(Mdl_dendro, X_dendro);
figure(11)
confusionchart(Y_dendro, label_dendro);
title('Confusion Matrix - Test By Dendro');

%---Bayesiano som
load('Mdl_som.mat');
X_som = test_set_norm_Bay(:, 1:4);
Y_som = test_set_norm_Bay(:, 5);
label_som = predict(Mdl_som, X_som);
figure(12)
confusionchart(Y_som, label_som);
title('Confusion Matrix - Test By SOM');

%%CONFRONTO%%
%cod random knn
TN_d=440;
FN_d=116;
FP_d=371;
TP_d=161;

Acc_cod_d = (TN_d + TP_d) / (TN_d + TP_d + FN_d + FP_d)
Acc_b_cod_d = 1/2 * ((TN_d / (TN_d + FP_d)) + (TP_d / (TP_d + FN_d)))
error_rate_cod_d = (FN_d + FP_d) / (TN_d + TP_d + FN_d + FP_d)
specificity_cod_d = TN_d / (TN_d + FP_d)
sensitivity_cod_d = TP_d / (TP_d + FN_d)
NPV_cod_d = TN_d / (TN_d + FN_d)
PPV_cod_d = TP_d / (TP_d + FP_d)

% Acc_cod_d = 0.5524
% Acc_b_cod_d = 0.5619
% error_rate_cod_d = 0.4476
% specificity_cod_d = 0.5425
% sensitivity_cod_d = 0.5812
% NPV_cod_d = 0.7914
% PPV_cod_d = 0.3026

%cod dendrogram knn 
TN_d=456;
TP_d=163;
FP_d=355;
FN_d=114;

Acc_cod_d = (TN_d + TP_d) / (TN_d + TP_d + FN_d + FP_d)
Acc_b_cod_d = 1/2 * ((TN_d / (TN_d + FP_d)) + (TP_d / (TP_d + FN_d)))
error_rate_cod_d = (FN_d + FP_d) / (TN_d + TP_d + FN_d + FP_d)
specificity_cod_d = TN_d / (TN_d + FP_d)
sensitivity_cod_d = TP_d / (TP_d + FN_d)
NPV_cod_d = TN_d / (TN_d + FN_d)
PPV_cod_d = TP_d / (TP_d + FP_d)

% Acc_cod_d = 0.5689
% Acc_b_cod_d = 0.5754
% error_rate_cod_d = 0.4311
% specificity_cod_d = 0.5623
% sensitivity_cod_d = 0.5884
% NPV_cod_d = 0.8000
% PPV_cod_d = 0.3147

%cod som knn
TN_s = 424;
TP_s = 164;
FP_s = 387;
FN_s = 113;

Acc_cod_s = (TN_s + TP_s) / (TN_s + TP_s + FN_s + FP_s)
Acc_b_cod_s = 1/2 * ((TN_s / (TN_s + FP_s)) + (TP_s / (TP_s + FN_s)))
error_rate_cod_s = (FN_s + FP_s) / (TN_s + TP_s + FN_s + FP_s)
specificity_cod_s = TN_s / (TN_s + FP_s)
sensitivity_cod_s = TP_s / (TP_s + FN_s)
NPV_cod_s = TN_s / (TN_s + FN_s)
PPV_cod_s = TP_s / (TP_s + FP_s)

% Acc_cod_s = 0.5404
% Acc_b_cod_s = 0.5574
% error_rate_cod_s = 0.4596
% specificity_cod_s = 0.5228
% sensitivity_cod_s = 0.5921
% NPV_cod_s = 0.7896
% PPV_cod_s = 0.2976

%YN random knn
TN_r_yn = 445;
TP_r_yn = 173;
FP_r_yn = 366;
FN_r_yn = 104;

Acc_r_yn = (TN_r_yn + TP_r_yn) / (TN_r_yn + TP_r_yn + FN_r_yn + FP_r_yn)
Acc_b_r_yn = 1/2 * ((TN_r_yn / (TN_r_yn + FP_r_yn)) + (TP_r_yn / (TP_r_yn + FN_r_yn)))
error_rate_r_yn = (FN_r_yn + FP_r_yn) / (TN_r_yn + TP_r_yn + FN_r_yn + FP_r_yn)
specificity_r_yn = TN_r_yn / (TN_r_yn + FP_r_yn)
sensitivity_r_yn = TP_r_yn / (TP_r_yn + FN_r_yn)
NPV_r_yn = TN_r_yn / (TN_r_yn + FN_r_yn)
PPV_r_yn = TP_r_yn / (TP_r_yn + FP_r_yn)

% Acc_r_yn = 0.5680
% Acc_b_r_yn = 0.5866
% error_rate_r_yn = 0.4320
% specificity_r_yn = 0.5487
% sensitivity_r_yn = 0.6245
% NPV_r_yn = 0.8106
% PPV_r_yn = 0.3210

%YN DENDROGRAM KNN
TN_d_yn = 517 ;
TP_d_yn =158 ;
FP_d_yn = 294;
FN_d_yn = 119;

Acc_d_yn = (TN_d_yn + TP_d_yn) / (TN_d_yn + TP_d_yn + FN_d_yn + FP_d_yn)
Acc_b_d_yn = 1/2 * ((TN_d_yn / (TN_d_yn + FP_d_yn)) + (TP_d_yn / (TP_d_yn + FN_d_yn)))
error_rate_d_yn = (FN_d_yn + FP_d_yn) / (TN_d_yn + TP_d_yn + FN_d_yn + FP_d_yn)
specificity_d_yn = TN_d_yn / (TN_d_yn + FP_d_yn)
sensitivity_d_yn = TP_d_yn / (TP_d_yn + FN_d_yn)
NPV_d_yn = TN_d_yn / (TN_d_yn + FN_d_yn)
PPV_d_yn = TP_d_yn / (TP_d_yn + FP_d_yn)

% Acc_d_yn = 0.6204
% Acc_b_d_yn = 0.6039
% error_rate_d_yn = 0.3796
% specificity_d_yn = 0.6375
% sensitivity_d_yn = 0.5704
% NPV_d_yn = 0.8129
% PPV_d_yn = 0.3496

%yn som knn
TN_s_yn = 504 ;
TP_s_yn = 172 ;
FP_s_yn = 307;
FN_s_yn = 105;

Acc_s_yn = (TN_s_yn + TP_s_yn) / (TN_s_yn + TP_s_yn + FN_s_yn + FP_s_yn)
Acc_b_s_yn = 1/2 * ((TN_s_yn / (TN_s_yn + FP_s_yn)) + (TP_s_yn / (TP_s_yn + FN_s_yn)))
error_rate_s_yn = (FN_s_yn + FP_s_yn) / (TN_s_yn + TP_s_yn + FN_s_yn + FP_s_yn)
specificity_s_yn = TN_s_yn / (TN_s_yn + FP_s_yn)
sensitivity_s_yn = TP_s_yn / (TP_s_yn + FN_s_yn)
NPV_s_yn = TN_s_yn / (TN_s_yn + FN_s_yn)
PPV_s_yn = TP_s_yn / (TP_s_yn + FP_s_yn)

% Acc_s_yn = 0.6213
% Acc_b_s_yn = 0.6212
% error_rate_s_yn = 0.3787
% specificity_s_yn = 0.6215
% sensitivity_s_yn = 0.6209
% NPV_s_yn = 0.8276
% PPV_s_yn = 0.3591


 %MLP - Y/N variables – tr/val random – selezione manuale della struttura della rete
 TN = 460; %(1,1)
 FN = 93; %(2,1)
 FP = 351;  %(1,2)
 TP = 184; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.5919
% Acc_b = 0.6157
% error_rate = 0.4081
% specificity = 0.5672
% sensitivity = 0.6643
% NPV = 0.8318
% PPV = 0.3439



 %MLP - Y/N variables – tr/val random – selezione della struttura della rete tramite GA-Lab4
 TN = 544; %(1,1)
 FN = 101; %(2,1)
 FP = 297;  %(1,2)
 TP = 176; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.6440
% Acc_b = 0.6411
% error_rate = 0.3560
% specificity = 0.6468
% sensitivity = 0.6354
% NPV = 0.8434
% PPV = 0.3721

 %MLP - Y/N variables – tr/val dendrogramma – selezione della struttura della rete tramite 
 TN = 505; %(1,1)
 FN = 94; %(2,1)
 FP = 306;  %(1,2)
 TP = 183; %(2,2)

 Acc = (TN + TP) / (TN + TP + FN + FP)
 Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
 error_rate = (FN + FP)/(TN + TP + FN + FP)
 specificity = TN / (TN + FP)
 sensitivity = TP / (TP + FN)
 NPV = TN / (TN + FN)
 PPV = TP / (TP + FP)

% Acc = 0.6324
% Acc_b = 0.6417
% error_rate = 0.3676
% specificity = 0.6227
% sensitivity = 0.6606
% NPV = 0.8431
% PPV = 0.3742

%Bayesiano – codified variables – tr/val random
TN = 620; 
FN = 174; 
FP = 191;  
TP = 103; 

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.6645
% Acc_b = 0.5682
% error_rate = 0.3355
% specificity = 0.7645
% sensitivity = 0.3718
% NPV = 0.7809
% PPV = 0.3503


%Bayesiano – codified variables – tr/val dendrogramma
TN = 482; %(1,1)
FN = 119; %(2,1)
FP = 329;  %(1,2)
TP = 158; %(2,2)

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.5882
% Acc_b = 0.5824
% error_rate = 0.4118
% specificity =0.5943
% sensitivity =0.5704
% NPV =0.8020
% PPV =0.3244


%Bayesiano – codified variables – tr/val SOM
TN = 497; %(1,1)
FN = 115; %(2,1)
FP = 314;  %(1,2)
TP = 162; %(2,2)

Acc = (TN + TP) / (TN + TP + FN + FP)
Acc_b = 1/2 * ((TN / (TN + FP)) + (TP / (TP + FN)))
error_rate = (FN + FP)/(TN + TP + FN + FP)
specificity = TN / (TN + FP)
sensitivity = TP / (TP + FN)
NPV = TN / (TN + FN)
PPV = TP / (TP + FP)

% Acc = 0.6057
% Acc_b = 0.5988
% error_rate = 0.3943
% specificity = 0.6128
% sensitivity = 0.5848
% NPV = 0.8121
% PPV = 0.3403






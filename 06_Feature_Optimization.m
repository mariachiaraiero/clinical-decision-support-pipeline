
clear all
clear clc
clc

load("sol_best_rip.mat");
load("fit_best_rip.mat");

%18. 

% %cifre significative
% fit_best_rip_sign3 = zeros(20,1);
% 
% for i = 1:20
%     n = 3;
%     y = round(fit_best_rip(i,1), n - 1 - floor(log10(abs(fit_best_rip(i,1)))));
%     fit_best_rip_sign3(i,1) = y;
% end

load('fit_best_rip_sign3.mat');

%calcolo fitness migliore (minima)
minima = min(fit_best_rip_sign3); %0.284
posizione_min = find(fit_best_rip_sign3(:,1) == minima); %riga 18
posizioni_variabili_selezionate = find(sol_best_rip(18,:) == 1)
%indici variabili selezionate
%[  2     3     4     5     6    11    14    15    16    17    18    19    
% 20    22    24    25    26    27    31    33    37    38    40    41   
% 42    44    49    50    51    52    -53    -54    -55 ]
%30 variabili selezionate

%sol ga
% display(sol_best_rip(18,:))
%   0     1     1     1     1     1     0     0     0     0     1     0     0 
%   1     1     1     1     1     1     1     0     1     0     1     1     1     
%   1     0     0     0     1     0     1     0     0     0     1     1     0     
%   1     1     1     0     1     0     0     0     0     1     1     1     1     
%   1     1     1

load("valid_set_norm.mat");
load("train_set_norm.mat");

colonne_da_selezionare = [ 2, 3, 4, 5, 6, 11, 14, 15, 16, 17, 18, 19, 20, 22, 24, ...
    25, 26, 27, 31, 33, 37, 38, 40, 41, 42, 44, 49, 50, 51, 52, 53]; %con classe 
valid_set_norm_nind = valid_set_norm(:,2:54);
valid_set_norm_ga = valid_set_norm_nind(:, colonne_da_selezionare);
valid_set_norm_ga_id = [valid_set_norm(:,1), valid_set_norm_ga];
train_set_norm_nind  = train_set_norm(:,2:54);
train_set_norm_ga = train_set_norm_nind (:, colonne_da_selezionare);
train_set_norm_ga_id = [train_set_norm(:,1), train_set_norm_ga];

% 19. 20. 21.

%ultimi 3 bit soluzione = 111 = 7 -> struttura NPL

%22.
load('constr_set_norm.mat');
constr_set_rid_ga = zeros(2539,31); 
constr_set_rid_ga = constr_set_norm(:, [3,4,5,6,7,12,15,16,17,18,19,20,21,23,25,26,27,28,32,34,38,39,41,42,43,45,50,51,52,53,54 ]); 
%aggiungere a constr_set_rid_yn la colonna relativa all'id
constr_set_ga = constr_set_norm(:,[ 1,3,4,5,6,7,12,15,16,17,18,19,20,21,23,25,26,27,28,32,34,38,39,41,42,43,45,50,51,52,53,54]);

%5.1
c1 = 0; 
c0 = 0; 
for i = 1:2539    
    if constr_set_ga(i,32) == 1 
        c1 = c1 + 1;    
    else  
        c0 = c0 + 1;    
    end  
end 
%c0 = 1869, c1 = 670

constr_1_ga=zeros(c1,32); 
constr_0_ga=zeros(c0,32); 
r0=1; 
r1=1; 
for i=1:(c0+c1) 
    if(constr_set_ga(i,32)==1) 
        constr_1_ga(r1,:) = constr_set_ga(i,:); 
        r1 = r1 + 1; 
    else 
        constr_0_ga(r0,:) = constr_set_ga(i,:); 
        r0 = r0 + 1; 
    end 
end 
%togliere la colonna relativa all'id e classe
constr_rid_0_ga = constr_0_ga(:,2:end-1); 
constr_rid_1_ga = constr_1_ga(:,2:end-1); 

dend_0=linkage(constr_rid_0_ga,"complete","cityblock"); 
figure(2) 
[h, tperm] = dendrogram(dend_0, 0, 'ColorThreshold', 6); 
title('Dendrogramma classe 0'); 
% Ottieni i colori delle linee 
% line_colors = cell2mat(get(h, 'Color')); 
% % Converti i colori in stringhe per poterli confrontare 
% color_strings = cellstr(num2str(line_colors, '%f')); 
% % Conta il numero di colori unici 
% num_cluster_colored = numel(unique(color_strings)); 
% disp(['Numero di cluster colorati sopra la soglia: ', num2str(num_cluster_colored)]); 
%HO 20 CLUSTER 
 
% Effettua il taglio del dendrogramma per ottenere le etichette dei cluster 
etichette_cluster0 = cluster(dend_0, 'maxclust', 20); 
 
% Conta il numero di pazienti per ciascun cluster 
num_pazienti_per_cluster0 = accumarray(etichette_cluster0, 1); % Conta il numero di pazienti per ciascun cluster 
 
%taglimultipli  
posizioni1 = find(etichette_cluster0(:,1) == 2); 
dend_0_taglio1 = linkage(constr_rid_0_ga(posizioni1,:),"complete","cityblock"); 
figure(3) 
[h, tperm] = dendrogram(dend_0_taglio1, 0, 'ColorThreshold', 5.2); 
title('Dendrogramma classe 0 taglio1'); 
 
etichette_cluster0_taglio1 = cluster(dend_0_taglio1, 'maxclust', 3); 
 
posizioni2 = find(etichette_cluster0(:,1) == 16); 
dend_0_taglio2 = linkage(constr_rid_0_ga(posizioni2,:),"complete","cityblock"); 
figure(5) 
[h, tperm] = dendrogram(dend_0_taglio2, 0, 'ColorThreshold', 5.5); 
title('Dendrogramma classe 0 taglio2'); 
 
etichette_cluster0_taglio2 = cluster(dend_0_taglio2, 'maxclust', 2); 
 
%aggiornamento etichette: 
etichette0new = etichette_cluster0; 
posizioni1_1 = find(etichette_cluster0_taglio1 == 1); 
posizioni1_2 = find(etichette_cluster0_taglio1 == 2); 
posizioni1_3 = find(etichette_cluster0_taglio1 == 3); 
etichette0new(posizioni1(posizioni1_1)) = 2;  
etichette0new(posizioni1(posizioni1_2)) = 21;  
etichette0new(posizioni1(posizioni1_3)) = 22;  
posizioni2_1 = find(etichette_cluster0_taglio2 == 1); 
posizioni2_2 = find(etichette_cluster0_taglio2 == 2); 
etichette0new(posizioni2(posizioni2_1)) = 16;  
etichette0new(posizioni2(posizioni2_2)) = 23; 
 
num_pazienti_per_cluster0new = accumarray(etichette0new, 1); % Conta il numero di pazienti per ciascun cluster 
 
m_cluster0 = zeros(1869,33); 
m_cluster0 = constr_0_ga; 
for i = 1:1869 
    m_cluster0(i,33) = etichette0new(i,1); 
end 
constr_0_ga_new = []; 
%cluster da eliminare 9 (elem<5) 
valid_set_eliminati_0 = []; 
riga1 = 1; 
riga2 = 1; 
for i = 1:1869 
    if m_cluster0(i,33)==9  
        valid_set_eliminati_0(riga2,:) = m_cluster0(i,:); 
        riga2 = riga2 + 1; 
    else 
        constr_0_ga_new(riga1,:) = m_cluster0(i,:); 
        riga1 = riga1 + 1; 
    end 
end 
 
 
% Valori da cercare e rimuovere 
valori_da_rimuovere = [9]; 
 
% Crea un vettore logico che indichi quali elementi devono essere mantenuti 
indici_da_mantenere = ~ismember(etichette0new, valori_da_rimuovere); 
 
% Seleziona solo gli elementi che devono essere mantenuti 
etichette0new_eliminati = etichette0new(indici_da_mantenere); 
 
num_pazienti_per_cluster0 = accumarray(etichette0new_eliminati, 1);

%calasse 1
dend_1=linkage(constr_rid_1_ga,"complete","cityblock");
figure(1)
[h, tperm] = dendrogram(dend_1, 0, 'ColorThreshold', 6.5);
title('Dendrogramma classe 1');
% % Ottieni i colori delle linee
% line_colors = cell2mat(get(h, 'Color'));
% % Converti i colori in stringhe per poterli confrontare
% color_strings = cellstr(num2str(line_colors, '%f'));
% % Conta il numero di colori unici
% num_cluster_colored = numel(unique(color_strings));
% disp(['Numero di cluster colorati sopra la soglia: ', num2str(num_cluster_colored)]);
%HO 13 CLUSTER

% Effettua il taglio del dendrogramma per ottenere le etichette dei cluster
etichette_cluster1 = cluster(dend_1, 'maxclust', 13);

% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster1 = accumarray(etichette_cluster1, 1); % Conta il numero di pazienti per ciascun cluster
%i cluster non sono in ordine

%taglimultipli 
posizioni1 = find(etichette_cluster1(:,1) == 7);
dend_1_taglio1 = linkage(constr_rid_1_ga(posizioni1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_1_taglio1, 0, 'ColorThreshold', 5.92);
title('Dendrogramma classe 1 taglio1');

etichette_cluster1_taglio1 = cluster(dend_1_taglio1, 'maxclust', 2);
num_pazienti_per_cluster1_taglio1 = accumarray(etichette_cluster1_taglio1, 1); % Conta il numero di pazienti per ciascun cluster

posizioni2 = find(etichette_cluster1(:,1) == 3);
dend_1_taglio2 = linkage(constr_rid_1_ga(posizioni2,:),"complete","cityblock");
figure(3)
[h, tperm] = dendrogram(dend_1_taglio2, 0, 'ColorThreshold', 5);
title('Dendrogramma classe 1 taglio1');

etichette_cluster1_taglio2 = cluster(dend_1_taglio2, 'maxclust', 3);
num_pazienti_per_cluster1_taglio2 = accumarray(etichette_cluster1_taglio2, 1); % Conta il numero di pazienti per ciascun cluster

etichette1new = etichette_cluster1;
posizioni1_1 = find(etichette_cluster1_taglio1 == 1);
posizioni1_2 = find(etichette_cluster1_taglio1 == 2);
etichette1new(posizioni1(posizioni1_1)) = 7; 
etichette1new(posizioni1(posizioni1_2)) = 14; 

posizioni2_1 = find(etichette_cluster1_taglio2 == 1);
posizioni2_2 = find(etichette_cluster1_taglio2 == 2);
posizioni2_3 = find(etichette_cluster1_taglio2 == 3);
etichette1new(posizioni2(posizioni2_1)) = 3; 
etichette1new(posizioni2(posizioni2_2)) = 15;
etichette1new(posizioni2(posizioni2_3)) = 16; 

num_pazienti_per_cluster1new = accumarray(etichette1new, 1); % Conta il numero di pazienti per ciascun cluster

%elimina cluster con il numero minore di 5
m_cluster1 = zeros(670,33);
m_cluster1 = constr_1_ga;
for i = 1:670
    m_cluster1(i,33) = etichette1new(i,1);
end
constr_1_ga_new = [];
%cluster da eliminare 10,11,12 (elem<5)
valid_set_eliminati_1 = [];
riga1 = 1;
riga2 = 1;
for i = 1:670
    if m_cluster1(i,33)==11 ||  m_cluster1(i,33)==12 ||  m_cluster1(i,33)==13 
        valid_set_eliminati_1(riga2,:) = m_cluster1(i,:);
        riga2 = riga2 + 1;
    else
        constr_1_ga_new(riga1,:) = m_cluster1(i,:);
        riga1 = riga1 + 1;
    end
end

% Valori da cercare e rimuovere
valori_da_rimuovere = [13,11,12];

% Crea un vettore logico che indichi quali elementi devono essere mantenuti
indici_da_mantenere = ~ismember(etichette1new, valori_da_rimuovere);

% Seleziona solo gli elementi che devono essere mantenuti
etichette1new_eliminati = etichette1new(indici_da_mantenere);

num_pazienti_per_cluster1new_eliminati = accumarray(etichette1new_eliminati, 1);

%---------------------------------------------

% Definisco il numero massimo di valori possibili nella colonna 7 
insieme = unique(etichette1new_eliminati); 
 
% Inizializzazione di una cella per contenere le matrici risultanti 
matrici_risultanti1 = cell(1, numel(insieme)); 
 
% Ciclo su ogni elemento di insieme
for i = 1:numel(insieme) 
    valore_corrente = insieme(i); 
 
    % Inizializzazione di una matrice vuota per contenere le righe con il valore corrente 
    matrice_corrente = []; 
 
    % Ciclo su tutte le righe della matrice constr_cod_0b 
    for riga = 1:size(constr_1_ga_new, 1) 
        % Controlla se il valore corrente è presente nella settima colonna della riga corrente 
        if constr_1_ga_new(riga, 33) == valore_corrente 
            % Se il valore è presente, aggiungi la riga alla matrice corrente 
            matrice_corrente = [matrice_corrente; constr_1_ga_new(riga, :)]; 
        end 
    end 
 
    % Aggiungi la matrice corrente alla cella delle matrici risultanti 
    matrici_risultanti1{i} = matrice_corrente; 
end


%---------------------------------------------

% la classe piu rappresentata è la 0  
load('matrici_risultanti0.mat'); 
% Inizializzare una matrice vuota 
matrice_unica0 = []; 
 
% Concatenare tutte le matrici in una matrice unica 
for i = 1:length(matrici_risultanti0) 
    matrice_unica0 = [matrice_unica0; matrici_risultanti0{i}]; 
end 
 
% Identifica i cluster unici 
clusters = unique(matrice_unica0(:, 33)); 
 
% Inizializza le matrici per training set e validation set 
tr_set_ga_0_id = []; 
val_set_ga_0_id= []; 
 
% Percentuale per il training set 
training_ratio = 0.21; 
 
% Itera attraverso ciascun cluster 
for i = 1:length(clusters) 
    % Trova gli indici dei pazienti appartenenti al cluster corrente 
    cluster_indices = find(matrice_unica0(:, 33) == clusters(i)); 
 
    % Randomizza gli indici 
    rand_indices = cluster_indices(randperm(length(cluster_indices))); 
 
    % Determina il numero di pazienti da inserire nel training set 
    num_training = ceil(length(rand_indices) * training_ratio); 
 
    % Dividi gli indici 
    training_indices = rand_indices(1:num_training); 
    validation_indices = rand_indices(num_training + 1:end); 
 
    % Estrai le righe corrispondenti e aggiungile ai set 
    tr_set_ga_0_id = [tr_set_ga_0_id; matrice_unica0(training_indices, :)]; 
    val_set_ga_0_id = [val_set_ga_0_id; matrice_unica0(validation_indices, :)]; 
    tr_set_ga_0 = tr_set_ga_0_id(:,2:32); 
    val_set_ga_0 = val_set_ga_0_id(:,2:32); 
 
end

%---------------------------------------------

% la classe meno rappresentata è la 1 
clear all
load('matrici_risultanti1.mat');
% Inizializzare una matrice vuota
matrice_unica1 = [];

% Concatenare tutte le matrici in una matrice unica
for i = 1:length(matrici_risultanti1)
    matrice_unica1 = [matrice_unica1; matrici_risultanti1{i}];
end

% Identifica i cluster unici
clusters = unique(matrice_unica1(:, 33));

% Inizializza le matrici per training set e validation set
tr_set_ga_1_id = [];
val_set_ga_1_id = [];

% Percentuale per il training set
training_ratio = 0.60;

% Itera attraverso ciascun cluster
for i = 1:length(clusters)
    % Trova gli indici dei pazienti appartenenti al cluster corrente
    cluster_indices = find(matrice_unica1(:, 33) == clusters(i));

    % Randomizza gli indici
    rand_indices = cluster_indices(randperm(length(cluster_indices)));

    % Determina il numero di pazienti da inserire nel training set
    num_training = ceil(length(rand_indices) * training_ratio);

    % Dividi gli indici
    training_indices = rand_indices(1:num_training);
    validation_indices = rand_indices(num_training + 1:end);

    % Estrai le righe corrispondenti e aggiungile ai set
    tr_set_ga_1_id = [tr_set_ga_1_id; matrice_unica1(training_indices, :)];
    val_set_ga_1_id = [val_set_ga_1_id; matrice_unica1(validation_indices, :)];
    tr_set_ga_1 = tr_set_ga_1_id(:,2:32); 
    val_set_ga_1 = val_set_ga_1_id(:,2:32); 
end

%---------------------------------------------

tr_set_ga_id = [tr_set_ga_0_id; tr_set_ga_1_id];  
val_set_ga_id = [val_set_ga_0_id; val_set_ga_1_id]; 
tr_set_ga = tr_set_ga_id(:,2:32); 
val_set_ga = val_set_ga_id(:,2:32); 

%---------------------------------------------
%23.
clear all
load("tr_set_ga_id.mat");
load("val_set_ga_id.mat");

% ANALISI TRAIN

% Step 1: Estrai le colonne
classi = tr_set_ga_id(:, 32);   % Prima colonna
cluster = tr_set_ga_id(:, 33);  % Seconda colonna

% Step 2: Crea una chiave unica combinando classe e cluster
% La funzione `unique` funziona bene con array di stringhe per creare chiavi uniche
keys = strcat(string(classi), '_', string(cluster));

% Step 3: Trova i cluster unici
[uniqueKeys, ~, idx] = unique(keys, 'stable');

% Step 4: Conta gli elementi per ciascun cluster
counts = accumarray(idx, 1);

% Step 5: Visualizza i risultati
disp('Cluster unici e conteggio degli elementi:');
for i = 1:length(uniqueKeys)
    disp(['Cluster ', uniqueKeys{i}, ': ', num2str(counts(i)), ' elementi']);
end

% Numero totale di cluster unici
numClusters = length(uniqueKeys);
disp(['Numero totale di cluster: ', num2str(numClusters)]);

% Cluster 0_1: 32 elementi
% Cluster 0_2: 15 elementi
% Cluster 0_3: 27 elementi
% Cluster 0_4: 29 elementi
% Cluster 0_5: 8 elementi
% Cluster 0_6: 8 elementi
% Cluster 0_7: 24 elementi
% Cluster 0_8: 30 elementi
% Cluster 0_10: 3 elementi
% Cluster 0_11: 13 elementi
% Cluster 0_12: 12 elementi
% Cluster 0_13: 12 elementi
% Cluster 0_14: 6 elementi
% Cluster 0_15: 39 elementi
% Cluster 0_16: 31 elementi
% Cluster 0_17: 8 elementi
% Cluster 0_18: 26 elementi
% Cluster 0_19: 8 elementi
% Cluster 0_20: 7 elementi
% Cluster 0_21: 28 elementi
% Cluster 0_22: 4 elementi
% Cluster 0_23: 34 elementi
% Cluster 1_1: 30 elementi
% Cluster 1_2: 11 elementi
% Cluster 1_3: 21 elementi
% Cluster 1_4: 27 elementi
% Cluster 1_5: 35 elementi
% Cluster 1_6: 11 elementi
% Cluster 1_7: 51 elementi
% Cluster 1_8: 14 elementi
% Cluster 1_9: 42 elementi
% Cluster 1_10: 56 elementi
% Cluster 1_14: 45 elementi
% Cluster 1_15: 41 elementi
% Cluster 1_16: 21 elementi
% Numero totale di cluster: 35

% ANALISI VALID

% Step 1: Estrai le colonne
classi = val_set_ga_id(:, 32);   % Prima colonna
cluster = val_set_ga_id(:, 33);  % Seconda colonna

% Step 2: Crea una chiave unica combinando classe e cluster
% La funzione `unique` funziona bene con array di stringhe per creare chiavi uniche
keys = strcat(string(classi), '_', string(cluster));

% Step 3: Trova i cluster unici
[uniqueKeys, ~, idx] = unique(keys, 'stable');

% Step 4: Conta gli elementi per ciascun cluster
counts = accumarray(idx, 1);

% Step 5: Visualizza i risultati
disp('Cluster unici e conteggio degli elementi:');
for i = 1:length(uniqueKeys)
    disp(['Cluster ', uniqueKeys{i}, ': ', num2str(counts(i)), ' elementi']);
end

% Numero totale di cluster unici
numClusters = length(uniqueKeys);
disp(['Numero totale di cluster: ', num2str(numClusters)]);

% Cluster 0_1: 118 elementi
% Cluster 0_2: 55 elementi
% Cluster 0_3: 101 elementi
% Cluster 0_4: 105 elementi
% Cluster 0_5: 28 elementi
% Cluster 0_6: 30 elementi
% Cluster 0_7: 86 elementi
% Cluster 0_8: 111 elementi
% Cluster 0_10: 10 elementi
% Cluster 0_11: 45 elementi
% Cluster 0_12: 41 elementi
% Cluster 0_13: 41 elementi
% Cluster 0_14: 18 elementi
% Cluster 0_15: 144 elementi
% Cluster 0_16: 116 elementi
% Cluster 0_17: 28 elementi
% Cluster 0_18: 95 elementi
% Cluster 0_19: 26 elementi
% Cluster 0_20: 23 elementi
% Cluster 0_21: 104 elementi
% Cluster 0_22: 15 elementi
% Cluster 0_23: 124 elementi
% Cluster 1_1: 19 elementi
% Cluster 1_2: 7 elementi
% Cluster 1_3: 14 elementi
% Cluster 1_4: 17 elementi
% Cluster 1_5: 22 elementi
% Cluster 1_6: 6 elementi
% Cluster 1_7: 34 elementi
% Cluster 1_8: 9 elementi
% Cluster 1_9: 27 elementi
% Cluster 1_10: 37 elementi
% Cluster 1_14: 29 elementi
% Cluster 1_15: 26 elementi
% Cluster 1_16: 13 elementi
% Numero totale di cluster: 35

%-----------------------------

%24.
clear all
load("tr_set_ga.mat");
load("val_set_ga.mat");

Knn = fitcknn(tr_set_ga(:, 1:end-1), tr_set_ga(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ...  
'IncludeTies',true, 'BreakTies', 'nearest');   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%NON SO SE VUOLE PURE LE CONFUSION 
  
out_tr = predict(Knn, tr_set_ga(:, 1:end-1));   
out_val = predict(Knn, val_set_ga(:, 1:end-1));  
  
% )--------  
  
A = confusionmat(tr_set_ga(:,end),out_tr);  
B = confusionmat(val_set_ga(:,end),out_val);  
  
figure(1)  
confusionchart(A,[0 1])  
title('TR.SET'); 
figure(2)  
confusionchart(B,[0 1]) 
title('VAL.SET');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  

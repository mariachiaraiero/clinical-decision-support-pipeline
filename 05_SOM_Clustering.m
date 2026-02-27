clear all;
close all;
clc;

% classe 0 : 25 cluster
% classe 1 : 18 cluster

%2.
n_cluster0 = 25;
n_cluster1 = 18;

%3.
n0 = ceil(sqrt(7*n_cluster0)); %14
n1 = ceil(sqrt(7*n_cluster1)); %12

%4.
load("constr_rid_cod_0_new.mat"); %1861x4
load("constr_rid_cod_1_new.mat"); %657x4

%4.
load("som1_classe0.mat");
% som1_classe0=selforgmap([n0 n0], 100,1);
% som1_classe0=train(som1_classe0, constr_rid_cod_0_new');
plotsomhits(som1_classe0, constr_rid_cod_0_new');

load("som2_classe0.mat");
% som2_classe0=selforgmap([(n0+1) (n0+1)], 100,1);
% som2_classe0=train(som2_classe0, constr_rid_cod_0_new');
plotsomhits(som2_classe0, constr_rid_cod_0_new');

som3_classe0=selforgmap([(n0-1) (n0-1)], 100,1);
som3_classe0=train(som3_classe0, constr_rid_cod_0_new');

som1_classe1=selforgmap([n1 n1], 100,1);
som1_classe1=train(som1_classe1, constr_rid_cod_1_new');

som2_classe1=selforgmap([(n1+1) (n1+1)], 100,1);
som2_classe1=train(som2_classe1, constr_rid_cod_1_new');

som3_classe1=selforgmap([(n1-1) (n1-1)], 100,1);
som3_classe1=train(som3_classe1, constr_rid_cod_1_new');

%5.
load("som1_classe0.mat");
load("som2_classe0.mat");
load("som3_classe0.mat");
load("som1_classe1.mat");
load("som2_classe1.mat");
load("som3_classe1.mat");

pesi_10 = som1_classe0.IW{1,1};
pesi_20 = som2_classe0.IW{1,1};
pesi_30 = som3_classe0.IW{1,1};
pesi_11 = som1_classe1.IW{1,1};
pesi_21 = som2_classe1.IW{1,1};
pesi_31 = som3_classe1.IW{1,1};
%le righe corrispondono ai neuroni mentre le colonne corrispondono alle variabili

load("pesi_10.mat");

dend_10=linkage(pesi_10,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_10,0,'ColorThreshold', 0.35); 
title('Dendrogramma som1_classe0');
%HO 11 CLUSTER
etichette_cluster10 = cluster(dend_10, 'maxclust', 11);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster10 = accumarray(etichette_cluster10, 1); % Conta il numero di pazienti per ciascun cluster
%taglimultipli  
posizioni1 = find(etichette_cluster10(:,1) == 6);
dend_10_taglio1 = linkage(pesi_10(posizioni1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_10_taglio1, 0, 'ColorThreshold', 0.21);
title('Dendrogramma som1_classe0 taglio1');
etichette_cluster10_taglio1 = cluster(dend_10_taglio1, 'maxclust', 3);
num = accumarray(etichette_cluster10_taglio1, 1);
% dopo taglio 1 -> da 1 a 3 (+2)
posizioni2 = find(etichette_cluster10(:,1) == 2);
dend_10_taglio2 = linkage(pesi_10(posizioni2,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_10_taglio2, 0, 'ColorThreshold', 0.21);
title('Dendrogramma som1_classe0 taglio2');
etichette_cluster10_taglio2 = cluster(dend_10_taglio2, 'maxclust', 3);
num = accumarray(etichette_cluster10_taglio2, 1);
% dopo taglio 2 -> da 1 a 3 (+2)
etichette10new = etichette_cluster10;
posizioni1_1 = find(etichette_cluster10_taglio1 == 1);
posizioni1_2 = find(etichette_cluster10_taglio1 == 2);
posizioni1_3 = find(etichette_cluster10_taglio1 == 3);
etichette10new(posizioni1(posizioni1_1)) = 6; 
etichette10new(posizioni1(posizioni1_2)) = 12; 
etichette10new(posizioni1(posizioni1_3)) = 13; 
posizioni2_1 = find(etichette_cluster10_taglio2 == 1);
posizioni2_2 = find(etichette_cluster10_taglio2 == 2);
posizioni2_3 = find(etichette_cluster10_taglio2 == 3);
etichette10new(posizioni2(posizioni2_1)) = 2; 
etichette10new(posizioni2(posizioni2_2)) = 14; 
etichette10new(posizioni2(posizioni2_3)) = 15; 

num_pazienti_per_cluster10new = accumarray(etichette10new, 1);

m_cluster10 = zeros(196,5);
m_cluster10 = pesi_10;
for i = 1:196
    m_cluster10(i,5) = etichette10new(i,1);
end
pesi_10_new = [];
%cluster da eliminare nessuno (elem<5)
riga1 = 1;
for i = 1:196
        pesi_10_new(riga1,:) = m_cluster10(i,:);
        riga1 = riga1 + 1;
end
% CLUSTER PESI_10 cluster = 15

load("pesi_20.mat");

dend_20=linkage(pesi_20,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_20,0,'ColorThreshold', 0.4); 
title('Dendrogramma som2_classe0');
%HO 9 CLUSTER
etichette_cluster20 = cluster(dend_20, 'maxclust', 9);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster20 = accumarray(etichette_cluster20, 1); % Conta il numero di pazienti per ciascun cluster
%taglimultipli  
posizioni1 = find(etichette_cluster20(:,1) == 7);
dend_20_taglio1 = linkage(pesi_20(posizioni1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_20_taglio1, 0, 'ColorThreshold', 0.22);
title('Dendrogramma som2_classe0 taglio1');
etichette_cluster20_taglio1 = cluster(dend_20_taglio1, 'maxclust', 5);
num = accumarray(etichette_cluster20_taglio1, 1);
% dopo taglio 1 -> da 1 a 5 (+4)
posizioni2 = find(etichette_cluster20(:,1) == 6);
dend_20_taglio2 = linkage(pesi_20(posizioni2,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_20_taglio2, 0, 'ColorThreshold', 0.23);
title('Dendrogramma som2_classe0 taglio2');
etichette_cluster20_taglio2 = cluster(dend_20_taglio2, 'maxclust', 3);
num = accumarray(etichette_cluster20_taglio2, 1);
% dopo taglio 2 -> da 1 a 3 (+2)
etichette20new = etichette_cluster20;
posizioni1_1 = find(etichette_cluster20_taglio1 == 1);
posizioni1_2 = find(etichette_cluster20_taglio1 == 2);
posizioni1_3 = find(etichette_cluster20_taglio1 == 3);
posizioni1_4 = find(etichette_cluster20_taglio1 == 4);
posizioni1_5 = find(etichette_cluster20_taglio1 == 5);
etichette20new(posizioni1(posizioni1_1)) = 7; 
etichette20new(posizioni1(posizioni1_2)) = 10; 
etichette20new(posizioni1(posizioni1_3)) = 11; 
etichette20new(posizioni1(posizioni1_4)) = 12;
etichette20new(posizioni1(posizioni1_5)) = 13;
posizioni2_1 = find(etichette_cluster20_taglio2 == 1);
posizioni2_2 = find(etichette_cluster20_taglio2 == 2);
posizioni2_3 = find(etichette_cluster20_taglio2 == 3);
etichette20new(posizioni2(posizioni2_1)) = 6; 
etichette20new(posizioni2(posizioni2_2)) = 14; 
etichette20new(posizioni2(posizioni2_3)) = 15; 

num_pazienti_per_cluster20new = accumarray(etichette20new, 1);

m_cluster20 = zeros(225,5);
m_cluster20 = pesi_20;
for i = 1:225
    m_cluster20(i,5) = etichette20new(i,1);
end
pesi_20_new = [];
%cluster da eliminare nessuno (elem<5)
riga1 = 1;
for i = 1:225
        pesi_20_new(riga1,:) = m_cluster20(i,:);
        riga1 = riga1 + 1;
end
% CLUSTER PESI_20 = 15
clear all
load("pesi_30.mat");

dend_30=linkage(pesi_30,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_30,0,'ColorThreshold', 0.295); 
title('Dendrogramma som3_classe0');
%HO 13 CLUSTER
etichette_cluster30 = cluster(dend_30, 'maxclust', 13);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster30 = accumarray(etichette_cluster30, 1); % Conta il numero di pazienti per ciascun cluster
%taglimultipli  
posizioni1 = find(etichette_cluster30(:,1) == 2);
dend_30_taglio1 = linkage(pesi_30(posizioni1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_30_taglio1, 0, 'ColorThreshold', 0.23);
title('Dendrogramma som3_classe0 taglio1');
etichette_cluster30_taglio1 = cluster(dend_30_taglio1, 'maxclust', 3);
num = accumarray(etichette_cluster30_taglio1, 1);
% dopo taglio 1 -> da 1 a 3 (+2)
posizioni2 = find(etichette_cluster30(:,1) == 11);
dend_30_taglio2 = linkage(pesi_30(posizioni2,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_30_taglio2, 0, 'ColorThreshold', 0.25);
title('Dendrogramma som3_classe0 taglio2');
etichette_cluster30_taglio2 = cluster(dend_30_taglio2, 'maxclust', 2);
num = accumarray(etichette_cluster30_taglio2, 1);
% dopo taglio 2 -> da 1 a 2 (+1)

etichette30new = etichette_cluster30;
posizioni1_1 = find(etichette_cluster30_taglio1 == 1);
posizioni1_2 = find(etichette_cluster30_taglio1 == 2);
posizioni1_3 = find(etichette_cluster30_taglio1 == 3);
etichette30new(posizioni1(posizioni1_1)) = 2; 
etichette30new(posizioni1(posizioni1_2)) = 14; 
etichette30new(posizioni1(posizioni1_3)) = 15; 
posizioni2_1 = find(etichette_cluster30_taglio2 == 1);
posizioni2_2 = find(etichette_cluster30_taglio2 == 2);
etichette30new(posizioni2(posizioni2_1)) = 11; 
etichette30new(posizioni2(posizioni2_2)) = 16; 

num_pazienti_per_cluster30new = accumarray(etichette30new, 1);

m_cluster30 = zeros(169,5);
m_cluster30 = pesi_30;
for i = 1:169
    m_cluster30(i,5) = etichette30new(i,1);
end
pesi_30_new = [];
%cluster da eliminare 12 (elem<5)
valid_set_eliminati_30 = [];
riga1 = 1;
riga2 = 1;
for i = 1:169
    if m_cluster30(i,5)==12
        valid_set_eliminati_30(riga2,:) = m_cluster30(i,:);
        riga2 = riga2 + 1;
    else
        pesi_30_new(riga1,:) = m_cluster30(i,:);
        riga1 = riga1 + 1;
    end
end

% Valori da cercare e rimuovere
valori_da_rimuovere = [12];

% Crea un vettore logico che indichi quali elementi devono essere mantenuti
indici_da_mantenere = ~ismember(etichette30new, valori_da_rimuovere);

% Seleziona solo gli elementi che devono essere mantenuti
etichette30new_eliminati = etichette30new(indici_da_mantenere);

% CLUSTER PESI_30 = 16

load("pesi_11.mat");

dend_11=linkage(pesi_11,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_11,0,'ColorThreshold', 0.27); 
title('Dendrogramma som1_classe1');
%HO 12 CLUSTER
etichette_cluster11 = cluster(dend_11, 'maxclust', 12);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster11 = accumarray(etichette_cluster11, 1); % Conta il numero di pazienti per ciascun cluster
%taglimultipli  
posizioni2 = find(etichette_cluster11(:,1) == 8);
dend_11_taglio2 = linkage(pesi_11(posizioni2,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_11_taglio2, 0, 'ColorThreshold', 0.23);
title('Dendrogramma som1_classe1 taglio2');
etichette_cluster11_taglio2 = cluster(dend_11_taglio2, 'maxclust', 2);
num = accumarray(etichette_cluster11_taglio2, 1);
% dopo taglio 1 -> da 1 a 2 (+1)
etichette11new = etichette_cluster11;
posizioni2_1 = find(etichette_cluster11_taglio2 == 1);
posizioni2_2 = find(etichette_cluster11_taglio2 == 2);
etichette11new(posizioni2(posizioni2_1)) = 8; 
etichette11new(posizioni2(posizioni2_2)) = 13;

num_pazienti_per_cluster11new = accumarray(etichette11new, 1);

m_cluster1 = zeros(144,5);
m_cluster1 = pesi_11;
for i = 1:144
    m_cluster1(i,5) = etichette11new(i,1);
end
pesi_11_new = [];
%cluster da eliminare nessuno (elem<4)
riga1 = 1;
for i = 1:144
        pesi_11_new(riga1,:) = m_cluster1(i,:);
        riga1 = riga1 + 1;
end

% CLUSTER PESI_11 = 13

load("pesi_21.mat");

dend_21=linkage(pesi_21,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_21,0,'ColorThreshold', 0.33); 
title('Dendrogramma som2_classe1');
%HO 12 CLUSTER
etichette_cluster21 = cluster(dend_21, 'maxclust', 12);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster21 = accumarray(etichette_cluster21, 1); % Conta il numero di pazienti per ciascun cluster
%taglimultipli  
% posizioni1 = find(etichette_cluster21(:,1) == 5);
% dend_21_taglio1 = linkage(pesi_21(posizioni1,:),"complete","cityblock");
% figure(2)
% [h, tperm] = dendrogram(dend_21_taglio1, 0, 'ColorThreshold', 0.18);
% title('Dendrogramma som2_classe1 taglio1');
% etichette_cluster21_taglio1 = cluster(dend_21_taglio1, 'maxclust', 3);
% num = accumarray(etichette_cluster21_taglio1, 1);
% dopo taglio 1 -> da 1 a 3 (+2)
% posizioni2 = find(etichette_cluster21(:,1) == 10);
% dend_21_taglio2 = linkage(pesi_21(posizioni2,:),"complete","cityblock");
% figure(2)
% [h, tperm] = dendrogram(dend_21_taglio2, 0, 'ColorThreshold', 0.27);
% title('Dendrogramma som2_classe1 taglio2');
% etichette_cluster21_taglio2 = cluster(dend_21_taglio2, 'maxclust', 2);
% num = accumarray(etichette_cluster21_taglio2, 1);
% dopo taglio 2 -> da 1 a 2 (+1)
etichette21new = etichette_cluster21;
% posizioni1_1 = find(etichette_cluster21_taglio1 == 1);
% posizioni1_2 = find(etichette_cluster21_taglio1 == 2);
% posizioni1_3 = find(etichette_cluster21_taglio1 == 3);
% etichette21new(posizioni1(posizioni1_1)) = 5; 
% etichette21new(posizioni1(posizioni1_2)) = 13; 
% etichette21new(posizioni1(posizioni1_3)) = 14;
% posizioni2_1 = find(etichette_cluster21_taglio2 == 1);
% posizioni2_2 = find(etichette_cluster21_taglio2 == 2);
% etichette21new(posizioni2(posizioni2_1)) = 10; 
% etichette21new(posizioni2(posizioni2_2)) = 15; 

num_pazienti_per_cluster21new = accumarray(etichette21new, 1);

% m_cluster1 = zeros(169,5);
% m_cluster1 = pesi_21;
% for i = 1:169
%     m_cluster1(i,5) = etichette21new(i,1);
% end
% pesi_21_new = [];
% %cluster da eliminare ne (elem<5)
% valid_set_eliminati_21 = [];
% riga1 = 1;
% riga2 = 1;
% for i = 1:169
%     if m_cluster1(i,5)==9  || m_cluster1(i,5)==12
%         valid_set_eliminati_21(riga2,:) = m_cluster1(i,:);
%         riga2 = riga2 + 1;
%     else
%         pesi_21_new(riga1,:) = m_cluster1(i,:);
%         riga1 = riga1 + 1;
%     end
% end
% 
% % Valori da cercare e rimuovere
% valori_da_rimuovere = [9,12];
% 
% % Crea un vettore logico che indichi quali elementi devono essere mantenuti
% indici_da_mantenere = ~ismember(etichette21new, valori_da_rimuovere);
% 
% % Seleziona solo gli elementi che devono essere mantenuti
% etichette21new_eliminati = etichette21new(indici_da_mantenere);
% CLUSTER PESI_21 = 12+2+1-2 = 13

load("pesi_31.mat");

dend_31=linkage(pesi_31,"complete", 'cityblock');
figure(1) 
[h, tperm] = dendrogram(dend_31,0,'ColorThreshold', 0.33); 
title('Dendrogramma som3_classe1');
%HO 10 CLUSTER
etichette_cluster31 = cluster(dend_31, 'maxclust', 10);
% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster31 = accumarray(etichette_cluster31, 1); % Conta il numero di pazienti per ciascun cluster
%tagli multipli
posizioni1 = find(etichette_cluster31(:,1) == 5);
dend_31_taglio1 = linkage(pesi_31(posizioni1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_31_taglio1, 0, 'ColorThreshold', 0.24);
title('Dendrogramma som3_classe1 taglio1');
etichette_cluster31_taglio1 = cluster(dend_31_taglio1, 'maxclust', 2);
num = accumarray(etichette_cluster31_taglio1, 1);
% dopo taglio 1 -> da 1 a 2 (+1)
etichette31new = etichette_cluster31;
posizioni3_1 = find(etichette_cluster31_taglio1 == 1);
posizioni3_2 = find(etichette_cluster31_taglio1 == 2);
etichette31new(posizioni1(posizioni3_1)) = 5; 
etichette31new(posizioni1(posizioni3_2)) = 11; 

num_pazienti_per_cluster31new = accumarray(etichette31new, 1);

m_cluster1 = zeros(121,5);
m_cluster1 = pesi_31;
for i = 1:121
    m_cluster1(i,5) = etichette_cluster31(i,1);
end
pesi_31_new = [];
%cluster da eliminare nessuno 
riga1 = 1;
for i = 1:121
        pesi_31_new(riga1,:) = m_cluster1(i,:);
        riga1 = riga1 + 1;
end


% CLUSTER PESI_31 = 10+1-1 = 10

%6.
load("constr_rid_cod_0_new.mat");
load("constr_rid_cod_1_new.mat");
load("som1_classe0.mat");
load("som2_classe0.mat");
load("som3_classe0.mat");
load("som1_classe1.mat");
load("som2_classe1.mat");
load("som3_classe1.mat");

y1_0=som1_classe0(constr_rid_cod_0_new');
y2_0=som2_classe0(constr_rid_cod_0_new');
y3_0=som3_classe0(constr_rid_cod_0_new');

y1_1=som1_classe1(constr_rid_cod_1_new');
y2_1=som2_classe1(constr_rid_cod_1_new');
y3_1=som3_classe1(constr_rid_cod_1_new');

classes1_0=vec2ind(y1_0);
classes2_0=vec2ind(y2_0);
classes3_0=vec2ind(y3_0);

classes1_1=vec2ind(y1_1);
classes2_1=vec2ind(y2_1);
classes3_1=vec2ind(y3_1);

%6.3
clear all
load("constr_cod_1_new.mat");
load("etichette31new.mat");
load("classes3_1.mat");

m_cluster = zeros(657,7);
m_cluster = constr_cod_1_new;
    for i = 1:657
        paziente = constr_cod_1_new(i,:); 
        neurone = classes3_1(1, i);
        for j = 1:121
            if neurone == j    
               n_cluster = etichette31new(j,1);
                m_cluster(i,7) = n_cluster;
            end        
        end
    end
constr_cod_0b=m_cluster;

% Definisco il numero massimo di valori possibili nella colonna 7
insieme10 = unique(etichette31new);


% Inizializzazione di una cella per contenere le matrici risultanti
matrici_risultanti31 = cell(1, numel(insieme10));

% Ciclo su ogni elemento di insieme10
for i = 1:numel(insieme10)
    valore_corrente = insieme10(i);

    % Inizializzazione di una matrice vuota per contenere le righe con il valore corrente
    matrice_corrente = [];

    % Ciclo su tutte le righe della matrice constr_cod_0b
    for riga = 1:size(constr_cod_0b, 1)
        % Controlla se il valore corrente è presente nella settima colonna della riga corrente
        if constr_cod_0b(riga, 7) == valore_corrente
            % Se il valore è presente, aggiungi la riga alla matrice corrente
            matrice_corrente = [matrice_corrente; constr_cod_0b(riga, :)];
        end
    end

    % Aggiungi la matrice corrente alla cella delle matrici risultanti
    matrici_risultanti31{i} = matrice_corrente;
end
% Ora matrici_risultanti contiene tutte le matrici separate per valore presente nella settima colonna di constr_cod_0b


% 7
% Supponiamo di avere un cell array 'matrici_per_valore' contenente un numero sconosciuto di matrici
% Rimuovere l'ultima colonna da ciascuna matrice nel cell array
% matrici solo con valori selezionati
clear all
load("matrici_risultanti31.mat");
for i = 1:length(matrici_risultanti31)
    if ~isempty(matrici_risultanti31{i})
        matrici_risultanti31_rid{i} = matrici_risultanti31{i}(:, 2:5);
    end
end

%7.1
clear all
load("matrici_risultanti31_rid.mat");
variabilita_intra_cluster31 = zeros(1, numel(matrici_risultanti31_rid)); % Inizializza un vettore per memorizzare la variabilità intra-cluster di ogni cluster

for i = 1:numel(matrici_risultanti31_rid)
    % Seleziona solo le colonne relative alle variabili di input (escludendo la colonna relativa alla classe e all'ID)
    variabili_input = matrici_risultanti31_rid{i}(:, 1:end-2); % Considerando solo le colonne relative alle variabili di input

    % Calcola le distanze tra tutte le coppie di elementi nel cluster utilizzando la distanza di Manhattan ('cityblock')
    distanze = pdist(variabili_input, 'cityblock');

    % Calcola la somma delle distanze
    somma_distanze = sum(distanze);

    % Calcola il numero totale di elementi nel cluster
    numero_elementi = size(variabili_input, 1);

    % Calcola la variabilità intra-cluster dividendo la somma delle distanze per il numero totale di elementi nel cluster
    variabilita_intra_cluster31(i) = somma_distanze / numero_elementi;
end

% % Ora 'variabilita_intra_cluster' contiene la variabilità intra-cluster di ciascun cluster

% 7.2 
clear all
load("variabilita_intra_cluster10.mat");
load("variabilita_intra_cluster20.mat");
load("variabilita_intra_cluster30.mat");
load("variabilita_intra_cluster11.mat");
load("variabilita_intra_cluster21.mat");
load("variabilita_intra_cluster31.mat");
VarIntraMax10 = 0; 
for i = 1:numel(variabilita_intra_cluster10) 
    if variabilita_intra_cluster10(1,i) > VarIntraMax10 
        VarIntraMax10 = variabilita_intra_cluster10(1,i); 
    end 
end 
 
VarIntraMax11 = 0; 
for i = 1:numel(variabilita_intra_cluster11) 
    if variabilita_intra_cluster11(1,i) > VarIntraMax11 
        VarIntraMax11 = variabilita_intra_cluster11(1,i); 
    end 
end 
 
VarIntraMax20 = 0; 
for i = 1:numel(variabilita_intra_cluster20) 
    if variabilita_intra_cluster20(1,i) > VarIntraMax20 
        VarIntraMax20 = variabilita_intra_cluster20(1,i); 
    end 
end 
 
VarIntraMax21 = 0; 
for i = 1:numel(variabilita_intra_cluster21) 
    if variabilita_intra_cluster21(1,i) > VarIntraMax21 
        VarIntraMax21 = variabilita_intra_cluster21(1,i); 
    end 
end 
 
VarIntraMax30 = 0; 
for i = 1:numel(variabilita_intra_cluster30) 
    if variabilita_intra_cluster30(1,i) > VarIntraMax30 
        VarIntraMax30 = variabilita_intra_cluster30(1,i); 
    end 
end 
 
VarIntraMax31 = 0; 
for i = 1:numel(variabilita_intra_cluster31) 
    if variabilita_intra_cluster31(1,i) > VarIntraMax31 
        VarIntraMax31 = variabilita_intra_cluster31(1,i); 
    end 
end 

 
% 7.3  
 
SOM_best_Extubation_failure = 20; 
VarIntraMax_0 = [VarIntraMax30, VarIntraMax20, VarIntraMax10]; 
for i = 1:length(VarIntraMax_0) 
    if SOM_best_Extubation_failure > VarIntraMax_0(1,i) 
        SOM_best_Extubation_failure = VarIntraMax_0(1,i); 
    end 
end 
 
SOM_best_Extubation_success = 20; 
VarIntraMax_1 = [VarIntraMax31, VarIntraMax21, VarIntraMax11]; 
for i = 1:length(VarIntraMax_1) 
    if SOM_best_Extubation_success > VarIntraMax_1(1,i) 
        SOM_best_Extubation_success = VarIntraMax_1(1,i); 
    end 
end

% La dimensione della SOM migliore è la VarIntraMax31 per gli Extubation 
% success e la VarIntraMax10 per gli Extubation failure

%8.1
% la classe meno rappresentata è la 1 -> SOM31 (60-40)
clear all
load('matrici_risultanti31.mat');
% Inizializzare una matrice vuota
matrice_unica31 = [];

% Concatenare tutte le matrici in una matrice unica
for i = 1:length(matrici_risultanti31)
    matrice_unica31 = [matrice_unica31; matrici_risultanti31{i}];
end

% Identifica i cluster unici
clusters = unique(matrice_unica31(:, 7));

% Inizializza le matrici per training set e validation set
tr_set_dendro_peso_31_new = [];
valid_set_dendro_peso_31_new = [];

% Percentuale per il training set
training_ratio = 0.60;

% Itera attraverso ciascun cluster
for i = 1:length(clusters)
    % Trova gli indici dei pazienti appartenenti al cluster corrente
    cluster_indices = find(matrice_unica31(:, 7) == clusters(i));
    
    % Randomizza gli indici
    rand_indices = cluster_indices(randperm(length(cluster_indices)));
    
    % Determina il numero di pazienti da inserire nel training set
    num_training = ceil(length(rand_indices) * training_ratio);
    
    % Dividi gli indici
    training_indices = rand_indices(1:num_training);
    validation_indices = rand_indices(num_training + 1:end);
    
    % Estrai le righe corrispondenti e aggiungile ai set
    tr_set_dendro_peso_31_new = [tr_set_dendro_peso_31_new; matrice_unica31(training_indices, :)];
    valid_set_dendro_peso_31_new = [valid_set_dendro_peso_31_new; matrice_unica31(validation_indices, :)];
end

%8.2
% la classe piu rappresentata è la 0 -> SOM10 (21-79)
clear all
load('matrici_risultanti10.mat');
% Inizializzare una matrice vuota
matrice_unica10 = [];

% Concatenare tutte le matrici in una matrice unica
for i = 1:length(matrici_risultanti10)
    matrice_unica10 = [matrice_unica10; matrici_risultanti10{i}];
end

% Identifica i cluster unici
clusters = unique(matrice_unica10(:, 7));

% Inizializza le matrici per training set e validation set
tr_set_dendro_peso_10_new = [];
valid_set_dendro_peso_10_new = [];

% Percentuale per il training set
training_ratio = 0.21;

% Itera attraverso ciascun cluster
for i = 1:length(clusters)
    % Trova gli indici dei pazienti appartenenti al cluster corrente
    cluster_indices = find(matrice_unica10(:, 7) == clusters(i));
    
    % Randomizza gli indici
    rand_indices = cluster_indices(randperm(length(cluster_indices)));
    
    % Determina il numero di pazienti da inserire nel training set
    num_training = ceil(length(rand_indices) * training_ratio);
    
    % Dividi gli indici
    training_indices = rand_indices(1:num_training);
    validation_indices = rand_indices(num_training + 1:end);
    
    % Estrai le righe corrispondenti e aggiungile ai set
    tr_set_dendro_peso_10_new = [tr_set_dendro_peso_10_new; matrice_unica10(training_indices, :)];
    valid_set_dendro_peso_10_new = [valid_set_dendro_peso_10_new; matrice_unica10(validation_indices, :)];
end

%8.3
clear all
load('tr_set_dendro_peso_10_new.mat');
load('valid_set_dendro_peso_10_new.mat');
load('tr_set_dendro_peso_31_new.mat');
load('valid_set_dendro_peso_31_new.mat');

tr_set_som_cod = [tr_set_dendro_peso_10_new(:,1:6); tr_set_dendro_peso_31_new(:,1:6)];
val_set_som_cod = [valid_set_dendro_peso_10_new(:,1:6); valid_set_dendro_peso_31_new(:,1:6)];

% 10) 
tr_set_som_cod_new = tr_set_som_cod; 
val_set_som_cod_new = val_set_som_cod; 
tr_set_som_cod_new(:,1) = []; 
val_set_som_cod_new(:,1) = []; 
 
% 11) 
Knn = fitcknn(tr_set_som_cod_new(:, 1:end-1), tr_set_som_cod_new(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ... 
'IncludeTies',true, 'BreakTies', 'nearest'); 
 
% 12)  
out_tr_som = predict(Knn, tr_set_som_cod_new (:, 1:end-1));  
out_val_som = predict(Knn, val_set_som_cod_new(:, 1:end-1)); 
 
% 13) 
A_som = confusionmat(tr_set_som_cod_new(:,end),out_tr_som); 
B_som = confusionmat(val_set_som_cod_new(:,end),out_val_som); 
 
figure(1) 
confusionchart(A_som,[0 1]) 
title('Codified Variables Tr. set'); 
figure(2) 
confusionchart(B_som,[0 1]) 
title('Codified Variables Val. set');

%BOLLE
%10
load("classes1_0.mat");
load("etichette10new.mat");
% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, 196);

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes1_0, 2)
    neurone_vincitore = classes1_0(1, i);
    conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
end

m_10 = zeros(196, 2);
m_10(:,1) = conteggio_vittorie;
m_10(:,2) = etichette10new;

m_c = zeros(196, 2);
m_c(:,1) = etichette10new;
m_c(:,2) = etichette10new;

plot_hex_grid(m_10, 14);
plot_hex_grid(m_c, 14);

%20
clear all
load("classes2_0.mat");
load("etichette20new.mat");

% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, length(etichette20new));

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes2_0, 2)
    neurone_vincitore = classes2_0(1, i);
    % Controlla se il neurone vincitore è all'interno dell'intervallo valido
    if neurone_vincitore > 0 && neurone_vincitore <= length(etichette20new)
        conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
    end
end

m_20 = zeros(225, 2);
m_20(:,1) = conteggio_vittorie;
m_20(:,2) = etichette20new;

m_c = zeros(225, 2);
m_c(:,1) = etichette20new;
m_c(:,2) = etichette20new;

plot_hex_grid(m_20, 15);
plot_hex_grid(m_c, 15);

%30
clear all
load("classes3_0.mat");
load("etichette30new_eliminati.mat");

% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, length(etichette30new_eliminati));

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes3_0, 2)
    neurone_vincitore = classes3_0(1, i);
    % Controlla se il neurone vincitore è all'interno dell'intervallo valido
    if neurone_vincitore > 0 && neurone_vincitore <= length(etichette30new_eliminati)
        conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
    end
end

m_30 = zeros(166, 2);
m_30(:,1) = conteggio_vittorie;
m_30(:,2) = etichette30new_eliminati;
plot_hex_grid(m_30, 13);

m_c = zeros(166, 2);
m_c(:,1) = etichette30new_eliminati;
m_c(:,2) = etichette30new_eliminati;
plot_hex_grid(m_c, 13);

%11
clear all
load("classes1_1.mat");
load("etichette11new.mat");

% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, length(etichette11new));

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes1_1, 2)
    neurone_vincitore = classes1_1(1, i);
    % Controlla se il neurone vincitore è all'interno dell'intervallo valido
    if neurone_vincitore > 0 && neurone_vincitore <= length(etichette11new)
        conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
    end
end

m_11 = zeros(144, 2);
m_11(:,1) = conteggio_vittorie;
m_11(:,2) = etichette11new;
plot_hex_grid(m_11, 12);

m_c = zeros(144, 2);
m_c(:,1) = etichette11new;
m_c(:,2) = etichette11new;
plot_hex_grid(m_c, 12);

%21
clear all
load("classes2_1.mat");
load("etichette21new.mat");

% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, length(etichette21new));

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes2_1, 2)
    neurone_vincitore = classes2_1(1, i);
    % Controlla se il neurone vincitore è all'interno dell'intervallo valido
    if neurone_vincitore > 0 && neurone_vincitore <= length(etichette21new)
        conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
    end
end

m_21 = zeros(169, 2);
m_21(:,1) = conteggio_vittorie;
m_21(:,2) = etichette21new;
plot_hex_grid(m_21, 13);

m_c = zeros(169, 2);
m_c(:,1) = etichette21new;
m_c(:,2) = etichette21new;
plot_hex_grid(m_c, 13);

%31
clear all
load("classes3_1.mat");
load("etichette31new.mat");

% Inizializza un vettore di conteggio per i neuroni
conteggio_vittorie = zeros(1, length(etichette31new));

% Calcola il numero di vincite per ogni neurone
for i = 1:size(classes3_1, 2)
    neurone_vincitore = classes3_1(1, i);
    % Controlla se il neurone vincitore è all'interno dell'intervallo valido
    if neurone_vincitore > 0 && neurone_vincitore <= length(etichette31new)
        conteggio_vittorie(neurone_vincitore) = conteggio_vittorie(neurone_vincitore) + 1;
    end
end

m_31 = zeros(121, 2);
m_31(:,1) = conteggio_vittorie;
m_31(:,2) = etichette31new;
plot_hex_grid(m_31, 11);

m_c = zeros(121, 2);
m_c(:,1) = etichette31new;
m_c(:,2) = etichette31new;
plot_hex_grid(m_c, 11);



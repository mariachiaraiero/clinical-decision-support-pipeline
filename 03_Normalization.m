
clear all
clear clc
clc


load('matrice_finale.mat');
load('construction_set.mat');
load('test_set.mat');
load('train_set.mat');
load('valid_set.mat');
load('train_set_norm.mat');
load('valid_set_norm.mat');
load('massimi.mat');
load('minimi.mat');

% vettorevariabili = zeros(52,1);
% for i = 1:52
%     vettorevariabili(i,1) = i;
% end
% tabella = table(vettorevariabili, minimi', massimi');
% % Salvataggio della tabella in un file Excel
% writetable(tabella, 'tabella_minmax.xlsx', 'Sheet', 1);

% % conto claase 0 e 1
% c1 = 0;
% c0 = 0;
% for i = 1:1735
%     if valid_set(i,54) == 1
%         c1 = c1 + 1;   
%     else 
%         c0 = c0 + 1;   
%     end 
% end

load('fit_best_rip_sign_1.mat')
load('fit_best_rip_sign_2.mat')
load('fit_best_rip_sign_3.mat')
load('fit_best_rip_sign_4.mat')
load('fit_best_rip_sign_5.mat')
load('fit_best_rip_sign_6.mat')

load('fit_best_rip_sign3_1.mat');
load('fit_best_rip_sign3_2.mat');
load('fit_best_rip_sign3_3.mat');
load('fit_best_rip_sign3_4.mat');
load('fit_best_rip_sign3_5.mat');
load('fit_best_rip_sign3_6.mat');
load('fit_best_rip_sign3_new.mat');



load('fit_best_rip_1.mat')
fit_best_rip_1 = fit_best_rip;
load('fit_best_rip_2.mat')
fit_best_rip_2 = fit_best_rip;
load('fit_best_rip_3.mat')
fit_best_rip_3 = fit_best_rip;
load('fit_best_rip_4.mat');
fit_best_rip_4 = fit_best_rip;
load('fit_best_rip_5.mat');
fit_best_rip_5 = fit_best_rip;
load('fit_best_rip_6.mat');
fit_best_rip_6 = fit_best_rip;
load('fit_best_rip_new.mat');
fit_best_rip_new = fit_best_rip;


load('sol_best_rip_1.mat');
sol_best_rip_1 = sol_best_rip;
load('sol_best_rip_2.mat');
sol_best_rip_2 = sol_best_rip;
load('sol_best_rip_3.mat');
sol_best_rip_3 = sol_best_rip;
load('sol_best_rip_4.mat');
sol_best_rip_4 = sol_best_rip;
load('sol_best_rip_5.mat');
sol_best_rip_5 = sol_best_rip;
load('sol_best_rip_6.mat');
sol_best_rip_6 = sol_best_rip;
load('sol_best_rip_new.mat');
sol_best_rip_new = sol_best_rip;

% 
% %--------OBIETTIVO 4---------
% %1. creazione Construction Set e Test Set
% %eliminazione pazienti non corretti
% for i=1:3633
%     if matr(i,1)== 10715209
%         matr(i,:)=[];    
%     end
%     if matr(i,1)==14932641
%          matr(i,:)=[]; 
%     end
%     if matr(i,1)==16721536
%          matr(i,:)=[]; 
%     end
%     if matr(i,1)==17123098
%          matr(i,:)=[]; 
%     end
%     if matr(i,1)==10807297
%          matr(i,:)=[]; 
%     end
%     if matr(i,1)==15819558
%          matr(i,:)=[]; 
%     end
% 
% end 
% 
% %Calcolo il numero di righe del Test Set (30%) e del Construction Set (70%)
% c=size(matr,1);
% n_righe_test_set = round(0.3 * c);
% n_righe_construction_set = c - n_righe_test_set;
% 
% %vettore di indici casuali per selezionare le righe in modo randomico
% random_righe = randperm(c);
% 
% %Selezioniamo le righe per la Test Set
% test_set = matr(random_righe(1:n_righe_test_set), :);
% 
% %Selezioniamo le righe per la Construction Set
% construction_set = matr(random_righe(n_righe_test_set+1:end), :);
% 
% %2. creazione Training Set e Validation Set
% c1 = 0;
% c0 = 0;
% for i = 1:2539   
%     if construction_set(i,54) == 1
%         c1 = c1 + 1;   
%     else 
%         c0 = c0 + 1;   
%     end 
% end
% %c1 è minore di c0 quindi è la classe meno rappresentata
% %calcolare il 60% della c1
% n_paz=round(0.6*c1);
% matr_c1=zeros(c1,54);
% matr_c0=zeros(c0,54);
% r0=1;
% r1=1;
% for i=1:(c0+c1)
%     if(construction_set(i,54)==1)
%         matr_c1(r1,:) = construction_set(i,:);
%         r1 = r1 + 1;
%     else
%         matr_c0(r0,:) = construction_set(i,:);
%         r0 = r0 + 1;
%     end
% end
% 
% %Definisci il numero desiderato di righe casuali per il training set
% num_training_samples = n_paz;
% 
% % % Genera indici casuali per matr_c1 e matr_c0
% random_indices_c1 = randperm(size(matr_c1, 1));
% random_indices_c0 = randperm(size(matr_c0, 1));
% 
% % Seleziona le prime num_training_samples righe da matr_c1 e matr_c0
% training_set_c1 = matr_c1(random_indices_c1(1:num_training_samples), :);
% training_set_c0 = matr_c0(random_indices_c0(1:num_training_samples), :);
% 
% % Crea il training set combinando le righe selezionate da matr_c1 e matr_c0
% train_set = [training_set_c1; training_set_c0];
% 
% % Rimuovi le righe selezionate dal training set per ottenere il validation set
% validation_set_c1 = matr_c1(random_indices_c1(num_training_samples+1:end), :);
% validation_set_c0 = matr_c0(random_indices_c0(num_training_samples+1:end), :);
% 
% % Crea il validation set combinando le rimanenti righe di matr_c1 e matr_c0
% valid_set = [validation_set_c1; validation_set_c0];
% 
% %---------OBIETTIVO 5-------------
% % 3.
% 
% % Inizializzazione delle matrici di massimo e minimo
% massimi = zeros(1, 52);
% minimi = zeros(1, 52);
% 
% % Ciclo attraverso ogni colonna della matrice
% for j = 2:53
%     % Trova il massimo e il minimo della colonna corrente
%     massimi(j-1) = max(construction_set(:, j));
%     minimi(j-1) = min(construction_set(:, j));
% end
% 
% train_set_norm=zeros(804,54);
% valid_set_norm=zeros(1735,54);
% 
% train_set_norm(:,1)=train_set(:,1);
% train_set_norm(:,54)=train_set(:,54);
% valid_set_norm(:,1)=valid_set(:,1);
% valid_set_norm(:,54)=valid_set(:,54);
% 
% 
% for j=2:53
%     for i=1:804
%         train_set_norm(i,j)=(train_set(i,j)-minimi(j-1))/(massimi(j-1)-minimi(j-1));
%     end
% end
% 
% for k=2:53
%     for n=1:1735
%         valid_set_norm(n,k)=(valid_set(n,k)-minimi(k-1))/(massimi(k-1)-minimi(k-1));
%     end
% end
% 
% % 4. Nel file gamain_IIparte.m fornito, impostare parametri

% 5. Creare una popolazione iniziale

% 6. Caricare all’inizio dello script gamain_IIparte.m la popolazione salvata al punto 5 e le matrici 
% del training set e validation set NORMALIZZATE ottenute al punto 3

% 7. fare le varie prove

% 8. Identificare la coppia pc-pm che permette di ottenere il maggior numero di soluzioni con 
% fitness più ripetibile tra le 50 ottenute da ciascuna prova. 

% trovare valore più frequente della fitness per ogni coppia
fit_freq_1 = mode(fit_best_rip_sign3_1);
fit_freq_2 = mode(fit_best_rip_sign3_2);
fit_freq_3 = mode(fit_best_rip_sign3_3);
fit_freq_4 = mode(fit_best_rip_sign3_4);
fit_freq_5 = mode(fit_best_rip_sign3_5);
fit_freq_6 = mode(fit_best_rip_sign3_6);

c_1 = 0;
c_2 = 0;
c_3 = 0;
c_4 = 0;
c_5 = 0;
c_6 = 0;

% vedere quante volte si ripete in ogni prova il valore più frequente
for i = 1:50
     if(fit_best_rip_sign3_1(i,1)==fit_freq_1)
         c_1 = c_1 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign3_2(i,1)==fit_freq_2)
         c_2 = c_2 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign3_3(i,1)==fit_freq_3)
         c_3 = c_3 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign3_4(i,1)==fit_freq_4)
         c_4 = c_4 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign3_5(i,1)==fit_freq_5)
         c_5 = c_5 + 1;
     end
end

for i = 1:50
     if(fit_best_rip_sign3_6(i,1)==fit_freq_6)
         c_6 = c_6 + 1;
     end
end

ris_rip = [c_1, c_2, c_3, c_4, c_5, c_6];
max_rip = max(ris_rip);




% dai risultati ottenuti si deduce che le migliori coppie sono la 1,2,3,5
% si sceglie quella con pc e pm maggiori -> prova 5 ->  pc=1 e pm=0.1 

% 9. -> nuova popolazione

% 10.Scegliere, tra tutte le soluzioni ottenute (tutte quelle ottenute al punto 7 e al punto 9), la 
% soluzione migliore, cioè la soluzione con la fitness migliore in assoluto e, a parità di valore 
% di fitness, quella con il minor numero di variabili selezionate. 
% Cerca il valore minimo in tutte le matrici e registra le posizioni

% Calcola il valore minimo in ciascuna delle cinque matrici
fit_min = min([min(fit_best_rip_sign3_1), min(fit_best_rip_sign3_2), min(fit_best_rip_sign3_3), ...
    min(fit_best_rip_sign3_4), min(fit_best_rip_sign3_5), min(fit_best_rip_sign3_6),min(fit_best_rip_sign3_new)]);

min1 = min(fit_best_rip_sign3_1);
min2 = min(fit_best_rip_sign3_2);
min3 = min(fit_best_rip_sign3_3);
min4 = min(fit_best_rip_sign3_4);
min5 = min(fit_best_rip_sign3_5);
min6 = min(fit_best_rip_sign3_6);
min7 = min(fit_best_rip_sign3_new);

posizioni_1 = find(sol_best_rip_1(14,:) == 1)
v_1 = sum(sol_best_rip_1(14,:) == 1);

% Inizializza un vettore per memorizzare le posizioni di fit_min
fit_min_positions = [];


for i = 1:50
    if(fit_best_rip_sign3_1(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [1,i]]; %prima colonna indica in che prova si trova, la seconda la riga
    end

     if(fit_best_rip_sign3_2(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [2,i]];
     end

     if(fit_best_rip_sign3_3(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [3,i]];
     end

     if(fit_best_rip_sign3_4(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [4,i]];
     end

     if(fit_best_rip_sign3_5(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [5,i]];
     end

     if(fit_best_rip_sign3_6(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [6,i]];
     end

     if(fit_best_rip_sign3_new(i,1) == fit_min)
        fit_min_positions = [fit_min_positions; [7,i]];
     end
end

% fit_min = 0.3028 -> 1 prova 14 riga

% 11.
% 
% combinazioni_1 = sol_best_rip_1(pos_min(1),:);
% sum_1 = sum(combinazioni_1,2);
% 25 volte 

tr_set_rid = zeros(size(train_set_norm,1), 27);
tr_set_rid(:,1) = train_set_norm(:,1);
tr_set_rid(:,27) = train_set_norm(:,54);

c_rows = 2;

for i = 1:52
    if sol_best_rip_1(14,i) == 1
        tr_set_rid(:,c_rows) = train_set_norm(:,i);
        c_rows = c_rows + 1;
    end
end

val_set_rid = zeros(size(valid_set_norm,1), 27);
val_set_rid(:,1) = valid_set_norm(:,1);
val_set_rid(:,27) = valid_set_norm(:,54);

c_rows_2 = 2;

for i = 1:52
    if sol_best_rip_1(14,i) == 1
        val_set_rid(:,c_rows) = valid_set_norm(:,i);
        c_rows_2 = c_rows_2 + 1;
    end
end

val_random = valid_set_norm(:,[1 ]);

tr_set_rid(:,1) = [];

% 12.
Knn_yn_random=fitcknn(tr_set_rid(:, 1:end-1), tr_set_rid(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ... 
'IncludeTies',true, 'BreakTies', 'nearest');

% 13.
out_tr = predict(mdl, tr_set_rid (:, 1:end-1)); 
out_val = predict(mdl, val_set_rid(:, 1:end-1)); 

% 14.
a = confusionmat(train_set_norm(:,54), out_tr);
b = confusionmat(valid_set_norm(:,54), out_val);

figure(1)
confusionchart(a,[0 1])
figure(2)
confusionchart(b,[0 1])

%cifre significative
% fit_best_rip_sign3_new = zeros(50,1);
% 
% for i = 1:50
%     n = 3;
%     y = round(fit_best_rip_new(i,1), n - 1 - floor(log10(abs(fit_best_rip_new(i,1)))));
%     fit_best_rip_sign3_new(i,1) = y;
% end
% 
% %--------grafici a ripetibilita'-----------
% 
% % fit_best_rip_1 è il vettore di dati
% data = fit_best_rip_sign3_3;
% 
% % Calcola la frequenza di ciascun valore nel vettore
% unique_values = unique(data);
% frequency = histcounts(data, [unique_values; max(unique_values)+1]);
% 
% % Visualizza il grafico a barre
% bar(1:numel(unique_values), frequency); % Imposta un intervallo di valori uniformemente distanziati sull'asse x
% 
% % Imposta le etichette sull'asse x
% xticks(1:numel(unique_values));
% xticklabels(unique_values);
% xtickangle(90); % Imposta l'angolo di rotazione a 90 gradi per le etichette sull'asse x
% 
% % Trova l'indice della colonna più alta
% [max_frequency, max_index] = max(frequency);
% 
% % Evidenzia la colonna più alta in rosso
% hold on
% bar(max_index, max_frequency, 'r'); % Imposta il colore rosso per la barra corrispondente alla colonna più alta
% hold off
% 
% % Aggiungi etichette e titoli
% xlabel('Valore della Fitness');
% ylabel('Frequenza della Fitness');
% title('Ripetizione dei valori della Fitness nella prova 3');
% % 
% % ----------------------------------------------------


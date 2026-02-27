clear all;
close all;
clc;

load('construction_set.mat');
load('constr_set_norm.mat');
load('constr_set_rid_cod.mat');
load('constr_set_cod.mat');
load('constr_rid_cod_0.mat');
load('constr_rid_cod_1.mat');
load('constr_cod_0.mat');
load('constr_cod_1.mat');
load('constr_cod_0_new.mat');
load('constr_cod_1_new.mat');
load("etichette0new.mat");
load('etichette1new.mat');
load('constr_rid_cod_0_new.mat');
load('constr_rid_cod_1_new.mat');
load('etichette0new_eliminati.mat');
load('etichette1new_eliminati.mat');
%%1.
% 
% massimi = zeros(1, 52); 
% minimi = zeros(1, 52); 
% 
%  for j = 2:53 
%      massimi(j-1) = max(construction_set(:, j)); 
%      minimi(j-1) = min(construction_set(:, j)); 
%  end 
% 
% constr_set_norm=zeros(2539,54); 
% constr_set_norm(:,1)=construction_set(:,1); 
% constr_set_norm(:,54)=construction_set(:,54); 
% 
% for j=2:53 
%      for i=1:2539 
%          constr_set_norm(i,j)=(construction_set(i,j)-minimi(j-1))/(massimi(j-1)-minimi(j-1)); 
%      end 
% end

%2. Usare come variabili selezionate le seguenti 4 variabili: calcium_median, ph_median, 
% po2_median e po2_std (23,27,31,32)

% %3. constr_set_rid_cod
% constr_set_rid_cod = zeros(size(constr_set_norm,1),5);
% constr_set_rid_cod = constr_set_norm(:,[23 27 31 32 54]);
% 
% %4.
% constr_set_cod = zeros(size(constr_set_norm,1),6);
% constr_set_cod = constr_set_norm(:,[1 23 27 31 32 54]);

% %5.creazione Training Set e Validation Set

%5.1
% c1 = 0;
% c0 = 0;
% for i = 1:2539   
%     if constr_set_rid_cod(i,5) == 1
%         c1 = c1 + 1;   
%     else 
%         c0 = c0 + 1;   
%     end 
% end
% %c1 è minore di c0 quindi è la classe meno rappresentata
% %calcolare il 60% della c1
% n_paz=round(0.6*c1);
% constr_rid_cod_1 = zeros(c1,5);
% constr_rid_cod_0 = zeros(c0,5);
% r0=1;
% r1=1;
% for i=1:(c0+c1)
%     if(constr_set_rid_cod(i,5)==1)
%         constr_rid_cod_1(r1,:) = constr_set_rid_cod(i,:);
%         r1 = r1 + 1;
%     else
%         constr_rid_cod_0(r0,:) = constr_set_rid_cod(i,:);
%         r0 = r0 + 1;
%     end
% end
% 
% constr_rid_cod_1(:,5) = [];
% constr_rid_cod_0(:,5) = [];

%5.2
% c1 = 0;
% c0 = 0;
% for i = 1:2539   
%     if constr_set_cod(i,6) == 1
%         c1 = c1 + 1;   
%     else 
%         c0 = c0 + 1;   
%     end 
% end
% %c1 è minore di c0 quindi è la classe meno rappresentata
% %calcolare il 60% della c1
% n_paz=round(0.6*c1);
% constr_cod_1 = zeros(c1,6);
% constr_cod_0 = zeros(c0,6);
% r0=1;
% r1=1;
% for i=1:(c0+c1)
%     if(constr_set_cod(i,6)==1)
%         constr_cod_1(r1,:) = constr_set_cod(i,:);
%         r1 = r1 + 1;
%     else
%         constr_cod_0(r0,:) = constr_set_cod(i,:);
%         r0 = r0 + 1;
%     end
% end
% 

%5.3
dend_0=linkage(constr_rid_cod_0,"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_0, 0, 'ColorThreshold', 0.47);
title('Dendrogramma classe 0');
% % Ottieni i colori delle linee
% line_colors = cell2mat(get(h, 'Color'));
% % Converti i colori in stringhe per poterli confrontare
% color_strings = cellstr(num2str(line_colors, '%f'));
% % Conta il numero di colori unici
% num_cluster_colored = numel(unique(color_strings));
% disp(['Numero di cluster colorati sopra la soglia: ', num2str(num_cluster_colored)]);
%HO 24 CLUSTER

% Effettua il taglio del dendrogramma per ottenere le etichette dei cluster
etichette_cluster0 = cluster(dend_0, 'maxclust', 24);

% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster0 = accumarray(etichette_cluster0, 1); % Conta il numero di pazienti per ciascun cluster
%i cluster non sono in ordine

%taglimultipli 
posizioni1 = find(etichette_cluster0(:,1) == 4);
dend_0_taglio1 = linkage(constr_rid_cod_0(posizioni1,:),"complete","cityblock");
figure(3)
[h, tperm] = dendrogram(dend_0_taglio1, 0, 'ColorThreshold', 0.35);
title('Dendrogramma classe 0 taglio1');

etichette_cluster0_taglio1 = cluster(dend_0_taglio1, 'maxclust', 5);

% posizioni1_2 = find(etichette_cluster0_taglio1(:,1) == 1);
% dend_0_taglio1_2 = linkage(constr_rid_cod_0(posizioni1_2,:),"complete","cityblock");
% figure(4)
% [h, tperm] = dendrogram(dend_0_taglio1_2, 0, 'ColorThreshold', 1.22);
% title('Dendrogramma classe 0 taglio1_2');

% etichette_cluster0_taglio1_2 = cluster(dend_0_taglio1_2, 'maxclust', 2);

posizioni2 = find(etichette_cluster0(:,1) == 6);
dend_0_taglio2 = linkage(constr_rid_cod_0(posizioni2,:),"complete","cityblock");
figure(5)
[h, tperm] = dendrogram(dend_0_taglio2, 0, 'ColorThreshold', 0.37);
title('Dendrogramma classe 0 taglio2');

etichette_cluster0_taglio2 = cluster(dend_0_taglio2, 'maxclust', 2);

posizioni3 = find(etichette_cluster0(:,1) == 14);
dend_0_taglio3 = linkage(constr_rid_cod_0(posizioni3,:),"complete","cityblock");
figure(6)
[h, tperm] = dendrogram(dend_0_taglio3, 0, 'ColorThreshold', 0.34);
title('Dendrogramma classe 0 taglio3');

etichette_cluster0_taglio3 = cluster(dend_0_taglio3, 'maxclust', 4);

posizioni4 = find(etichette_cluster0(:,1) == 8);
dend_0_taglio4 = linkage(constr_rid_cod_0(posizioni4,:),"complete","cityblock");
figure(7)
[h, tperm] = dendrogram(dend_0_taglio4, 0, 'ColorThreshold', 0.39);
title('Dendrogramma classe 0 taglio4');

etichette_cluster0_taglio4 = cluster(dend_0_taglio4, 'maxclust', 2);


%aggiornamento etichette:
etichette0new = etichette_cluster0;
posizioni1_1 = find(etichette_cluster0_taglio1 == 1);
posizioni1_2 = find(etichette_cluster0_taglio1 == 2);
posizioni1_3 = find(etichette_cluster0_taglio1 == 3);
posizioni1_4 = find(etichette_cluster0_taglio1 == 4);
posizioni1_5 = find(etichette_cluster0_taglio1 == 5);
etichette0new(posizioni1(posizioni1_1)) = 4; 
etichette0new(posizioni1(posizioni1_2)) = 25; 
etichette0new(posizioni1(posizioni1_3)) = 26; 
etichette0new(posizioni1(posizioni1_4)) = 27; 
posizioni2_1 = find(etichette_cluster0_taglio2 == 1);
posizioni2_2 = find(etichette_cluster0_taglio2 == 2);
etichette0new(posizioni2(posizioni2_1)) = 6; 
etichette0new(posizioni2(posizioni2_2)) = 28;
posizioni3_1 = find(etichette_cluster0_taglio3 == 1);
posizioni3_2 = find(etichette_cluster0_taglio3 == 2);
posizioni3_3 = find(etichette_cluster0_taglio3 == 3);
posizioni3_4 = find(etichette_cluster0_taglio3 == 4);
etichette0new(posizioni3(posizioni3_1)) = 14; 
etichette0new(posizioni3(posizioni3_2)) = 29; 
etichette0new(posizioni3(posizioni3_3)) = 30; 
etichette0new(posizioni3(posizioni3_4)) = 31; 
posizioni4_1 = find(etichette_cluster0_taglio4 == 1);
posizioni4_2 = find(etichette_cluster0_taglio4 == 2);
etichette0new(posizioni4(posizioni4_1)) = 8; 
etichette0new(posizioni4(posizioni4_2)) = 32;

num_pazienti_per_cluster0new = accumarray(etichette0new, 1); % Conta il numero di pazienti per ciascun cluster

m_cluster0 = zeros(1869,7);
m_cluster0 = constr_cod_0;
for i = 1:1869
    m_cluster0(i,7) = etichette0new(i,1);
end
constr_cod_0_new = [];
%cluster da eliminare 1,7,12,13,23,24,25 (elem<5)
valid_set_eliminati_0 = [];
riga1 = 1;
riga2 = 1;
for i = 1:1869
    if m_cluster0(i,7)==1 || m_cluster0(i,7)==7 || m_cluster0(i,7)==12 || m_cluster0(i,7)==13 || m_cluster0(i,7)==23 || m_cluster0(i,7)==24 || m_cluster0(i,7)==25
        valid_set_eliminati_0(riga2,:) = m_cluster0(i,:);
        riga2 = riga2 + 1;
    else
        constr_cod_0_new(riga1,:) = m_cluster0(i,:);
        riga1 = riga1 + 1;
    end
end


% Valori da cercare e rimuovere
valori_da_rimuovere = [1,7,12,13,23,24,25];

% Crea un vettore logico che indichi quali elementi devono essere mantenuti
indici_da_mantenere = ~ismember(etichette0new, valori_da_rimuovere);

% Seleziona solo gli elementi che devono essere mantenuti
etichette0new_eliminati = etichette0new(indici_da_mantenere);


% 6 cluster vanno eliminati poichè con 1 elemento (-6)
% dopo taglio1 -> da 1 a 4 (+3)
% dopo taglio2 -> da 1 a 2 (+1)
% dopo taglio3 -> da 1 a 4 (+3)
% dopo taglio4 -> da 1 a 2 (+1)
% CLUSTER 0 = 24-6+3+1+3+1 = 26

dend_1=linkage(constr_rid_cod_1,"complete","cityblock");
figure(1)
[h, tperm] = dendrogram(dend_1, 0, 'ColorThreshold', 0.45);
title('Dendrogramma classe 1');
% % Ottieni i colori delle linee
% line_colors = cell2mat(get(h, 'Color'));
% % Converti i colori in stringhe per poterli confrontare
% color_strings = cellstr(num2str(line_colors, '%f'));
% % Conta il numero di colori unici
% num_cluster_colored = numel(unique(color_strings));
% disp(['Numero di cluster colorati sopra la soglia: ', num2str(num_cluster_colored)]);
%HO 22 CLUSTER

% Effettua il taglio del dendrogramma per ottenere le etichette dei cluster
etichette_cluster1 = cluster(dend_1, 'maxclust', 22);

% Conta il numero di pazienti per ciascun cluster
num_pazienti_per_cluster1 = accumarray(etichette_cluster1, 1); % Conta il numero di pazienti per ciascun cluster
%i cluster non sono in ordine

%taglimultipli 
pos1 = find(etichette_cluster1(:,1) == 17);
dend_1_taglio1 = linkage(constr_rid_cod_1(pos1,:),"complete","cityblock");
figure(2)
[h, tperm] = dendrogram(dend_1_taglio1, 0, 'ColorThreshold', 0.35);
title('Dendrogramma classe 1 taglio1');

etichette_cluster1_taglio1 = cluster(dend_1_taglio1, 'maxclust', 3);

%aggiornamento etichette:
etichette1new = etichette_cluster1;
pos1_1 = find(etichette_cluster1_taglio1 == 1);
pos1_2 = find(etichette_cluster1_taglio1 == 2);
pos1_3 = find(etichette_cluster1_taglio1 == 3);
etichette1new(pos1(pos1_1)) = 17; 
etichette1new(pos1(pos1_2)) = 23; 
etichette1new(pos1(pos1_3)) = 24; 

num_pazienti_per_cluster1new = accumarray(etichette1new, 1); % Conta il numero di pazienti per ciascun cluster

m_cluster1 = zeros(670,7);
m_cluster1 = constr_cod_1;
for i = 1:670
    m_cluster1(i,7) = etichette1new(i,1);
end
constr_cod_1_new = [];
%cluster da eliminare 5,10,11,20,21,22 (elem<5)
valid_set_eliminati_1 = [];
riga1 = 1;
riga2 = 1;
for i = 1:670
    if m_cluster1(i,7)==5 || m_cluster1(i,7)==10 || m_cluster1(i,7)==11 || m_cluster1(i,7)==20 || m_cluster1(i,7)==21 || m_cluster1(i,7)==22
        valid_set_eliminati_1(riga2,:) = m_cluster1(i,:);
        riga2 = riga2 + 1;
    else
        constr_cod_1_new(riga1,:) = m_cluster1(i,:);
        riga1 = riga1 + 1;
    end
end

% Valori da cercare e rimuovere
valori_da_rimuovere = [5,10,11,20,21,22];

% Crea un vettore logico che indichi quali elementi devono essere mantenuti
indici_da_mantenere = ~ismember(etichette1new, valori_da_rimuovere);

% Seleziona solo gli elementi che devono essere mantenuti
etichette1new_eliminati = etichette1new(indici_da_mantenere);

num_pazienti_per_cluster1new_eliminati = accumarray(etichette1new_eliminati, 1);

% 6 cluster da eliminare (elem<5) -> (-6)
% dopo taglio1 -> da 1 a 3 (+2)
% CLUSTER 1 = 22-6+2 = 19

% 5.4)-------------------------------------------------

% constr_rid_cod_1_new = constr_cod_1_new(:,[2:5]);
dend_1_new=linkage(constr_rid_cod_1_new,"complete","cityblock"); 
figure(3) 
[h, tperm] = dendrogram(dend_1_new,0,'ColorThreshold', 0.45 ); 
title('Dendrogramma classe 1 dopo eliminazioni');

insieme1=unique(etichette1new);
a=[];
conto_a = 1;
for i = 1:numel(insieme1)
    valore_cluster = insieme1(i);
    if valore_cluster~=5  && valore_cluster~=10 && valore_cluster~=11 && valore_cluster~=20 && valore_cluster~=21 && valore_cluster~=22  
        a(conto_a)=length(find(etichette1new==i));
        conto_a = conto_a + 1;
    end
end
b=[]
for i=1:18
    b(i)=round(60/100*a(i));
end

taglio1=etichette1new_eliminati;

%NO 5,10,11,20,21,22  
a1=find(taglio1==1);
cluster1=constr_cod_1_new(a1,:);
random1=randperm(length(a1),length(a1));
cluster1random1=cluster1(random1,:);
 
a2=find(taglio1==2);
cluster2=constr_cod_1_new(a2, :);
random2=randperm(length(a2),length(a2));
cluster2random1=cluster2(random2,:);

a3=find(taglio1==3);
cluster3=constr_cod_1_new(a3, :);
random3=randperm(length(a3),length(a3));
cluster3random1=cluster3(random3,:);

a4=find(taglio1==4);
cluster4=constr_cod_1_new(a4, :);
random4=randperm(length(a4),length(a4));
cluster4random1=cluster4(random4,:);

a5=find(taglio1==6);
cluster5=constr_cod_1_new(a5, :);
random5=randperm(length(a5),length(a5));
cluster5random1=cluster5(random5,:);

a6=find(taglio1==7);
cluster6=constr_cod_1_new(a6, :);
random6=randperm(length(a6),length(a6));
cluster6random1=cluster6(random6,:);

a7=find(taglio1==8);
cluster7=constr_cod_1_new(a7, :);
random7=randperm(length(a7),length(a7));
cluster7random1=cluster7(random7,:);

a8=find(taglio1==9);
cluster8=constr_cod_1_new(a8, :);
random8=randperm(length(a8),length(a8));
cluster8random1=cluster8(random8,:);

a9=find(taglio1==12);
cluster9=constr_cod_1_new(a9, :);
random9=randperm(length(a9),length(a9));
cluster9random1=cluster9(random9,:);


a10=find(taglio1==13);
cluster10=constr_cod_1_new(a10, :);
random10=randperm(length(a10),length(a10));
cluster10random1=cluster10(random10,:);

a11=find(taglio1==14);
cluster11=constr_cod_1_new(a11, :);
random11=randperm(length(a11),length(a11));
cluster11random1=cluster11(random11,:);


a12=find(taglio1==15);
cluster12=constr_cod_1_new(a12, :);
random12=randperm(length(a12),length(a12));
cluster12random1=cluster12(random12,:);


a13=find(taglio1==16);
cluster13=constr_cod_1_new(a13, :);
random13=randperm(length(a13),length(a13));
cluster13random1=cluster13(random13,:);

a14=find(taglio1==17);
cluster14=constr_cod_1_new(a14, :);
random14=randperm(length(a14),length(a14));
cluster14random1=cluster14(random14,:);

a15=find(taglio1==18);
cluster15=constr_cod_1_new(a15, :);
random15=randperm(length(a15),length(a15));
cluster15random1=cluster15(random15,:);

a16=find(taglio1==19);
cluster16=constr_cod_1_new(a16, :);
random16=randperm(length(a16),length(a16));
cluster16random1=cluster16(random16,:);

a17=find(taglio1==23);
cluster17=constr_cod_1_new(a17, :);
random17=randperm(length(a17),length(a17));
cluster17random1=cluster17(random17,:);

a18=find(taglio1==24);
cluster18=constr_cod_1_new(a18, :);
random18=randperm(length(a18),length(a18));
cluster18random1=cluster18(random18,:);

for i=1:18
    c(i)=a(i)-b(i);
end

cluster1_60_t=cluster1random1(1:b(1),:);
cluster1_40_v=cluster1random1((b(1)+1):a(1), :);

cluster2_60_t=cluster2random1(1:b(2),:);
cluster2_40_v=cluster2random1((b(2)+1):a(2), :);

cluster3_60_t=cluster3random1(1:b(3),:);
cluster3_40_v=cluster3random1((b(3)+1):a(3), :);

cluster4_60_t=cluster4random1(1:b(4),:);
cluster4_40_v=cluster4random1((b(4)+1):a(4), :);


cluster5_60_t=cluster5random1(1:b(5),:);
cluster5_40_v=cluster5random1((b(5)+1):a(5), :);

cluster6_60_t=cluster6random1(1:b(6),:);
cluster6_40_v=cluster6random1((b(6)+1):a(6), :);

cluster7_60_t=cluster7random1(1:b(7),:);
cluster7_40_v=cluster7random1((b(7)+1):a(7), :);

cluster8_60_t=cluster8random1(1:b(8),:);
cluster8_40_v=cluster8random1((b(8)+1):a(8), :);


cluster9_60_t=cluster9random1(1:b(9),:);
cluster9_40_v=cluster9random1((b(9)+1):a(9), :);

cluster10_60_t=cluster10random1(1:b(10),:);
cluster10_40_v=cluster10random1((b(10)+1):a(10), :);

cluster11_60_t=cluster11random1(1:b(11),:);
cluster11_40_v=cluster11random1((b(11)+1):a(11), :);

cluster12_60_t=cluster12random1(1:b(12),:);
cluster12_40_v=cluster12random1((b(12)+1):a(12), :);
cluster13_60_t=cluster13random1(1:b(13),:);
cluster13_40_v=cluster13random1((b(13)+1):a(13), :);

cluster14_60_t=cluster14random1(1:b(14),:);
cluster14_40_v=cluster14random1((b(14)+1):a(14), :);

cluster15_60_t=cluster15random1(1:b(15),:);
cluster15_40_v=cluster15random1((b(15)+1):a(15), :);

cluster16_60_t=cluster16random1(1:b(16),:);
cluster16_40_v=cluster16random1((b(16)+1):a(16), :);

cluster17_60_t=cluster17random1(1:b(17),:);
cluster17_40_v=cluster17random1((b(17)+1):a(17), :);

cluster18_60_t=cluster18random1(1:b(18),:);
cluster18_40_v=cluster18random1((b(18)+1):a(18), :);


tr_set_dendro_cod1_new=[cluster1_60_t;cluster2_60_t; cluster3_60_t;cluster4_60_t;cluster5_60_t;cluster6_60_t; cluster7_60_t;cluster8_60_t;  cluster9_60_t;cluster10_60_t; cluster11_60_t;cluster12_60_t;cluster13_60_t;cluster14_60_t; cluster15_60_t;cluster16_60_t; cluster17_60_t; cluster18_60_t];
val_set_dendro_cod1_new=[cluster1_40_v;cluster2_40_v; cluster3_40_v;cluster4_40_v;cluster5_40_v;cluster6_40_v; cluster7_40_v;cluster8_40_v;  cluster9_40_v;cluster10_40_v; cluster11_40_v;cluster12_40_v;cluster13_40_v;cluster14_40_v; cluster15_40_v;cluster16_40_v; cluster17_40_v; cluster18_40_v];

% 5.5) 
% -------------------------------------------

% constr_rid_cod_0_new = constr_cod_0_new(:,[2:5]);
dend_0_new=linkage(constr_rid_cod_0_new,"complete","cityblock"); 
figure(3) 
[h, tperm] = dendrogram(dend_0_new,0,'ColorThreshold', 0.45 ); 
title('Dendrogramma classe 0 dopo eliminazioni');

insieme0=unique(etichette0new);
d=[];
conto_d = 1;
for i = 1:numel(insieme0)
    valore_cluster = insieme0(i);
    if valore_cluster~=1  && valore_cluster~=7 && valore_cluster~=12 && valore_cluster~=13 && valore_cluster~=23 && valore_cluster~=24 && valore_cluster~=25 
        d(conto_d)=length(find(etichette0new==i));
        conto_d = conto_d + 1;
    end
end
e=[]; 
for i=1:25
    e(i)=round(394/1860*d(i)); 
end 

taglio0=etichette0new_eliminati;
% NO 1,7,12,13,23,24,25
%25 CLUSTER
%costruzione cluster
cluster1random0=funzione_cluster(taglio0, 2, constr_cod_0_new);
cluster2random0=funzione_cluster(taglio0, 3, constr_cod_0_new);
cluster3random0=funzione_cluster(taglio0, 4, constr_cod_0_new);
cluster4random0=funzione_cluster(taglio0, 5, constr_cod_0_new);
cluster5random0=funzione_cluster(taglio0, 6, constr_cod_0_new);
cluster6random0=funzione_cluster(taglio0, 8, constr_cod_0_new);
cluster7random0=funzione_cluster(taglio0, 9, constr_cod_0_new);
cluster8random0=funzione_cluster(taglio0, 10, constr_cod_0_new);
cluster9random0=funzione_cluster(taglio0, 11, constr_cod_0_new);
cluster10random0=funzione_cluster(taglio0, 14, constr_cod_0_new);
cluster11random0=funzione_cluster(taglio0, 15, constr_cod_0_new);
cluster12random0=funzione_cluster(taglio0, 16, constr_cod_0_new);
cluster13random0=funzione_cluster(taglio0, 17, constr_cod_0_new);
cluster14random0=funzione_cluster(taglio0, 18, constr_cod_0_new);
cluster15random0=funzione_cluster(taglio0, 19, constr_cod_0_new);
cluster16random0=funzione_cluster(taglio0, 20, constr_cod_0_new);
cluster17random0=funzione_cluster(taglio0, 21, constr_cod_0_new);
cluster18random0=funzione_cluster(taglio0, 22, constr_cod_0_new);
cluster19random0=funzione_cluster(taglio0, 26, constr_cod_0_new);
cluster20random0=funzione_cluster(taglio0, 27, constr_cod_0_new);
cluster21random0=funzione_cluster(taglio0, 28, constr_cod_0_new);
cluster22random0=funzione_cluster(taglio0, 29, constr_cod_0_new);
cluster23random0=funzione_cluster(taglio0, 30, constr_cod_0_new);
cluster24random0=funzione_cluster(taglio0, 31, constr_cod_0_new);
cluster25random0=funzione_cluster(taglio0, 32, constr_cod_0_new);

%divisione deicluster di classe 1 nel 21% e 79%

[cluster1_21_t, cluster1_79_v]=percentuale_cluster(cluster1random0, d, e , 1);
[cluster2_21_t, cluster2_79_v]=percentuale_cluster(cluster2random0, d, e , 2);
[cluster3_21_t, cluster3_79_v]=percentuale_cluster(cluster3random0, d, e , 3);
[cluster4_21_t, cluster4_79_v]=percentuale_cluster(cluster4random0, d, e , 4);
[cluster5_21_t, cluster5_79_v]=percentuale_cluster(cluster5random0, d, e , 5);
[cluster6_21_t, cluster6_79_v]=percentuale_cluster(cluster6random0, d, e , 6);
[cluster7_21_t, cluster7_79_v]=percentuale_cluster(cluster7random0, d, e , 7);
[cluster8_21_t, cluster8_79_v]=percentuale_cluster(cluster8random0, d, e , 8);
[cluster9_21_t, cluster9_79_v]=percentuale_cluster(cluster9random0, d, e , 9);
[cluster10_21_t, cluster10_79_v]=percentuale_cluster(cluster10random0, d, e , 10);
[cluster11_21_t, cluster11_79_v]=percentuale_cluster(cluster11random0, d, e , 11);
[cluster12_21_t, cluster12_79_v]=percentuale_cluster(cluster12random0, d, e , 12);
[cluster13_21_t, cluster13_79_v]=percentuale_cluster(cluster13random0, d, e , 13);
[cluster14_21_t, cluster14_79_v]=percentuale_cluster(cluster14random0, d, e , 14);
[cluster15_21_t, cluster15_79_v]=percentuale_cluster(cluster15random0, d, e , 15);
[cluster16_21_t, cluster16_79_v]=percentuale_cluster(cluster16random0, d, e , 16);
[cluster17_21_t, cluster17_79_v]=percentuale_cluster(cluster17random0, d, e , 17);
[cluster18_21_t, cluster18_79_v]=percentuale_cluster(cluster18random0, d, e , 18);
[cluster19_21_t, cluster19_79_v]=percentuale_cluster(cluster19random0, d, e , 19);
[cluster20_21_t, cluster20_79_v]=percentuale_cluster(cluster20random0, d, e , 20);
[cluster21_21_t, cluster21_79_v]=percentuale_cluster(cluster21random0, d, e , 21);
[cluster22_21_t, cluster22_79_v]=percentuale_cluster(cluster22random0, d, e , 22);
[cluster23_21_t, cluster23_79_v]=percentuale_cluster(cluster23random0, d, e , 23);
[cluster24_21_t, cluster24_79_v]=percentuale_cluster(cluster24random0, d, e , 24);
[cluster25_21_t, cluster25_79_v]=percentuale_cluster(cluster25random0, d, e , 25);

for i=1:25
    f(i)=d(i)-e(i);
end

tr_set_dendro_cod0_new=[cluster1_21_t; cluster2_21_t; cluster3_21_t;cluster4_21_t; cluster5_21_t; cluster6_21_t;cluster7_21_t; cluster8_21_t; cluster9_21_t;cluster10_21_t; cluster11_21_t; cluster12_21_t;cluster13_21_t; cluster14_21_t; cluster15_21_t;cluster16_21_t; cluster17_21_t; cluster18_21_t; cluster19_21_t; cluster20_21_t; cluster21_21_t; cluster22_21_t; cluster23_21_t;cluster24_21_t; cluster25_21_t];
val_set_dendro_cod0_new=[cluster1_79_v; cluster2_79_v;cluster3_79_v; cluster4_79_v; cluster5_79_v;cluster6_79_v;  cluster7_79_v; cluster8_79_v;cluster9_79_v;   cluster10_79_v; cluster11_79_v;cluster12_79_v; cluster13_79_v; cluster14_79_v;cluster15_79_v; cluster16_79_v; cluster17_79_v;cluster18_79_v; cluster19_79_v; cluster20_79_v; cluster21_79_v; cluster22_79_v; cluster23_79_v;cluster24_79_v; cluster25_79_v];

% 5.6) 
% -------------------------------------------

tr_set_dendro_cod_new=[tr_set_dendro_cod0_new; tr_set_dendro_cod1_new];
val_set_dendro_cod_new=[val_set_dendro_cod0_new; val_set_dendro_cod1_new];

% 6)
%--------------------------------------------------
%Y/N CARTELLA 

% Obiettivo 2
% 7)---------

tr_set_dendro_rid_new = tr_set_dendro_cod_new;
val_set_dendro_rid_new = val_set_dendro_cod_new;
tr_set_dendro_rid_new(:,1) = [];
tr_set_dendro_rid_new(:,6) = [];
val_set_dendro_rid_new(:,1) = [];
val_set_dendro_rid_new(:,6)=[];

% 8)--------

Knn = fitcknn(tr_set_dendro_rid_new(:, 1:end-1), tr_set_dendro_rid_new(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ...
'IncludeTies',true, 'BreakTies', 'nearest'); 

% 9)---------

out_tr = predict(Knn, tr_set_dendro_rid_new (:, 1:end-1)); 
out_val = predict(Knn, val_set_dendro_rid_new(:, 1:end-1));

% 10)--------

A = confusionmat(tr_set_dendro_rid_new(:,end),out_tr);
B = confusionmat(val_set_dendro_rid_new(:,end),out_val);

figure(1)
confusionchart(A,[0 1])
title('Codified Variables Tr. set');
figure(2)
confusionchart(B,[0 1])
title('Codified Variables Val. set');

% % Obiettivo 3
% % 11)--------
% 
% tr_set_dendro_yn_new=tr_set_dendro_yn; 
% val_set_dendro_yn_new=val_set_dendro_yn;
% tr_set_dendro_yn_new(:,1)=[];
% val_set_dendro_yn_new(:,1)=[];
% 
% % 12)-------- 
% 
% Knn = fitcknn(tr_set_dendro_yn_new(:, 1:end-1), tr_set_dendro_yn_new(:, end), 'NumNeighbors', 39, 'Distance', 'cityblock', ... 
% 'IncludeTies',true, 'BreakTies', 'nearest');  
% 
% % 13)--------- 
% 
% out_tr_yn = predict(Knn, tr_set_dendro_yn_new (:, 1:end-1));  
% out_val_yn = predict(Knn, val_set_dendro_yn_new(:, 1:end-1)); 
% 
% % 14)-------- 
% 
% A = confusionmat(tr_set_dendro_yn_new(:,end),out_tr_yn); 
% B = confusionmat(val_set_dendro_yn_new(:,end),out_val_yn); 
% 
% figure(1) 
% confusionchart(A,[0 1]) 
% title('YES/NO VARIABLES TR.SET');
% figure(2) 
% confusionchart(B,[0 1])
% title('YES/NO VARIABLES VAL.SET');













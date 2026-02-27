clear all
close all

% Carica i dati
load("train_set_norm_random.mat");
tr_set_random = train_set_norm;
tr_set_random = tr_set_random(:, [1 23 27 31 32 54]);

load("valid_set_norm_random.mat");
val_set_random = valid_set_norm;
val_set_random = val_set_random(:, [1 23 27 31 32 54]);

load("tr_set_dendro_cod_new.mat");
tr_set_dendro = tr_set_dendro_cod_new;
load("val_set_dendro_cod_new.mat");
val_set_dendro = val_set_dendro_cod_new;
load("tr_set_som_cod.mat");
tr_set_som = tr_set_som_cod;
load("val_set_som_cod.mat");
val_set_som = val_set_som_cod;

% Creazione dei modelli di classificazione
% Random
X_random = tr_set_random(:, 2:5);
Y_random = tr_set_random(:, 6);
Mdl_random = fitcnb(X_random, Y_random);
label_random = predict(Mdl_random, X_random);

% Dendrogramma
X_dendro = tr_set_dendro(:, 2:5);
Y_dendro = tr_set_dendro(:, 6);
Mdl_dendro = fitcnb(X_dendro, Y_dendro);
label_dendro = predict(Mdl_dendro, X_dendro);

% SOM
X_som = tr_set_som(:, 2:5);
Y_som = tr_set_som(:, 6);
Mdl_som = fitcnb(X_som, Y_som);
label_som = predict(Mdl_som, X_som);

% Validazione sui validation set
X_random_v = val_set_random(:, 2:5);
Y_random_v = val_set_random(:, 6);
label_random_v = predict(Mdl_random, X_random_v);

X_dendro_v = val_set_dendro(:, 2:5);
Y_dendro_v = val_set_dendro(:, 6);
label_dendro_v = predict(Mdl_dendro, X_dendro_v);

X_som_v = val_set_som(:, 2:5);
Y_som_v = val_set_som(:, 6);
label_som_v = predict(Mdl_som, X_som_v);

% Visualizzazione delle matrici di confusione
figure(1);
subplot(1, 3, 1);
confusionchart(Y_random, label_random);
title('Confusion Matrix - TR Random');

subplot(1, 3, 2);
confusionchart(Y_dendro, label_dendro);
title('Confusion Matrix - TR Dendro');

subplot(1, 3, 3);
confusionchart(Y_som, label_som);
title('Confusion Matrix - TR SOM');

figure(2);
subplot(1, 3, 1);
confusionchart(Y_random_v, label_random_v);
title('Confusion Matrix - VAL Random');

subplot(1, 3, 2);
confusionchart(Y_dendro_v, label_dendro_v);
title('Confusion Matrix - VAL Dendro');

subplot(1, 3, 3);
confusionchart(Y_som_v, label_som_v);
title('Confusion Matrix - VAL SOM');

% Calcolo della balanced accuracy
balanced_accuracy = @(confmat) mean(diag(confmat) ./ sum(confmat, 2));

confmat_tr_random = confusionmat(Y_random, label_random);
confmat_val_random = confusionmat(Y_random_v, label_random_v);
bal_acc_tr_random = balanced_accuracy(confmat_tr_random);
bal_acc_val_random = balanced_accuracy(confmat_val_random);

confmat_tr_dendro = confusionmat(Y_dendro, label_dendro);
confmat_val_dendro = confusionmat(Y_dendro_v, label_dendro_v);
bal_acc_tr_dendro = balanced_accuracy(confmat_tr_dendro);
bal_acc_val_dendro = balanced_accuracy(confmat_val_dendro);

confmat_tr_som = confusionmat(Y_som, label_som);
confmat_val_som = confusionmat(Y_som_v, label_som_v);
bal_acc_tr_som = balanced_accuracy(confmat_tr_som);
bal_acc_val_som = balanced_accuracy(confmat_val_som);

% Visualizzazione dei risultati
fprintf('Balanced Accuracy - Random (TR): %.2f%%\n', bal_acc_tr_random * 100);
fprintf('Balanced Accuracy - Random (VAL): %.2f%%\n', bal_acc_val_random * 100);

fprintf('Balanced Accuracy - Dendro (TR): %.2f%%\n', bal_acc_tr_dendro * 100);
fprintf('Balanced Accuracy - Dendro (VAL): %.2f%%\n', bal_acc_val_dendro * 100);

fprintf('Balanced Accuracy - SOM (TR): %.2f%%\n', bal_acc_tr_som * 100);
fprintf('Balanced Accuracy - SOM (VAL): %.2f%%\n', bal_acc_val_som * 100);

% Balanced Accuracy - Random (TR): 55.97%
% Balanced Accuracy - Random (VAL): 54.93%
% Balanced Accuracy - Dendro (TR): 59.03%
% Balanced Accuracy - Dendro (VAL): 57.51%
% Balanced Accuracy - SOM (TR): 57.66%
% Balanced Accuracy - SOM (VAL): 56.87%

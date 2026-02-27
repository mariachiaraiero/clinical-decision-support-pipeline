clear all;
close all;
clc;

load('dataset.mat');
c_success = 0;
c_failure = 0;


for i = 1:3826
    if matr(i,61)==1
        c_success = c_success + 1;
    else 
        c_failure = c_failure + 1;
    end
end

m_success = zeros(c_success, 60);
m_failure = zeros(c_failure, 60);
r_success = 1;
r_failure = 1;

for i = 1:3826
    if matr(i,61)==1
        for j = 1:60
            m_success(r_success,j) = matr(i,j);
        end
        r_success = r_success + 1;
    else
        for w = 1:60
            m_failure(r_failure,w) = matr(i,w);
        end
        r_failure = r_failure + 1;
    end
end

% -------------------------------------------

%DOMANDA 1, PUNTO A
%media
media_success = mean(m_success);
media_failure = mean(m_failure);

%mediana
mediana_success = median(m_success);
mediana_failure = median(m_failure);

%deviazione standard
st_dev_success = std(m_success);
st_dev_failure = std(m_failure);

%intervallo interquartile
int_iqr_success = iqr(m_success); 
int_iqr_failure = iqr(m_failure);

%media age, weight, sedation_days
media_age_success = media_success(:,3);
media_age_failure = media_failure(:,3);
media_weight_success = media_success(:,6);
media_weight_failure = media_failure(:,6);
media_sedation_days_success = media_success(:,22);
media_sedation_days_failure = media_failure(:,22);

%mediana heart_rate_median, respiratory_rate_median, temperature_median
mediana_heart_rate_success = mediana_success(:,41);
mediana_heart_rate_failure = mediana_failure(:,41);
mediana_respiratory_rate_success = mediana_success(:,43);
mediana_respiratory_rate_failure = mediana_failure(:,43);
mediana_temperature_success = mediana_success(:,45);
mediana_temperature_failure = mediana_failure(:,45);

%int_iqr heart_rate_iqr, respiratory_rate_iqr
int_iqr_heart_success = int_iqr_success(:,42);
int_iqr_heart_failure = int_iqr_failure(:,42);
int_iqr_respiratory_success = int_iqr_success(:,44);
int_iqr_respiratory_failure = int_iqr_failure(:,44);

%interquartile temperature_st_dev
st_dev_temperature_success = st_dev_success(:,46);
st_dev_temperature_failure = st_dev_failure(:,46);

% -------------------------------------------

% DOMANDA 1, PUNTO B
boxplot(m_success(:,3));
title('Box-plot Age');

%MANCA CODICE

% -------------------------------------------

%DOMANDA 2, PUNTO A
comorbility_s = zeros(1,7);
ss = sum(m_success);
for i = 7:14
    for k = i-6:7
comorbility_s(k) = ss(i);
    end
end

histogram(comorbility_s);

sf = sum(m_failure);
comorbility_f = zeros(1,7);
for i = 7:14
    for k = i-6:7
comorbility_f(k) = sf(i);
    end
end

% -------------------------------------------

%DOMANDA 2, PUNTO B

% -------------------------------------------

%DOMANDA 3, PUNTO A

% -------------------------------------------

%DOMANDA 3, PUNTO B




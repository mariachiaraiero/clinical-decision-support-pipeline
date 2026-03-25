# Clinical Decision Support Pipeline

This repository contains a comprehensive MATLAB pipeline for a Clinical Decision Support System. The project aims to analyze clinical records to predict patient outcomes (Success vs. Failure). The pipeline covers everything from data exploration to advanced predictive modeling, integrating statistical analysis, clustering, feature selection, and classification algorithms.

## Overview of the Pipeline

The project is divided into several sequential MATLAB scripts, each corresponding to a specific step in the data science lifecycle:

1. **`01_Exploration.m`**: Exploratory Data Analysis (EDA). Computes statistical metrics (mean, median, standard deviation, IQR) and visualizes data distributions using boxplots and histograms for clinical variables (e.g., age, weight, sedation days, heart rate, temperature).
2. **`02_Preprocessing.m`**: Data cleaning and preprocessing. Handles missing values and structures the dataset for further analysis.
3. **`03_Normalization.m`**: Data normalization and scaling to ensure all features contribute equally to the distance metrics used in clustering and classification.
4. **`04_KNN_Model.m`**: Implements a K-Nearest Neighbors (KNN) classifier. It also includes hierarchical clustering using dendrograms (cityblock distance) to balance the clinical data across training and validation sets. 
5. **`05_SOM_Clustering.m`**: Self-Organizing Maps (SOM) implementation for unsupervised clustering of patient profiles to find complex, non-linear patterns within the data.
6. **`06_Feature_Optimization.m`**: Advanced feature selection and dimensionality reduction to identify the most predictive clinical variables.
7. **`07_Model_Comparison.m`**: Evaluates and compares the performance of different classification approaches to find the most robust model for the task.
8. **`08_Final_Metrics.m`**: Calculates the final evaluation metrics (such as Confusion Matrix, Accuracy, Sensitivity, Specificity, etc.) on the test/validation sets to assess real-world viability.

## Dataset

The algorithms expect the initial dataset to be in a `.mat` format (e.g., `dataset.mat`, `construction_set.mat`), containing a matrix where rows are patient samples and columns represent clinical features (such as `calcium`, `ph`, `po2`, vitals). The last column typically represents the binary target variable (0: Failure, 1: Success). Note: The dataset itself might not be provided in this repository due to privacy constraints.

## Requirements

* **MATLAB**: The scripts were developed for MATLAB.
* **Statistics and Machine Learning Toolbox**: Required for functions like `fitcknn`, `predict`, `boxplot`, `linkage`, `dendrogram`, and `confusionchart`.
* **Deep Learning Toolbox** (optional, depending on SOM implementation): Required if neural network-based Self-Organizing Maps are utilized.

## Usage

1. Open MATLAB and set the Current Folder to the root directory of this repository.
2. Ensure you have the corresponding `.mat` data files in the same directory.
3. Run the scripts sequentially from `01_Exploration.m` to `08_Final_Metrics.m`, or execute individual scripts based on the specific analysis you want to perform.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

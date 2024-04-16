library(randomForest)
library(caret)
library(stats)
library(glmnet)
df <- read.csv("/Users/ishaanbabbar/dsan5300_project/new-cleaned_data-01.csv")


# Seperate Numerical and Categorical Data 
numeric_cols <- sapply(df, is.numeric)
categorical_cols <- !numeric_cols
# Ensure categorical columns are factors 
df[categorical_cols] <- lapply(df[categorical_cols], factor)

# Check any missing values
#df[is.na(df)] <- -999
df[is.na(df)] <- -999
View(df)

# Feature selection for Numerical Feature

# L1 (Lasso) Regularization 
x <- as.matrix(df[, numeric_cols])
y <- df$Q1_1
lasso_model <- cv.glmnet(x, y, alpha = 1, nfolds =10)
coef_lasso <- coef(lasso_model, s = "lambda.min")
numeric_lasso <- rownames(coef_lasso)[coef_lasso[,1] != 0]
print(numeric_lasso)

# Feature Selection for Catgorical Features 

# Chi-Square test 
chi_squared <- chisq.test(df[, categorical_cols], df$Q1_1)
p_value <- chi_squared$p.value
significant_categorical <- names(df)[categorical_cols][p_value < 0.05]
print(significant_categorical)

# Combine selected features
selected_features <- c(numeric_lasso, significant_categorical)
print(selected_features)

# Selected Features found using Q1_1 as the target Y variable 
# Q1_1: Perceived Environmental Change: Temperature

 [1] "(Intercept)" "TMEM"        "P5_1"        "J2_1"        "J2_14"      
 [6] "J1AB"        "T2"          "Q1_1"        "Q1_3"        "Q1_5"       
[11] "Q1_13"  

# TMEM: Total household member
# P5_1: Land Holdings: Does household cultivate aquaculture?
# J2_1: House Services: Light
# J2_14: House Services: Generator
# J1AB: Energy: Used by household? - Fire wood
# T2: Government/Aid: Local government officials are effective?
# Q1_1: Perceived Environmental Change: Temperature
# Q1_3: Perceived Environmental Change: Rainfall during other seasons
# Q1_5: Perceived Environmental Change: Severity of floods
# Q1_13: Perceived Environmental Change: Abundance of fish in water

# Cleaned Data set with selected features using Q1_1 
library(dplyr)
selected_df <- df %>% select(TMEM, P5_1, J2_1, J2_14, J1AB, T2, Q1_1, Q1_3, Q1_5, Q1_13)
selected_df[selected_df == -999] <- 0.01

# This should be regression analysis to predict enviromental change in Q1_1 as a continious variable based on what selected predictors we have. 



## OLD CODE: can use if needed
# Feature selction attempt using PCA
#pca_result <- prcomp(df[, numeric_cols & !(names(df) %in% c("HHNO", "BEM_ID"))], scale. = TRUE)
#pca_feat <- pca_result$x[, 1:10]
#ctrl <- rfeControl(functions = rfFuncs, method = "cv", number = 10)
##feature_sel <- rfe(pca_feat, df$Q1_1, sizes = c(1:5), rfeControl = ctrl)
#print(feature_sel)

# create model training 
#train_index <- createDataPartition(df$Q1_1, p = 0.8, list = FALSE)
#train_data <- df[train_index, ]
#test_data <- df[-train_index, ]

# Random forest
#rf_model <- randomForest(Q1_1 ~ ., data = train_data[, !(names(df) %in% c("HHNO", "BEM_ID"))], ntree = 500 )

# Create prediction using test set
#pred <- predict(rf_model, test_data[, !(names(df) %in% c("HHNO", "BEM_ID"))])

# Create confusion matrix 
#conf_matrix <- table(pred, test_data$Q1_1)
#print(conf_matrix)
#acc <- sum(diag(conf_matrix)) / sum(conf_matrix)
#print(acc)

# Visual results 
#plot(pca_result)
#varImpPlot(rf_model)

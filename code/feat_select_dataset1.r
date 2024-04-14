
df <- read.csv("/Users/ishaanbabbar/dsan5300_project/new-cleaned_data-01.csv")
View(df)


# Check any missing values 
df_missing <- colSums(is.na(df))

df[is.na(df)] <- -999
View(df)

# Feature selction attempt using PCA

library(randomForest)
library(caret)


numeric_cols <- sapply(df, is.numeric)
pca_result <- prcomp(df[, numeric_cols & !(names(df) %in% c("HHNO", "BEM_ID"))], scale. = TRUE)
pca_feat <- pca_result$x[, 1:10]
ctrl <- rfeControl(functions = rfFuncs, method = "cv", number = 10)
feature_sel <- rfe(pca_feat, df$Q1_1, sizes = c(1:5), rfeControl = ctrl)
print(feature_sel)


# create model training 
train_index <- createDataPartition(df$Q1_1, p = 0.8, list = FALSE)
train_data <- df[train_index, ]
test_data <- df[-train_index, ]

# Random forest
rf_model <- randomForest(Q1_1 ~ ., data = train_data[, -c("HHNO", "BEM_ID")], ntree = 500 )

# Create prediction using test set

pred <- predict(rf_model, test_data[, -c("HHNO", "BEM_ID")])

# Create confusion matrix 
conf_matrix <- table(pred, test_data$Q1_1)
print(conf_matrix)

acc <- sum(diag(conf_matrix)) / sum(conf_matrix)




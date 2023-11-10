#install.packages(c('MASS','caret','e1071','randomforest','rpart','rpart.plot'))
library('MASS')
library('caret')
library('randomForest')


# Loading the DataSet
data("Boston")


# Set seed for reproducability
set.seed(123)


# Split the data into training and testing sets
trainIndex <- createDataPartition(Boston$medv,p=0.8,list = FALSE)
trainData <- Boston[trainIndex,]
testData <- Boston[-trainIndex,]


# Linear Regression 
lr_model <- train(medv ~ .,data = trainData)
lr_predictions <- predict(lr_model,newdata = testData)
plot(lr_predictions,testData$medv,main='Linear Regression')
lr_rmse <- RMSE(testData$medv,lr_predictions)
cat("RMSE OF LINEAR REGRESSION IS = ",lm_rmse)



# Decision Tree Regression
dt_model <- train(medv ~ .,data = trainData,method="rpart")
dt_predictions <- predict(dt_model,newdata = testData)
plot(dt_predictions,testData$medv,main="Decision Tree")
dt_rmse <- RMSE(dt_predictions,testData$medv)
cat("RMSE OF DECISION TREE IS = ",dt_rmse)


# Support Vector Regression
svm_model <- train(medv ~ .,data = trainData)
svm_predictions <- predict(svm_model,newdata = testData)
plot(svm_predictions,testData$medv,main = 'Support Vector Regression')
svm_rmse=RMSE(svm_predictions,testData$medv)
cat('RMSE OF SUPPORT VECTOR REGRESSION IS = ',svm_rmse)


# RandomForest Regression
rf_model <- train(medv ~ .,data = trainData)
rf_predictions <- predict(rf_model,newdata = testData)
plot(rf_predictions,testData$medv,main = 'RandomForest Regression')
rf_rmse <- RMSE(rf_predictions,testData$medv)
cat("RMSE FOR RANDOMFOREST REGRESSION IS = ",rf_rmse)


x <- c(lm_rmse, dt_rmse, svm_rmse, rf_rmse)
min_index <- which.min(x)
models <- c("Linear Regression", "Decision Tree", "Support Vector Machine", "Random Forest")
model <- models[min_index]
cat("THE MODEL WITH MIN RMSE IS =", model, "\n")

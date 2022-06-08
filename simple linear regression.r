
#import the dataset

dataset =read.csv("Admission_Predict.csv")
View(dataset)

#slicing the data

gre=dataset[ ,2]
gre

coa=dataset[ ,9]
coa

#dataset for slr

data=data.frame(gre,coa)
View(data)

#import data splitting library

library(caTools)

#generate random numbers

set.seed(123)

#data splitting

Split1=sample.split(data$coa,SplitRatio = 0.8)
View(Split1)

#training set

traning_set=subset(data,Split== TRUE)

#testing

testing_set=subset(data,Split1== FALSE)
View(testing_set)

#apply regression(training the model)

regressor=lm(formula = coa ~ gre,data=traning_set)#lm=linear model

summary(regressor)

#prediction testing phase

y_predict=predict(regressor,newdata = testing_set)
View(y_predict)
y_predict

#visualization

plot(testing_set$gre,testing_set$coa,type="p",
     col='blue',xlab='gre',ylab='coa')    #plot=scatter plot


lines(testing_set$gre,y_predict,type='o',col='red')




#library
#install.packages("car")

##Relationship between petal length and petal width
##Correlation -----
petal.cor <- cor(iris$Petal.Length, iris$Petal.Width)
#r = 0.96

##Regression
petal.lm <- lm(iris$Petal.Length ~ iris$Petal.Width)
petal.lm
#b0 = 1.08, b1 = 2.23
#For each milimeter in width, the length increases 2.23mm. 
#y=1.08+2.23x
summary(petal.lm)
#R2 = 0.927, p = 2*10-16 (prob. of having a horizontal line)

##Linear regression
plot(iris$Petal.Length ~ iris$Petal.Width, data = iris) #we can see homes
abline(petal.lm) #line
text(0.5, 6, "y = 1.08 + 2.23x /n R2 = 0.927  p = 2.2e-16")

#Residuals normality and homescedasticity
plot(petal.lm)
shapiro.test(petal.lm$residuals)
#Residuals seem normal
#p-value = 0.3753
#Normality assumption is middle due to p-value

##ANOVA
##For the anova we need a categorical independent value
##Effect of species on petal length
species.lm <- lm(iris$Petal.Length ~ iris$Species, data = iris)
species.lm

#The mean of versicolor is 2.798mm large than setosa (mean = 1.462mm)
#The mean of virginica is 4.09mm larger than setosa
summary(species.lm)
anova(species.lm)
#Differences are significant: p-value < 0.01
#Not all species have same petal length -> they vary

#Box plot
plot(iris$Petal.Length ~ iris$Species, data = iris)
text(1, 6, "R2 = 0.9406, p = 2.2e-16")

#Residuals normality and homescedasticity 
plot(species.lm)
shapiro.test(species.lm$residuals)
#P-value = 0.0367 
#if p-value > 0.05, then distribution is normal. Otherwise, Doubt it!
#Linear model to plot species vs. petal length 
#Post Hop test to see more 

#library
library(car)
## Homoscetasticity 
car::leveneTest(species.lm)
##Groups are not homoscedastic. Variances are different between groups
#Low p-value = low probability for the variance of groups to be similar


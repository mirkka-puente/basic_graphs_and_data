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
plot(iris$Petal.Length ~ iris$Petal.Width, data = iris)
abline(petal.lm)
text(0.5, 6, "y = 1.08 + 2.23x /n R2 = 0.927  p = 2.2e-16")

#Residuals normality and homescedasticity
plot(petal.lm)
shapiro.test(petal.lm$residuals)
#Residuals seem normal

##ANOVA
##For the anova we need a categorical independent value
##Effect of species on petal length
species.lm <- lm(iris$Petal.Length ~ iris$Species, data = iris)
species.lm

#The mean of versicolor is 2.798mm large than setosa (mean = 1.462mm)
#The mean of virginica is 4.09mm larger than setosa
summary(species.lm)
anova(species.lm)
#Differencesare significant: p-value < 0.01
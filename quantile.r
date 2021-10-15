#Quantile Regression example

library(quantreg)

health <- read.csv("quantile_health.csv")

View(health)
attach(health)
#Define the variables

y <- cbind(totexp)
x <- cbind(suppins,totchr,age,white)

#descriptive statistics

summary(y)
summary(x)

#run OLS 

olsreg <- lm(y ~x , data=health)
summary(olsreg)

#quantile regression

quantreg25 <- rq(y ~x, data=health,tau=0.25)
summary(quantreg25)

quantreg50 <- rq(y ~x, data=health,tau=0.5)
summary(quantreg50)

quantreg75 <- rq(y ~x, data=health,tau=0.75)
summary(quantreg75)

#simultaniously estimating a quantile regression

quantreg_sim <- rq(y~x,data=health,tau = c(0.25,0.75))
summary(quantreg_sim)

#ANOVA

anova(quantreg25,quantreg75)

#plotting the data

quantreg.all <- rq(y~x, tau=seq(0.05,0.95, by = 0.05),data=health)
quantreg.plot <- summary(quantreg.all)
plot(quantreg.plot)

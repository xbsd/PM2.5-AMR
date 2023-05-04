library(forecast)
library(fpp2)
h <- 10
fit.lin <- tslm(marathon ~ trend)
fcasts.lin <- forecast(fit.lin, h = h)
fit.exp <- tslm(marathon ~ trend, lambda = 0)
fcasts.exp <- forecast(fit.exp, h = h)
t <- time(marathon)
t.break1 <- 1940
t.break2 <- 1980
tb1 <- ts(pmax(0, t - t.break1), start = 1897)
tb2 <- ts(pmax(0, t - t.break2), start = 1897)
fit.pw <- tslm(marathon ~ t + tb1 + tb2)
t.new <- t[length(t)] + seq(h)
tb1.new <- tb1[length(tb1)] + seq(h)
tb2.new <- tb2[length(tb2)] + seq(h)
newdata <- cbind(t = t.new, tb1 = tb1.new, tb2 = tb2.new) %>%
  as.data.frame()  
fcasts.pw <- forecast(fit.pw, newdata = newdata)
fit.spline <- tslm(marathon ~ t + I(t^2) + I(t^3) +
                     I(tb1^3) + I(tb2^3))
fcasts.spline <- forecast(fit.spline, newdata = newdata)
autoplot(marathon) +
  autolayer(fitted(fit.lin), series = "线性") +
  autolayer(fitted(fit.exp), series = "指数型") +
  autolayer(fitted(fit.pw), series = "分段回归法") +
  autolayer(fitted(fit.spline), series = "三次样条法") +
  autolayer(fcasts.pw, series = "分段回归法") +
  autolayer(fcasts.lin$mean, series = "线性") +
  autolayer(fcasts.exp$mean, series = "指数型") +
  autolayer(fcasts.spline$mean, series = "三次样条法") +
  xlab("年份") + ylab("获胜者所用时间（分钟）") +
  ggtitle("波士顿马拉松") +
  guides(colour = guide_legend(title = " "))+
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))

autoplot(marathon) +
  autolayer(fitted(fit.spline), series = "三次样条法") +
  autolayer(fcasts.spline$mean, series = "三次样条法") +
  xlab("年份") + ylab("获胜者所用时间（分钟）") +
  ggtitle("波士顿马拉松") +
  guides(colour = guide_legend(title = " "))+
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))

marathon %>%
  splinef(lambda=0) %>%
  autoplot()+
  xlab('年份')+
  ggtitle("")+
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))
marathon

prediction<-read.csv("ts.csv",header=T)
data<-prediction[,2]
y<-ts(data = data, start = 1998, end = 2020, frequency = 1)
air <- window(y, start=1998)
fc <- holt(air, h=5)
fc <- holt(air, h=15)
fc2 <- holt(air, damped=TRUE, phi = 0.9, h=32)
autoplot(air) +
  autolayer(fc$mean, series="Holt's method") +
  autolayer(fc2$mean, series="Damped Holt's method") +
  ggtitle("Holt方法预测") +
  xlab("年份") + ylab("澳大利亚航空旅客（百万）") +
  guides(colour=guide_legend(title="预测"))+
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))


fc2[["model"]]
autoplot(fc2) +
  xlab("年份") + ylab("PM2.5")+
  ggtitle('基于阻尼Holt方法的预测') +
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))
fc2

####从这里开始预测
library(forecast)
library(fpp2)
prediction<-read.csv("ts.csv",header=T)
data<-prediction[,143]
y<-ts(data = data, start = 2000, end = 2030, frequency = 1)
y
air <- window(y, start=2000)

###ETS
fit <- ets(air,model="ZZZ",damped=TRUE)
summary(fit)
autoplot(fit)
fit %>% forecast(h=20)%>%
  autoplot() +
  xlab("Year") +
  ylab("PM2.5")+
  ggtitle('基于ETS模型的预测') +
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))

fit %>% forecast(h=20)

###Death global
library(forecast)
library(fpp2)
prediction<-read.csv("ts.csv",header=T)
data<-prediction[,144]
y<-ts(data = data, start = 2000, end = 2019, frequency = 1)
y
air <- window(y, start=2000)
fit <- ets(air,model="ZZZ",damped=TRUE)
summary(fit)
autoplot(fit)
fit %>% forecast(h=31)%>%
  autoplot() +
  xlab("Year") +
  ylab("PM2.5")+
  ggtitle('基于ETS模型的预测') +
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))

fit %>% forecast(h=31)

####从这里开始预测region
library(forecast)
library(fpp2)
prediction<-read.csv("ts2.csv",header=T)
data<-prediction[,101]
y<-ts(data = data, start = 2019, end = 2030, frequency = 1)
y
air <- window(y, start=2019)

###ETS
fit <- ets(air,model="ZZZ",damped=TRUE)##phi= 0.8到0.98
summary(fit)
autoplot(fit)
fit %>% forecast(h=32)%>%
  autoplot() +
  xlab("Year") +
  ylab("PM2.5")+
  ggtitle('基于ETS模型的预测') +
  theme(text = element_text(family = "STHeiti"))+
  theme(plot.title = element_text(hjust = 0.5))

fit %>% forecast(h=32)


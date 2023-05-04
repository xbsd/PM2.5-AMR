library(ggpubr)
library(ggplot2)
line<-read.csv("line00683.csv",row.names = 1)
typeof(line$AMR)
line$AMR<-as.numeric(line$AMR)
model.lm<-lm(formula = AMR ~ PM2.5, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)

p<-ggplot(data=line, aes(x=PM2.5, y=AMR))+geom_point(aes(size = 1))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=AMR))+xlab(bquote(PM[2.5]~ (μg/~m^3)))+
  ylab("Antibiotic resistance")+geom_point(aes(size=1))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 45, y = 0.3, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#???ճ?????????ͼ
p

#line-mice-mge2
library(ggpubr)
library(ggplot2)
line<-read.csv("line-mice-mge2.csv",row.names = 1)
typeof(line$AMR)
line$AMR<-as.numeric(line$ARGs)
model.lm<-lm(formula = ARGs ~ MGEs, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)

p<-ggplot(data=line, aes(x=MGEs, y=ARGs))+geom_point(aes(size = 1))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=MGEs, y=ARGs))+xlab(bquote(MGEs))+
  ylab("Antibiotic resistance")+geom_point(aes(x=0.000710331, y=0.252754635, size=1),colour="red")+geom_point(aes(size=1))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 0.0018, y = 0.08, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#???ճ?????????ͼ
p

#line-mice-bac
library(ggpubr)
library(ggplot2)
line<-read.csv("line-mice-bac.csv",row.names = 1)
typeof(line$arg)
line$AMR<-as.numeric(line$arg)
model.lm<-lm(formula = arg ~ bac, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)

p<-ggplot(data=line, aes(x=bac, y=arg))+geom_point(aes(size = 1))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=bac, y=arg))+xlab("Bacterial Simpson")+
  ylab("ARGs Simpson")+geom_point(aes(x=6.22052, y=4.31475, size=2),colour="red")+geom_point(aes(x=5.56041, y=4.47993, size=2),colour="red")+geom_point(aes(size=2))+stat_smooth(method="lm",se=T)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 7.5, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#???ճ?????????ͼ
p

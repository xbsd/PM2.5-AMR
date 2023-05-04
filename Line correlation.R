library(ggpubr)
library(ggplot2)
install.packages("ellipsis")
library(psych)
line<-read.csv("c:/Users/Administrator/Documents/Line1.csv",row.names = 1)
line<-read.csv("lineln.csv",row.names = 1)
line<-read.csv("Linena.csv",row.names = 1)
line<-read.csv("Lneach.csv",row.names = 1)
line<-read.csv("linelnmm.csv",row.names = 1, header = T)


#第二稿LNMMAMR

typeof(line$LNMMAMR)
line$LNMMAMR<-as.numeric(line$LNMMAMR)

p<-ggplot(data=line, aes(x=LNPM2.5, y=LNMMAMR))+geom_point(aes(size = Isolates,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")

p<-ggplot(data=line,aes(x=LNPM2.5, y=LNMMAMR))+geom_smooth(aes(weight = Isolates), method = lm, size = 1)+geom_point(aes(size=Isolates,alpha=0.6,colour=factor(Region)))+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")

p<-ggplot(data=line,aes(x=LNPM2.5, y=LNMMAMR))+xlab(bquote(ln~ PM[2.5]~ (μg/~m^3)))+
  ylab("ln Antibiotic resistance (%)")+scale_y_continuous(limits = c(2, 4.5),expand = c(0,0))+scale_x_continuous(expand = c(0,0))+geom_smooth(aes(weight = Isolates), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates,alpha=0.6,colour=factor(Region)))+scale_size("Isolates",breaks =c(1000,5000,10000,20000,40000,80000,120000))+labs(colour = "Region")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 2.1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图

p
###第二稿 按年份
line<-read.csv("linelnmm.csv",row.names = 1, header = T)###fig2
line<-read.csv("linelnmmyear.csv",row.names = 1, header = T)

p<-ggplot(data=line, aes(x=LNPM2.5, y=LNMMAMR))+stat_cor(data=line, method = "pearson")+geom_point(aes(size = Isolates,color=factor(YEAR),alpha = .1))+geom_smooth(aes(weight = Isolates,color = factor(YEAR)), se=F,method = lm, size = 1)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())
p<-ggplot(data=line,aes(x=LNPM2.5, y=LNMMAMR))+xlab(bquote(ln~ PM[2.5]~ (μg/~m^3)))+
  ylab("ln Antibiotic resistance (%)")+scale_y_continuous(limits = c(2, 4.5),expand = c(0,0))+scale_x_continuous(expand = c(0,0))+geom_smooth(aes(weight = Isolates,color = factor(YEAR)), se=F,method = lm, size = 1)+geom_point(aes(size=Isolates,alpha=0.6,colour=factor(YEAR)))+scale_size("Isolates",breaks =c(1000,5000,10000,20000,40000,80000,120000))+labs(colour = "YEAR")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())#最终出线性拟合图
p<-ggplot(data=line,aes(x=LNPM2.5, y=LNMMAMR))+xlab(bquote(ln~ PM[2.5]~ (μg/~m^3)))+
  ylab("ln Antibiotic resistance (%)")+scale_y_continuous(limits = c(2, 4.5),expand = c(0,0))+scale_x_continuous(limits = c(1.8, 3.4),expand = c(0,0))+geom_smooth(aes(weight = Isolates,color = factor(YEAR)), se=F,method = lm, size = 1)+geom_point(aes(size=Isolates,alpha=Isolates,colour=factor(YEAR)))+scale_size("Isolates",breaks =c(1000,5000,10000,20000,40000,80000,120000))+labs(colour = "YEAR")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())#最终出线性拟合图
p<-ggplot(data=line,aes(x=LNPM2.5, y=LNMMAMR))+xlab(bquote(ln~ PM[2.5]~ (μg/~m^3)))+
  ylab("ln Antibiotic resistance (%)")+scale_y_continuous(limits = c(2, 4.5),expand = c(0,0))+scale_x_continuous(limits = c(1.5, 3.5),expand = c(0,0))+geom_smooth(aes(color = factor(YEAR)), se=F,method = lm, size = 1)+geom_point(aes(size=Isolates,alpha=Isolates,colour=factor(YEAR)))+scale_size("Isolates",breaks =c(1000,5000,10000,20000,40000,80000,120000))+labs(colour = "YEAR")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())#最终出线性拟合图###fig2

p

par("mai")

model.lm<-lm(formula = LNMMAMR ~ LNPM2.5, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
p + geom_text(aes(x = 3, y = 2, label = as.character(as.expression(eq))), parse = TRUE)#最终出线性拟合图
p

#多条线#se= T意思为画出置信区间, se=F意思则为不画出置信区间
line<-read.csv("Linelnyear.csv",row.names = 1)

p<-ggplot(data=line, aes(x=PM2.51, y=AR))+stat_cor(data=line, method = "pearson")+geom_point(aes(size = Isolates1,color=factor(YEAR),alpha = .1))+geom_smooth(aes(weight = Isolates1,color = factor(YEAR)), se=F,method = lm, size = 1)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())
p

#按年或区域上色
p<-ggplot(data=line, aes(x=PM2.5, y=AMRmm))+geom_point(aes(size = Isolates,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line, aes(x=Ozone, y=AMR))+geom_point(aes(size = Isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Resistance))+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Minmax))+geom_point(aes(size=Isolates2,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=AW))+geom_point(aes(size=Isolates3,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=NAW))+geom_point(aes(size=0.6,alpha=Isolates4,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Acinetobacter_baumannii))+geom_point(aes(size=Isolates5,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Klebsiella_pneumoniae))+geom_point(aes(size=Isolates6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Pseudomonas_aeruginosa))+geom_point(aes(size=Isolates7,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Staphylococcus_aureus))+geom_point(aes(size=Isolates8,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Streptococcus_pneumoniae))+geom_point(aes(size=Isolates9,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Escherichia_coli))+geom_point(aes(size=0.6,alpha=Isolates10,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecalis))+geom_point(aes(size=0.6,alpha=Isolates11,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecium))+geom_point(aes(size=0.6,alpha=Isolates12,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p

p<-ggplot(data=line,aes(x=PM, y=AR))+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p

p<-ggplot(data=line,aes(x=GDP.per.capita, y=PercentResistant))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=Usage, y=Minmax))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=GDP.per.capita, y=AW))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=NAW))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Acinetobacter_baumannii))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Klebsiella_pneumoniae))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Pseudomonas_aeruginosa))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Staphylococcus_aureus))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Streptococcus_pneumoniae))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=Current.health.expenditure, y=Escherichia_coli))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecalis))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecium))+geom_point(aes(size=0.6,alpha=0.6,colour=factor(Region)))+stat_smooth(method="lm",se=T)+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p

p<-ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p
#添加weighted拟合线
p<-ggplot(data=line, aes(x=PM2.5, y=Resistance))+stat_smooth(method="lm",se=T,colour=1)+stat_cor(data=line, method = "pearson")+geom_point(aes(size = Isolates,colour=factor(Year)))+geom_smooth(aes(weight = Isolates), method = lm, size = 1)+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())
p

#仅用weighted
p<-ggplot(data=line,aes(x=PM2.5, y=Resistance))+geom_smooth(aes(weight = Isolates1), method = lm, size = 1)+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
p


ggplot(line,aes(PM2.5,AMR))+geom_point()+
  geom_smooth(method="glm",se=FALSE,
              method.args=list(family=gaussian(link="log")))+
  geom_smooth(method="nls",se=FALSE,
              formula=y~a+b*exp(-c*x),
              method.args=list(start=list(a=0.6,b=1.5,c=1)),
              colour="red")+
  geom_smooth(method="lm",se=FALSE,
              formula=y~exp(-x),
              colour="purple")

ggplot(line,aes(PM2.5,AMR))+ geom_segment(aes(x=41,y=5,xend=47,yend=5))+
  geom_segment(aes(x=41,y=10,xend=47,yend=10),linetype="dashed")+
  geom_text(x=74, y=5, label="y=-57.3e-0.0745x + 47.4, R2 = 0.414, p < 0.0001") +
  geom_text(x=74, y=10, label="y=0.534x + 19.7, R2 = 0.268, p < 0.0001")+
  geom_point(aes(size = Isolates,shape=factor(Income),colour=factor(Income)))+
geom_smooth(method = "glm", se=T, color="black", formula = y ~ exp(-0.0745 * x+47.4))+
stat_smooth(method="lm",se=T,linetype="dashed",colour="black")+
  theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ 
  theme(axis.text= element_text(size=15),axis.title =element_text(size=15))
 



#添加公式
model.lm<-lm(formula = Resistance ~ PM2.5, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
p + geom_text(aes(x = 3, y = 0, label = as.character(as.expression(eq))), parse = TRUE)#最终出线性拟合图
p

#weighted公式和线性拟合PM2.5
model.lm<-lm(formula =Resistance ~ PM2.5, data = line,weights = Isolates1)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L1<-ggplot(data=line,aes(x=PM2.5, y=Resistance))+scale_y_continuous(limits = c(2, 4.5))+geom_smooth(aes(weight = Isolates1), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 4.3, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L1
model.lm<-lm(formula = Minmax ~ PM2.5, data = line,weights = Isolates2)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L2<-ggplot(data=line,aes(x=PM2.5, y=Minmax))+scale_y_continuous(limits = c(1.5, 4.7))+geom_smooth(aes(weight = Isolates2), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates2,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 4.6, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L2
model.lm<-lm(formula = AW ~ PM2.5, data = line,weights = Isolates3)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L3<-ggplot(data=line,aes(x=PM2.5, y=AW))+scale_y_continuous(limits = c(1.5, 4.6))+geom_smooth(aes(weight = Isolates3), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates3,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3.5, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L3
model.lm<-lm(formula = NAW ~ PM2.5, data = line,weights = Isolates4)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L4<-ggplot(data=line,aes(x=PM2.5, y=NAW))+geom_smooth(aes(weight = Isolates4), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates4,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 4.6, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L4
model.lm<-lm(formula = Acinetobacter_baumannii ~ PM2.5, data = line,weights = Isolates5)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L5<-ggplot(data=line,aes(x=PM2.5, y=Acinetobacter_baumannii))+scale_y_continuous(limits = c(0, 5.5))+geom_smooth(aes(weight = Isolates5), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates5,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 0, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L5

model.lm<-lm(formula = Klebsiella_pneumoniae ~ PM2.5, data = line,weights = Isolates6)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L6<-ggplot(data=line,aes(x=PM2.5, y=Klebsiella_pneumoniae))+geom_smooth(aes(weight = Isolates6), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates6,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L6
model.lm<-lm(formula = Pseudomonas_aeruginosa ~ PM2.5, data = line,weights = Isolates7)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L7<-ggplot(data=line,aes(x=PM2.5, y=Pseudomonas_aeruginosa))+geom_smooth(aes(weight = Isolates7), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates7,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L7
model.lm<-lm(formula = Staphylococcus_aureus ~ PM2.5, data = line,weights = Isolates8)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L8<-ggplot(data=line,aes(x=PM2.5, y=Staphylococcus_aureus))+geom_smooth(aes(weight = Isolates8), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates8,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3.5, y = 0, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L8
model.lm<-lm(formula = Streptococcus_pneumoniae ~ PM2.5, data = line,weights = Isolates9)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L9<-ggplot(data=line,aes(x=PM2.5, y=Streptococcus_pneumoniae))+geom_smooth(aes(weight = Isolates9), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates9,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3.5, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L9
model.lm<-lm(formula = Escherichia_coli ~ PM2.5, data = line,weights = Isolates10)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L10<-ggplot(data=line,aes(x=PM2.5, y=Escherichia_coli))+geom_smooth(aes(weight = Isolates10), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates10,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3.5, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L10
model.lm<-lm(formula = Enterococcus_faecalis ~ PM2.5, data = line,weights = Isolates11)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L11<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecalis))+scale_y_continuous(limits = c(0, 4))+geom_smooth(aes(weight = Isolates11), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates11,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 0, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L11
model.lm<-lm(formula = Enterococcus_faecium ~ PM2.5, data = line,weights = Isolates12)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L12<-ggplot(data=line,aes(x=PM2.5, y=Enterococcus_faecium))+scale_y_continuous(limits = c(2, 5))+geom_smooth(aes(weight = Isolates12), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates12,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 3, y = 4.6, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L12

#weighted公式和线性拟合Usage
model.lm<-lm(formula =Resistance ~ Usage, data = line,weights = Isolates1)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L1<-ggplot(data=line,aes(x=Usage, y=Resistance))+scale_x_continuous(limits = c(7.5, 10))+scale_y_continuous(limits = c(2, 4.5))+geom_smooth(aes(weight = Isolates1), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L1
model.lm<-lm(formula = Minmax ~ Usage, data = line,weights = Isolates2)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L2<-ggplot(data=line,aes(x=Usage, y=Minmax))+scale_y_continuous(limits = c(2, 4.5))+geom_smooth(aes(weight = Isolates2), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates2,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L2
model.lm<-lm(formula = AW ~ Usage, data = line,weights = Isolates3)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L3<-ggplot(data=line,aes(x=Usage, y=AW))+scale_y_continuous(limits = c(1, 4.5))+geom_smooth(aes(weight = Isolates3), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates3,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L3
model.lm<-lm(formula = NAW ~ Usage, data = line,weights = Isolates4)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L4<-ggplot(data=line,aes(x=Usage, y=NAW))+geom_smooth(aes(weight = Isolates4), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates4,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L4
model.lm<-lm(formula = Acinetobacter_baumannii ~ Usage, data = line,weights = Isolates5)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L5<-ggplot(data=line,aes(x=Usage, y=Acinetobacter_baumannii))+scale_y_continuous(limits = c(2, 4.7))+geom_smooth(aes(weight = Isolates5), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates5,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L5
model.lm<-lm(formula = Klebsiella_pneumoniae ~ Usage, data = line,weights = Isolates6)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L6<-ggplot(data=line,aes(x=Usage, y=Klebsiella_pneumoniae))+geom_smooth(aes(weight = Isolates6), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates6,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L6
model.lm<-lm(formula = Pseudomonas_aeruginosa ~ Usage, data = line,weights = Isolates7)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L7<-ggplot(data=line,aes(x=Usage, y=Pseudomonas_aeruginosa))+geom_smooth(aes(weight = Isolates7), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates7,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L7
model.lm<-lm(formula = Staphylococcus_aureus ~ Usage, data = line,weights = Isolates8)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L8<-ggplot(data=line,aes(x=Usage, y=Staphylococcus_aureus))+geom_smooth(aes(weight = Isolates8), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates8,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9.3, y = 0, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L8
model.lm<-lm(formula = Streptococcus_pneumoniae ~ Usage, data = line,weights = Isolates9)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L9<-ggplot(data=line,aes(x=Usage, y=Streptococcus_pneumoniae))+scale_x_continuous(limits = c(8, 10))+geom_smooth(aes(weight = Isolates9), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates9,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9.2, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L9
model.lm<-lm(formula = Escherichia_coli ~ Usage, data = line,weights = Isolates10)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L10<-ggplot(data=line,aes(x=Usage, y=Escherichia_coli))+geom_smooth(aes(weight = Isolates10), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates10,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L10
model.lm<-lm(formula = Enterococcus_faecalis ~ Usage, data = line,weights = Isolates11)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L11<-ggplot(data=line,aes(x=Usage, y=Enterococcus_faecalis))+scale_y_continuous(limits = c(0, 4))+geom_smooth(aes(weight = Isolates11), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates11,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L11
model.lm<-lm(formula = Enterococcus_faecium ~ Usage, data = line,weights = Isolates12)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L12<-ggplot(data=line,aes(x=Usage, y=Enterococcus_faecium))+geom_smooth(aes(weight = Isolates12), method = lm, size = 1,color="black")+scale_y_continuous(limits = c(2, 5))+geom_point(aes(size=Isolates12,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 3, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L12


#weighted公式和线性拟合GDP.per.capita
model.lm<-lm(formula =Resistance ~ GDP.per.capita, data = line,weights = Isolates1)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L1<-ggplot(data=line,aes(x=GDP.per.capita, y=Resistance))+scale_y_continuous(limits = c(2, 4.6))+scale_x_continuous(limits = c(6.5, 12))+geom_smooth(aes(weight = Isolates1), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L1
model.lm<-lm(formula = Minmax ~ GDP.per.capita, data = line,weights = Isolates2)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L2<-ggplot(data=line,aes(x=GDP.per.capita, y=Minmax))+scale_y_continuous(limits = c(2, 4.5))+scale_x_continuous(limits = c(3, 9.2))+geom_smooth(aes(weight = Isolates2), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates2,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L2
model.lm<-lm(formula = AW ~ GDP.per.capita, data = line,weights = Isolates3)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L3<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=AW))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(2.5, 4.6))+geom_smooth(aes(weight = Isolates3), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates3,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2.5, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L3
model.lm<-lm(formula = NAW ~ GDP.per.capita, data = line,weights = Isolates4)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L4<-ggplot(data=line,aes(x=GDP.per.capita, y=NAW))+scale_x_continuous(limits = c(3.5, 9.2))+geom_smooth(aes(weight = Isolates4), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates4,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L4
model.lm<-lm(formula = Acinetobacter_baumannii ~ GDP.per.capita, data = line,weights = Isolates5)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L5<-ggplot(data=line,aes(x=GDP.per.capita, y=Acinetobacter_baumannii))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(2, 4.7))+geom_smooth(aes(weight = Isolates5), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates5,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L5
model.lm<-lm(formula = Klebsiella_pneumoniae ~ GDP.per.capita, data = line,weights = Isolates6)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L6<-ggplot(data=line,aes(x=GDP.per.capita, y=Klebsiella_pneumoniae))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(1, 5))+geom_smooth(aes(weight = Isolates6), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates6,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L6
model.lm<-lm(formula = Pseudomonas_aeruginosa ~ GDP.per.capita, data = line,weights = Isolates7)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L7<-ggplot(data=line,aes(x=GDP.per.capita, y=Pseudomonas_aeruginosa))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(1, 4.6))+geom_smooth(aes(weight = Isolates7), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates7,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L7
model.lm<-lm(formula = Staphylococcus_aureus ~ GDP.per.capita, data = line,weights = Isolates8)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L8<-ggplot(data=line,aes(x=GDP.per.capita, y=Staphylococcus_aureus))+scale_x_continuous(limits = c(3.5, 9))+scale_y_continuous(limits = c(1, 4.5))+geom_smooth(aes(weight = Isolates8), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates8,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L8
model.lm<-lm(formula = Streptococcus_pneumoniae ~ GDP.per.capita, data = line,weights = Isolates9)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L9<-ggplot(data=line,aes(x=GDP.per.capita, y=Streptococcus_pneumoniae))+geom_smooth(aes(weight = Isolates9), method = lm, size = 1,color="black")+scale_x_continuous(limits = c(5, 12))+scale_y_continuous(limits = c(1, 5))+geom_point(aes(size=Isolates9,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 8, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L9
model.lm<-lm(formula = Escherichia_coli ~ GDP.per.capita, data = line,weights = Isolates10)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L10<-ggplot(data=line,aes(x=GDP.per.capita, y=Escherichia_coli))+scale_y_continuous(limits = c(2, 4.5))+geom_smooth(aes(weight = Isolates10), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates10,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 7, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L10
model.lm<-lm(formula = Enterococcus_faecalis ~ GDP.per.capita, data = line,weights = Isolates11)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L11<-ggplot(data=line,aes(x=GDP.per.capita, y=Enterococcus_faecalis))+scale_x_continuous(limits = c(4, 9.2))+scale_y_continuous(limits = c(1, 3.8))+geom_smooth(aes(weight = Isolates11), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates11,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L11
model.lm<-lm(formula = Enterococcus_faecium ~ GDP.per.capita, data = line,weights = Isolates12)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L12<-ggplot(data=line,aes(x=GDP.per.capita, y=Enterococcus_faecium))+geom_smooth(aes(weight = Isolates12), method = lm, size = 1,color="black")+scale_x_continuous(limits = c(3.5, 9.5))+scale_y_continuous(limits = c(2, 5))+geom_point(aes(size=Isolates12,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 9, y = 3, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L12
#weighted公式和线性拟合Current.health.expenditure.per.capita
model.lm<-lm(formula =Resistance ~ Current.health.expenditure.per.capita, data = line,weights = Isolates1)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L1<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Resistance))+scale_x_continuous(limits = c(3, 9.2))+scale_y_continuous(limits = c(2, 4.6))+geom_smooth(aes(weight = Isolates1), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates1,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L1
model.lm<-lm(formula = Minmax ~ Current.health.expenditure.per.capita, data = line,weights = Isolates2)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L2<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Minmax))+scale_y_continuous(limits = c(2, 4.5))+scale_x_continuous(limits = c(3, 9.2))+geom_smooth(aes(weight = Isolates2), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates2,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L2
model.lm<-lm(formula = AW ~ Current.health.expenditure.per.capita, data = line,weights = Isolates3)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L3<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=AW))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(2.5, 4.6))+geom_smooth(aes(weight = Isolates3), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates3,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2.5, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L3
model.lm<-lm(formula = NAW ~ Current.health.expenditure.per.capita, data = line,weights = Isolates4)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L4<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=NAW))+scale_x_continuous(limits = c(3.5, 9.2))+geom_smooth(aes(weight = Isolates4), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates4,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L4
model.lm<-lm(formula = Acinetobacter_baumannii ~ Current.health.expenditure.per.capita, data = line,weights = Isolates5)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L5<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Acinetobacter_baumannii))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(2, 4.7))+geom_smooth(aes(weight = Isolates5), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates5,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L5
model.lm<-lm(formula = Klebsiella_pneumoniae ~ Current.health.expenditure.per.capita, data = line,weights = Isolates6)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L6<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Klebsiella_pneumoniae))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(1, 5))+geom_smooth(aes(weight = Isolates6), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates6,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L6
model.lm<-lm(formula = Pseudomonas_aeruginosa ~ Current.health.expenditure.per.capita, data = line,weights = Isolates7)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L7<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Pseudomonas_aeruginosa))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(1, 4.6))+geom_smooth(aes(weight = Isolates7), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates7,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L7
model.lm<-lm(formula = Staphylococcus_aureus ~ Current.health.expenditure.per.capita, data = line,weights = Isolates8)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L8<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Staphylococcus_aureus))+scale_x_continuous(limits = c(3.5, 9))+scale_y_continuous(limits = c(1, 4.5))+geom_smooth(aes(weight = Isolates8), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates8,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L8
model.lm<-lm(formula = Streptococcus_pneumoniae ~ Current.health.expenditure.per.capita, data = line,weights = Isolates9)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L9<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Streptococcus_pneumoniae))+scale_x_continuous(limits = c(3.5, 9.2))+scale_y_continuous(limits = c(1, 4.5))+geom_smooth(aes(weight = Isolates9), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates9,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L9
model.lm<-lm(formula = Escherichia_coli ~ Current.health.expenditure.per.capita, data = line,weights = Isolates10)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L10<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Escherichia_coli))+scale_y_continuous(limits = c(2, 4.5))+geom_smooth(aes(weight = Isolates10), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates10,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 2, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L10
model.lm<-lm(formula = Enterococcus_faecalis ~ Current.health.expenditure.per.capita, data = line,weights = Isolates11)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L11<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Enterococcus_faecalis))+scale_x_continuous(limits = c(4, 9.2))+scale_y_continuous(limits = c(1, 3.8))+geom_smooth(aes(weight = Isolates11), method = lm, size = 1,color="black")+geom_point(aes(size=Isolates11,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 1, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L11
model.lm<-lm(formula = Enterococcus_faecium ~ Current.health.expenditure.per.capita, data = line,weights = Isolates12)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))
eq <- substitute(italic(y) == a + b %.% italic(x)~","~italic(R)^2~"="~r2~","~italic(P)~"="~p, l)
L12<-ggplot(data=line,aes(x=Current.health.expenditure.per.capita, y=Enterococcus_faecium))+geom_smooth(aes(weight = Isolates12), method = lm, size = 1,color="black")+scale_x_continuous(limits = c(3.5, 9.5))+scale_y_continuous(limits = c(2, 5))+geom_point(aes(size=Isolates12,alpha=0.6,colour=factor(Region)))+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank())+ geom_text(aes(x = 6, y = 3, color=T, label = as.character(as.expression(eq))), parse = TRUE,color="black")#最终出线性拟合图
L12




library(ggpubr)#组合图
ggarrange(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,ncol=4,nrow=3,labels = c("A","B","C","D","E","F","G","H","I","J","K","L"),font.label = list(size = 14, face = "bold"))

#非线性拟合
install.packages("devtools")
devtools::install_github("PhDMeiwp/basicTrendline2@master", force = TRUE)

library(basicTrendline)
library(basicTrendline2)
AMR=line[c(1:939),c(1:1)]
AMRmm=line[c(1:939),c(2:2)]
PM2.5=line[c(1:939),c(3:3)]
PM10=line[c(1:939),c(4:4)]
Ozone=line[c(1:939),c(5:5)]
BDWS=line[c(1:939),c(6:6)]
SMDWS=line[c(1:939),c(7:7)]
SMSS=line[c(1:939),c(8:8)]
GDP=line[c(1:939),c(9:9)]
GDPpc=line[c(1:939),c(10:10)]
CHE=line[c(1:939),c(11:11)]
CHEpc=line[c(1:939),c(12:12)]
Population.density =line[c(1:939),c(13:13)]
Population=line[c(1:939),c(14:14)]
Literacy.rate=line[c(1:939),c(15:15)]
Primary.completion.rate =line[c(1:939),c(16:16)]
Tm=line[c(1:939),c(17:17)]
Rainfall=line[c(1:939),c(18:18)]
SO2=line[c(1:939),c(19:19)]
NO2=line[c(1:939),c(20:20)]
CO=line[c(1:939),c(21:21)]
Usage=line[c(1:939),c(22:22)]
Aminoglycosides.Escherichia_coli=line[c(1:939),c(23:23)]
Betalactams.Escherichia_coli=line[c(1:939),c(24:24)]
Carbapenems.Escherichia_coli=line[c(1:939),c(25:25)]
Cephalosporins.3rdgen..Escherichia_coli=line[c(1:939),c(26:26)]
Fluoroquinolones.Escherichia_coli=line[c(1:939),c(27:27)]
Aminoglycosides.Acinetobacter_baumannii=line[c(1:939),c(30:30)]
Betalactams.Acinetobacter_baumannii=line[c(1:939),c(31:31)]
Carbapenems.Acinetobacter_baumannii=line[c(1:939),c(32:32)]
Cephalosporins.3rdgen..Acinetobacter_baumannii=line[c(1:939),c(33:33)]
Fluoroquinolones.Acinetobacter_baumannii=line[c(1:939),c(34:34)]
Aminoglycosides.Enterococcus_faecalis=line[c(1:939),c(44:44)]
Betalactams.Enterococcus_faecalis=line[c(1:939),c(45:45)]
Vancomycin.Enterococcus_faecalis=line[c(1:939),c(46:46)]
Aminoglycosides.Enterococcus_faecium=line[c(1:939),c(49:49)]
Aminoglycosides.Klebsiella_pneumoniae=line[c(1:939),c(54:54)]
Betalactams.Klebsiella_pneumoniae=line[c(1:939),c(55:55)]
Carbapenems.Klebsiella_pneumoniae=line[c(1:939),c(56:56)]
Cephalosporins.3rdgen..Klebsiella_pneumoniae=line[c(1:939),c(57:57)]
Fluoroquinolones.Klebsiella_pneumoniae=line[c(1:939),c(58:58)]
Aminoglycosides.Pseudomonas_aeruginosa=line[c(1:939),c(61:61)]
Carbapenems.Pseudomonas_aeruginosa=line[c(1:939),c(62:62)]
Cephalosporins.3rdgen..Pseudomonas_aeruginosa=line[c(1:939),c(63:63)]
Fluoroquinolones.Pseudomonas_aeruginosa=line[c(1:939),c(64:64)]
Betalactams.Pseudomonas_aeruginosa=line[c(1:939),c(65:65)]
Oxacillin.Staphylococcus_aureus=line[c(1:939),c(54:54)]
Fluoroquinolones.Staphylococcus_aureus=line[c(1:939),c(82:82)]
Aminoglycosides.Staphylococcus_aureus=line[c(1:939),c(86:86)]
Macrolides.Streptococcus_pneumoniae=line[c(1:939),c(91:91)]
Betalactams.Streptococcus_pneumoniae=line[c(1:939),c(92:92)]


ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Carbapenems.Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Cephalosporins.3rdgen..Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Fluoroquinolones.Escherichia_coli))+geom_point(aes(size = Escherichia_coli_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Acinetobacter_baumannii))+geom_point(aes(size = Acinetobacter_baumannii_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Acinetobacter_baumannii))+geom_point(aes(size = Acinetobacter_baumannii_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Carbapenems.Acinetobacter_baumannii))+geom_point(aes(size = Acinetobacter_baumannii_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Cephalosporins.3rdgen..Acinetobacter_baumannii))+geom_point(aes(size = Acinetobacter_baumannii_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Fluoroquinolones.Acinetobacter_baumannii))+geom_point(aes(size = Acinetobacter_baumannii_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Enterococcus_faecalis))+geom_point(aes(size = Enterococcus_faecalis_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Enterococcus_faecalis))+geom_point(aes(size = Enterococcus_faecalis_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Vancomycin.Enterococcus_faecalis))+geom_point(aes(size = Enterococcus_faecalis_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Enterococcus_faecium))+geom_point(aes(size = Enterococcus_faecium_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Klebsiella_pneumoniae))+geom_point(aes(size = Klebsiella_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Klebsiella_pneumoniae))+geom_point(aes(size = Klebsiella_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Carbapenems.Klebsiella_pneumoniae))+geom_point(aes(size = Klebsiella_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Cephalosporins.3rdgen..Klebsiella_pneumoniae))+geom_point(aes(size = Klebsiella_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Fluoroquinolones.Klebsiella_pneumoniae))+geom_point(aes(size = Klebsiella_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Pseudomonas_aeruginosa))+geom_point(aes(size = Pseudomonas_aeruginosa_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Carbapenems.Pseudomonas_aeruginosa))+geom_point(aes(size = Pseudomonas_aeruginosa_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Cephalosporins.3rdgen..Pseudomonas_aeruginosa))+geom_point(aes(size = Pseudomonas_aeruginosa_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Fluoroquinolones.Pseudomonas_aeruginosa))+geom_point(aes(size = Pseudomonas_aeruginosa_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Pseudomonas_aeruginosa))+geom_point(aes(size = Pseudomonas_aeruginosa_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Oxacillin.Staphylococcus_aureus))+geom_point(aes(size = Staphylococcus_aureus_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Fluoroquinolones.Staphylococcus_aureus))+geom_point(aes(size = Staphylococcus_aureus_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Aminoglycosides.Staphylococcus_aureus))+geom_point(aes(size = Staphylococcus_aureus_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Macrolides.Streptococcus_pneumoniae))+geom_point(aes(size = Streptococcus_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")
ggplot(data=line, aes(x=PM2.5, y=Betalactams.Streptococcus_pneumoniae))+geom_point(aes(size = Streptococcus_pneumoniae_isolates,shape=factor(Region),colour=factor(Region)))+stat_smooth(method="lm",se=T,colour="black")+stat_cor(data=line, method = "pearson")+theme_bw()+theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) #stat_cor(data=dat, method = "pearson")






trendline(PM2.5,Aminoglycosides.Escherichia_coli,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Escherichia_coli,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Escherichia_coli,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Escherichia_coli,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Carbapenems.Escherichia_coli,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Carbapenems.Escherichia_coli,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Cephalosporins.3rdgen..Escherichia_coli,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Cephalosporins.3rdgen..Escherichia_coli,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Fluoroquinolones.Escherichia_coli,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Fluoroquinolones.Escherichia_coli,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Acinetobacter_baumannii,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Acinetobacter_baumannii,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Acinetobacter_baumannii,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Acinetobacter_baumannii,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Carbapenems.Acinetobacter_baumannii,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Carbapenems.Acinetobacter_baumannii,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Cephalosporins.3rdgen..Acinetobacter_baumannii,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Cephalosporins.3rdgen..Acinetobacter_baumannii,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Fluoroquinolones.Acinetobacter_baumannii,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Fluoroquinolones.Acinetobacter_baumannii,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Enterococcus_faecalis,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Enterococcus_faecalis,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Enterococcus_faecalis,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Enterococcus_faecalis,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Vancomycin.Enterococcus_faecalis,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Vancomycin.Enterococcus_faecalis,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Enterococcus_faecium,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Enterococcus_faecium,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Klebsiella_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Klebsiella_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Klebsiella_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Klebsiella_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Carbapenems.Klebsiella_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Carbapenems.Klebsiella_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Cephalosporins.3rdgen..Klebsiella_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Cephalosporins.3rdgen..Klebsiella_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Fluoroquinolones.Klebsiella_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Fluoroquinolones.Klebsiella_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Pseudomonas_aeruginosa,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Pseudomonas_aeruginosa,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Carbapenems.Pseudomonas_aeruginosa,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Carbapenems.Pseudomonas_aeruginosa,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Cephalosporins.3rdgen..Pseudomonas_aeruginosa,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Cephalosporins.3rdgen..Pseudomonas_aeruginosa,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Fluoroquinolones.Pseudomonas_aeruginosa,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Fluoroquinolones.Pseudomonas_aeruginosa,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Pseudomonas_aeruginosa,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Pseudomonas_aeruginosa,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Oxacillin.Staphylococcus_aureus,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Oxacillin.Staphylococcus_aureus,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Fluoroquinolones.Staphylococcus_aureus,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Fluoroquinolones.Staphylococcus_aureus,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Aminoglycosides.Staphylococcus_aureus,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Aminoglycosides.Staphylococcus_aureus,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Macrolides.Streptococcus_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Macrolides.Streptococcus_pneumoniae,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,Betalactams.Streptococcus_pneumoniae,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,Betalactams.Streptococcus_pneumoniae,model="exp3P",eDigit=3)#指数拟合




trendline(Ozone,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(PM2.5,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(PM10,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(BDWS,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(SMDWS,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(SMSS,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(GDP,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(GDPpc,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(CHE,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(CHEpc,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Population.density,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Population,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Literacy.rate,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Primary.completion.rate,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Tm,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(Rainfall,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(SO2,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(NO2,AMR,model="exp3P",eDigit=3)#指数拟合
trendline(CO,AMR,model="exp3P",eDigit=3)#指数拟合

trendline(Ozone,AMR,model="line2P",eDigit=3)#线性拟合
trendline(PM2.5,AMR,model="line2P",eDigit=3)#线性拟合
trendline(PM10,AMR,model="line2P",eDigit=3)#线性拟合
trendline(BDWS,AMR,model="line2P",eDigit=3)#线性拟合
trendline(SMDWS,AMR,model="line2P",eDigit=3)#线性拟合
trendline(SMSS,AMR,model="line2P",eDigit=3)#线性拟合
trendline(GDP,AMR,model="line2P",eDigit=3)#线性拟合
trendline(GDPpc,AMR,model="line2P",eDigit=3)#线性拟合
trendline(CHE,AMR,model="line2P",eDigit=3)#线性拟合
trendline(CHEpc,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Population.density,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Population,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Literacy.rate,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Primary.completion.rate,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Tm,AMR,model="line2P",eDigit=3)#线性拟合
trendline(Rainfall,AMR,model="line2P",eDigit=3)#线性拟合
trendline(SO2,AMR,model="line2P",eDigit=3)#线性拟合
trendline(NO2,AMR,model="line2P",eDigit=3)#线性拟合
trendline(CO,AMR,model="line2P",eDigit=3)#线性拟合

trendline(PM2.5,AMR,model="line2P",summary=TRUE,eDigit=3)#线性拟合
trendline(Ozone,AMR,model="line2P",summary=TRUE,eDigit=3)#线性拟合

plot(PM2.5,AMR,main="Different regression lines in one plot")+geom_point(aes(size = Isolates,colour=factor(Region)))
trendline(PM2.5,AMR,model="line2P",plot=FALSE,linecolor = "red")
trendline(PM2.5,AMR,model="exp3P",plot=FALSE,linecolor = "blue")
legend("bottomright",c("line2P","exp3P"), lty=c(1,1),col=c("red","blue"))

trendline(PM2.5,AMR,,model="exp3P",ePos.x = 30, ePos.y = 60,eDigit = 4,lty = 1, lwd = 1,xname = "x", yname = "y",CI.fill = TRUE, CI.level = 0.95, CI.color = "grey",CI.alpha = 1, CI.lty = 1, CI.lwd = 1,las = 1, xlab = "PM2.5", ylab = "Resistance")
#“line2P” # y=a*x+b; “line3P” # y=a*x^2+b*x+c; “log2P” # y=a*ln(x)+b; “exp3P” # y=a*exp(b*x)+c; “power3P” # y=a*x^b+c)
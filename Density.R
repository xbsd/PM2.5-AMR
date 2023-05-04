
line<-read.csv("lineyear.csv",row.names = 1, header = T)
line<-read.csv("density.csv",row.names = 1, header = T)
result1<- c()
for (i in 2:161) {
  fit<-lm( MMAMR~line[,i],data=line)  
result1<-rbind(result1,c(colnames(line)[i],coef(summary(fit))[2,c(1,2,4)]))
}

write.table(result1,file="E://result1.csv",sep= " ",row.names=T,col.names=T,quote=T)


model.lm<-lm(formula = MMAMR ~ Oxacillin..MRSA..Staphylococcus_aureus2000.2006, data = line)
l <- list(a = as.numeric(format(coef(model.lm)[1], digits = 4)), b = as.numeric(format(coef(model.lm)[2], digits = 4)), r2 = format(summary(model.lm)$r.squared, digits = 4), p = format(summary(model.lm)$coefficients[2,4], digits = 4))

library(ggplot2)
library(reshape2)
df<-read.csv("density.csv",row.names = 1, header = T)
df = melt(df)
ggplot(df,aes(x=value,   
              fill=variable,     # fill填充颜色，根据变量名赋值
              colour=variable))+ # colour图形边界颜色，根据变量名赋值
  geom_density(alpha=0.5,        # 填充颜色透明度
               size=1,           # 线条粗细
               linetype = 1      # 线条类型1是实线，2是虚线
  )+geom_vline(xintercept=c(0.8808,1.015,1.059), linetype="dashed",alpha=0.5,size=1,colour = c("red","green","blue"))+
  scale_y_continuous(limits = c(0, 1.1),expand = c(0,0))+scale_x_continuous(expand = c(0,0))+
  theme_bw() +theme(panel.grid.major=element_blank(),panel.grid.minor=element_blank()) # 白色主题


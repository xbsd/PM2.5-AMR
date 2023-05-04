#R??jitter
library(ggplot2)
arg<-read.table("clipboard",header=T)
qplot(class,var,data=arg,geom="jitter",alpha=0.5,size=2,colour=class)
p<-ggplot(arg,aes(x=factor(class),y=var))
p+geom_boxplot(pch=12,cex=1,col="blue")+geom_point(position="jitter",col=2,pch=16,cex=1)
p+geom_boxplot(pch=12,cex=1,col="black")+geom_point(position="jitter",aes(colour = factor(color)),pch=16,cex=1) 
p+geom_boxplot(pch=12,cex=0.5,col="black")+geom_point(position="jitter",aes(colour = factor(color)),pch=16,cex=2) 

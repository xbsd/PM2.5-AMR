library(maps)
library(mapdata)
library(openxlsx)
library(gplots)
library(maptools)
library(rgeos)
library(ggplot2)
library(gpclib)
library(ggsci)
library(scales)
gpclibPermit()
data(wrld_simpl)
plot(wrld_simpl)
wrld_simpl@data$id <- wrld_simpl@data$NAME
wrld <- fortify(wrld_simpl, region="id")
wrld <- subset(wrld, id != "Antarctica") # we don't rly need Antarctica
ggplot() +theme_classic()+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25)+ylim(-60,90)
ddf = read.csv("Worldmap-Allmaps.csv") 
ddf = read.csv("World-Krishna.csv") 
windowsFonts(TNM = windowsFont("Times New Roman"))
max.value = 100
min.value = 0
interval = 20
color1 = pal_aaas()(20)
color5 = pal_npg(alpha = 0.1)(10)
show_col(color5)
show_col(color1)
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) + geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Value),  color="white", size=0.25) 
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Value),  color="white", size=0.25) + scale_fill_gradientn(colours=colorpanel(75, low="darkgreen", mid="yellow", high="red"))
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Value),  color="white", size=0.25) + scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Value),  color="white", size=0.25) + scale_fill_gradientn(colours=colorpanel(100, low="#33CCFF", mid="yellow", high="red"))+ coord_map("ortho", orientation = c(30, 110, 0))+
  theme(panel.grid = element_blank(),panel.background = element_blank(),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))

#Othermaps
ddf = read.csv("Allmaps.csv") 
max.value = 100
min.value = 0
interval = 20
#MMAMR
AMR<-ggplot()+ylim(-90,90)+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=MMAMR),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
AMR

ggplot()+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=MMAMR),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))

####PAF
PAF<-ggplot()+ylim(-90,90) + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Change.in.PAF...),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
PAF

####EXBurden
EXBurden<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=lnburden4),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
EXBurden
###Contribution
ddf$ContributionGDPlog<-as.numeric(ddf$ContributionGDPlog)
Contribution<-ggplot()+ylim(-90,90) + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=ContributionGDP1),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Contribution
####划分颜色
Contribution<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Contribution),  color="white", size=0.25) + 
  scale_fill_manual(values=c("<5%" = "darkgreen", "5 to 10%"="#99DD00", "10 to 15%" = "#EEEE00","15 to 20%"="#FF0000", "20 to 25%"="#CC0000", "≥25" = "#AA0000"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Contribution
####ContributionGDP划分颜色
Contribution<-ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=ContributionGDP),  color="white", size=0.25) + 
  scale_fill_manual(values=c("<5%" = "darkgreen", "5 to 10%"="#99DD00", "10 to 15%" = "#EEEE00","15 to 20%"="#FF0000", "20 to 30%"="#CC0000", "≥30%" = "#AA0000"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Contribution
#LNMMAMR
AMR<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=LNMMAMR),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
AMR

#PM
PM<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=PM2.5),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
PM

#SDAMR
AMR<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SDAMR),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
AMR

####Usage
Usage<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Usage),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Usage

####BDWS
BDWS<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=BDWS),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
BDWS

####GDP per capita
ddf$GDP.per.capita<-log10(ddf$GDP.per.capita)
GDP.per.capita<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=GDP.per.capita),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
GDP.per.capita

###CHE per capita
ddf$CHE.per.capita<-log10(ddf$CHE.per.capita)
CHE.per.capita<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=CHE.per.capita),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
CHE.per.capita

####Population density
ddf$Population.density<-log10(ddf$Population.density)
Population.density<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Population.density),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Population.density

###Primary completion rate
Primary.completion.rate<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Primary.completion.rate),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Primary.completion.rate
###Tm
Tm<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Tm),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Tm

###Rainfall
Rainfall<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Rainfall),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Rainfall

###Governance
Governance<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Governance),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Governance

###Change in AMR (%)
Change.in.AMR....<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Change.in.AMR....),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Change.in.AMR....

###Deaths involving infection
ddf$Deaths.involving.infection<-log10(ddf$Deaths.involving.infection)
Deaths.involving.infection<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Deaths.involving.infection),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
Deaths.involving.infection

###All cause deaths
ddf$All.cause.deaths<-log10(ddf$All.cause.deaths)
All.cause.deaths<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=All.cause.deaths),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
All.cause.deaths
 
#Aggregate.resistance
AMR<-ggplot() +ylim(-90,90)+ geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Aggregate.resistance),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
AMR
#AW
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=AW),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
#NAW
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=NAW),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))
#AB
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=AB),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#EA
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=EA),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#EFS
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=EFS),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#EFM
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=EFM),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#EC
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=EC),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#KP
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=KP),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#PA
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=PA),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#SA
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SA),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#SP
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SP),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))

#PM10
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=PM10),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#PM2.5
PM<-ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=PM2.5),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
PM
#AMR
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=AMR),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Ozone
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Ozone),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Usage
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Usage),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#BDWS
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=BDWS),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#SMDWS
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SMDWS),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#SMSS
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SMSS),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#GDP
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=GDP),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#GDP per capita
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=GDP.per.capita),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#CHE
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=CHE),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Current health expenditure per capita
CHEP<-ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=CHE.per.capita),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Population density
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Population.density),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Population
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Population),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Literacy rate
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Literacy.rate),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Primary completion rate
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Primary.completion.rate),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Tm
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Tm),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#Rainfall
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Rainfall),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#SO2
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=SO2),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#NO2
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=NO2),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))
#CO
ggplot() + geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=CO),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="#00468b19"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.3))



##Cost
ddf$Cost<-log10(ddf$Cost)
ggplot()+ylim(-90,90)+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Cost),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))

##YLL
ddf$YLL<-log10(ddf$YLL)
ggplot()+ylim(-90,90)+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=YLL),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))


##Death
ddf$Death<-log10(ddf$Death)
ggplot()+ylim(-90,90)+geom_map(data=wrld, map=wrld, aes(map_id=id, x=long, y=lat), fill="white", color="#7f7f7f", size=0.25) +   
  geom_map(data=ddf, map=wrld, aes(map_id=Country, fill=Death),  color="white", size=0.25) + 
  scale_fill_gradientn(colours=colorpanel(100, low="darkgreen",mid="yellow",high="red"))+
  theme(panel.grid = element_blank(),panel.background = element_rect(fill="white"),axis.text = element_blank(),axis.ticks = element_blank(),axis.title = element_blank(),legend.position = c(0.2,0.4))


#组合图
library(cowplot)
library(showtext)
gg<-ggdraw()+draw_plot(AMR,0,0.5,1,0.5)+
  draw_plot(PM,0,0,0.5,0.5)+
  draw_plot(CHEP,0.5,0,0.5,0.5)+
  draw_plot_label(c("A","B","C"),c(0,0,0.5),c(1,0.5,0.5),size = 15,colour = "black")
print(gg)

library(Rmisc)
multiplot(AMR,PM,CHEP)

library(ggpubr)
ggarrange(AMR,PM,CHEP,ncol=1,nrow=3,labels = c("A","B","C"),font.label = list(size = 14, face = "bold"))

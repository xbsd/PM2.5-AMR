#排序分组环状条形图
library(ggplot2)
library(tidyverse)
library(ragg)
library(ggpattern)
slope<-read.csv("Circos-Bar-Slope.csv",row.names = 1, sep=",")
slope<-read.csv("Slopepm.csv",row.names = 1, sep=",")
slope<-read.csv("Cirslope.csv",row.names = 1, sep=",")

###MMAMR第二稿
data<-read.csv("Cirslope.csv",row.names = 1, sep=",")
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 2
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=1)+
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 200, xend = start, yend = 200), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 160, xend = start, yend = 160), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 120, xend = start, yend = 120), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 80, xend = start, yend = 80), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 40, xend = start, yend = 40), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
 geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),6), y = c(0,40, 80, 120,160, 200), label = c("0","0.4", "0.8", "1.2","1.6", "2.0"), color="grey", size=3, angle=1, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-50,200)+
  theme_minimal()+
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )
p


###好像不行
head(slope)
slope <- mutate(slope, Slope.10 = Slope*10)
ggplot(slope, aes(x = All)) +geom_col(aes(y = Slope), fill=Bacteria) +coord_polar()#变成环形

lable_data<-slope
number_of_bar<-nrow(lable_data)
angle<- 90-360*(lable_data$id.1-0.5)/number_of_bar
lable_data$hjust<-ifelse(angle< -90,1,0)
lable_data$angle<-ifelse(angle< -90, angle+180, angle)
head(lable_data)
ggplot(slope, aes(x=as.factor(id.1), y=Slope, fill= Bacteria))+geom_bar(stat = "identity",alpha=1)+
  ylim(-0.2,2)+
  theme_minimal()+
  theme(axis.text = element_blank(),axis.title = element_blank(),panel.grid = element_blank(),plot.margin = unit(rep(-1,6),"cm"))+
  coord_polar()+
geom_text(data = lable_data,aes(x=id.1,y=Slope+0.05,label=Antibiotic,hjust=hjust),color="black",alpha=1,size=2.5,angle=lable_data$angle,inherit.aes = F)+
geom_text(data = lable_data,aes(x=id.1,y=Slope-0.2,label=Slope,hjust=hjust),color="black",alpha=0.5,size=2,angle=lable_data$angle,inherit.aes = F)


ggplot(slope, aes(x=as.factor(id.1), y=Slope, fill= Bacteria))+geom_bar(stat = "identity",alpha=1)+
  scale_y_continuous(limits = c(-0.2, 1.5), breaks = seq(0,1.5,0.3))+
  theme_minimal()+
  theme(axis.text = element_blank(),axis.title = element_blank(),plot.margin = unit(rep(-1,6),"cm"))+
  coord_polar()+
  geom_text(data = lable_data,aes(x=id.1,y=Slope+0.05,label=Antibiotic,hjust=hjust),color="black",alpha=1,size=2.5,angle=lable_data$angle,inherit.aes = F)+
  geom_text(data = lable_data,aes(x=id.1,y=Slope-0.2,label=Slope,hjust=hjust),color="black",alpha=0.5,size=2,angle=lable_data$angle,inherit.aes = F)



library(tidyverse)
data <- data.frame(
  individual=paste("Mister ", seq(1,60), sep=""),
  group=c(rep('A', 10), rep('B', 30), rep('C', 14), rep('D', 6)) ,
  value=sample( seq(10,100), 60, replace=T)) %>%
  mutate(group=factor(group))
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 3
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
# Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 80, xend = start, yend = 80), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 40, xend = start, yend = 40), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 20, xend = start, yend = 20), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),4), y = c(20, 40, 60, 80), label = c("20", "40", "60", "80"), color="grey", size=3, angle=0, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-100,120)+
  theme_minimal()+
  theme(legend.position = "none",
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+ 
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )+
  geom_segment(data=base_data, aes(x = start, y = -5, xend = end, yend = -5), colour = "black", alpha=0.8, size=0.6 , inherit.aes = FALSE )  +
  geom_text(data=base_data, aes(x = title, y = -18, label=group), hjust=c(1,1,0,0), colour = "black", alpha=0.8, size=4, fontface="bold", inherit.aes = FALSE)
p


library(tidyverse)
data <- data.frame(
  individual=paste("Mister ", seq(1,36), sep=""),
  group=c(rep('Acinetobacter_baumannii', 5), rep('Enterobacter_aerogenes/cloacae', 5), rep('Enterococcus_faecalis', 3), rep('Enterococcus_faecium', 2),rep('Escherichia_coli', 5),rep('Klebsiella_pneumoniae', 5),rep('Pseudomonas_aeruginosa', 5),rep('Staphylococcus_aureus', 4),rep('Streptococcus_pneumoniae', 2)) ,
  value=sample( seq(0.1,2), 36, replace=T)) %>%
  mutate(group=factor(group))


#######PM2.5
data<-read.csv("Slopepm.csv",row.names = 1, sep=",")
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 2
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=1)+
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 150, xend = start, yend = 150), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 120, xend = start, yend = 120), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 90, xend = start, yend = 90), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 30, xend = start, yend = 30), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),6), y = c(0,30, 60, 90,120, 150), label = c("0","0.3", "0.6", "0.9","1.2", "1.5"), color="grey", size=3, angle=1, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-50,150)+
  theme_minimal()+
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )
p


#####Usage
data<-read.csv("Slopeusage.csv",row.names = 1, sep=",")
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 2
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=1)+
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 150, xend = start, yend = 150), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 120, xend = start, yend = 120), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 90, xend = start, yend = 90), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 30, xend = start, yend = 30), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = -30, xend = start, yend = -30), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = -60, xend = start, yend = -60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = -90, xend = start, yend = -90), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),9), y = c(-90,-60,-30,0,30, 60, 90,120, 150), label = c("-0.9","-0.6","-0.3","0", "0.3", "0.6", "0.9","1.2", "1.5"), color="grey", size=3, angle=0, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-100,150)+
  theme_minimal()+
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )
p

#####GDP
data<-read.csv("Slopegdp.csv",row.names = 1, sep=",")
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 2
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=1)+
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 150, xend = start, yend = 150), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 120, xend = start, yend = 120), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 90, xend = start, yend = 90), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 30, xend = start, yend = 30), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),6), y = c(0,30, 60, 90,120, 150), label = c("0","-0.3", "-0.6", "-0.9","-1.2", "-1.5"), color="grey", size=3, angle=0, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-50,150)+
  theme_minimal()+
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )
p


data<-read.csv("Slopeche.csv",row.names = 1, sep=",")
# Set a number of 'empty bar' to add at the end of each group
empty_bar <- 2
to_add <- data.frame(matrix(NA, empty_bar*nlevels(data$group), ncol(data)))
colnames(to_add) <- colnames(data)
to_add$group <- rep(levels(data$group), each=empty_bar)
data <- rbind(data, to_add)
data <- data %>% arrange(group)
data$id <- seq(1, nrow(data))
# Get the name and the y position of each label
label_data <- data
number_of_bar <- nrow(label_data)
angle <- 90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$hjust <- ifelse( angle < -90, 1, 0)
label_data$angle <- ifelse(angle < -90, angle+180, angle)
# prepare a data frame for base lines
base_data <- data %>% 
  group_by(group) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))
# prepare a data frame for grid (scales)
grid_data <- base_data
grid_data$end <- grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start <- grid_data$start - 1
grid_data <- grid_data[-1, ]
# Make the plot
p <- ggplot(data, aes(x=as.factor(id), y=value, fill=group))+
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=1)+
  # Add a val=100/75/50/25 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data, aes(x = end, y = 120, xend = start, yend = 120), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 90, xend = start, yend = 90), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 30, xend = start, yend = 30), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  geom_segment(data=grid_data, aes(x = end, y = 0, xend = start, yend = 0), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE )+
  annotate("text", x = rep(max(data$id),5), y = c(0,30, 60, 90,120), label = c("0","-0.3", "-0.6", "-0.9","-1.2"), color="grey", size=3, angle=0, fontface="bold", hjust=1)+  
  geom_bar(aes(x=as.factor(id), y=value, fill=group), stat="identity", alpha=0.5)+
  ylim(-50,120)+
  theme_minimal()+
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-1,4), "cm"))+
  coord_polar()+
  geom_text(data=label_data, 
            aes(x=id, y=value+10, label=individual, hjust=hjust), 
            color="black", fontface="bold",alpha=0.6, size=2.5, 
            angle= label_data$angle, inherit.aes = FALSE )
p


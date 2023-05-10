#======================================
# Analysis of population structure using snapclust
#
# European lobster (Homarus gammarus)
# 
# Tom Jenkins | t.l.jenkins@exeter.ac.uk
#
# Jenkins et al. 2019 Evolutionary Applications
# 
#======================================

## Load packages
lib = c("adegenet","ggplot2","RColorBrewer","pegas","poppr","mmod","hierfstat",
        "ggrepel","FactoMineR","maptools","mapdata","rworldmap",
        "rworldxtra","grid","scatterpie","ggalt")
lapply(lib, library, character.only=TRUE)


# ----------------- #
#
# Data import and preparation
#
# ----------------- #

## Load RData SNP dataset
load("../lobster_1278ind_79snps_40pop.RData")
data_filt
nPop(data_filt)
summary(data_filt$pop)

## Combine temporal samples (Sar13 & Sar17 and Idr16 & Idr17)
popNames(data_filt) = gsub("Sar13", "Sar", popNames(data_filt))
popNames(data_filt) = gsub("Sar17", "Sar", popNames(data_filt))
popNames(data_filt) = gsub("Idr16", "Idr", popNames(data_filt))
popNames(data_filt) = gsub("Idr17", "Idr", popNames(data_filt))


# Section 1 ---------------------------------------------------------------


# ----------------- #
#
# Snapclust using all SNPs
#
# ----------------- #

## Use AIC
# aic = snapclust.choose.k(max=20, data_filt, IC=AIC)
# save(aic, file="snapclust_aic_all.RData")
load("snapclust_aic_all.RData")
all.aic = qplot(1:20, aic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="AIC")
all.aic

## Use BIC
# bic = snapclust.choose.k(max=20, data_filt, IC=BIC)
# save(bic, file="snapclust_bic_all.RData")
load("snapclust_bic_all.RData")
all.bic = qplot(1:20, bic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="BIC")
all.bic
# dev.copy2pdf(file="snapclust_all_bic.pdf")

## Combine plots
library(cowplot)
plot_grid(all.aic, all.bic, labels=c("A","B"), nrow=2)
# ggsave(file="snapclustk_all.png", width=10, height=10, dpi=600)
# ggsave(file="snapclustk_all.pdf", width=10, height=10)


## Run Snapclust ML algorithm with K clusters
res = snapclust(data_filt, k=3)
res
names(res)


# ----------------- #
#
# Plot results using facet_wrap
#
# ----------------- #

## Convert individual probabilities to dataframe
prob = as.data.frame(res$proba)

## Add column for individual IDs
prob$ind = rownames(prob)

## Add column with pop IDs
prob$pop = data_filt$pop
unique(prob$pop)

## Convert dataframe to long format
library(reshape)
problong = melt(prob, id.vars=c("ind","pop"), value.name = "probability")

## Define order of facets using the levels argument in factor
unique(problong$pop)
site_order =  c("Tro","Ber","Flo","Gul","Kav","Lys","Sin","Hel","Oos",
                "Cro","Brd","Eye",
                "She","Ork","Heb","Sul","Cor","Hoo","Iom","Ios","Jer","Kil",
                "Loo","Lyn","Mul","Pad","Pem","Sbs","Ven",
                "Idr","Vig",
                "Sar","Laz","Tar","Ale","Sky","The","Tor")
problong$pop_ord = factor(problong$pop, levels=site_order)

## Number of Ks
numKs = length(unique(problong$variable))

## ggplot theme
ggtheme = theme(
  # axis.text.x = element_text(colour="black", size=5, angle=90),
  axis.text.x = element_blank(),
  axis.text.y = element_text(colour="black", size=6),
  axis.title = element_text(colour="black", size=15),
  axis.ticks.x = element_blank(),
  # facet labels
  strip.text = element_text(colour="black", size=15), 
  # panel.grid.minor = element_line(colour="grey90"),
  # panel.grid.major = element_line(colour="grey90"),
  # panel.border = element_rect(colour="black", fill=NA, size=0.5),
  plot.title = element_text(hjust = 0.5, size=18), # title centered
  legend.title = element_blank(),
  legend.text = element_text(size=12),
  legend.position = "top"
)

## Colour definitions: blue, green, red
cols = c("#377EB8","#7FC97F","#FC8D59","#FDB462","#E31A1C")
# blue=#377EB8, green=#7FC97F, oos=#FC8D59, orange=#FDB462, red=#E31A1C

## Labels
labs = c(" Cluster 1 "," Cluster 2 "," Cluster 3 "," Cluster 4 "," Cluster 5 ")

## Change factor levels
# problong$variable = factor(problong$variable, levels=c("3","2","1"))

## Plot barplot 
bar=ggplot(data=problong, aes(x=ind, y=value, fill=variable))+
  geom_bar(stat="identity", show.legend = T)+
  scale_y_continuous(expand=c(0,0))+
  # scale_x_discrete(labels=problong$pop)+
  facet_wrap(~pop_ord, scales="free")+
  # scale_fill_manual("Cluster", values=rainbow(length(unique(res$group))))+
  scale_fill_manual(values=cols, labels=labs)+
  ylab("Membership probability")+
  xlab("Individual")+
  ggtheme
bar
title = paste("snapclust_",nLoc(data_filt),"snps_k",numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=12, height=10, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=12, height=10)


# ----------------- #
#
# Plot averaged results on map
#
# ----------------- #

## Create average cluster memberships for each population
head(prob)
avg_mem = aggregate(prob[, 1:numKs], list(prob$pop), mean)
head(avg_mem)

## Order by population
avg_mem = avg_mem[order(as.character(avg_mem$Group.1)), ]
head(avg_mem)

## Coordinates for pie charts
coord = read.csv("coords_all.csv")
head(coord)

# Order alphabetically by population
coord_ord = coord[order(coord$Code), ] 
head(coord_ord)

## Add data to avg_mem dataframe
avg_mem$lat = coord_ord$Lat
avg_mem$lon = coord_ord$Lon
head(avg_mem)

## Labels
maplabs = c("  Cluster 1   ","  Cluster 2   "," Cluster 3   "," Cluster 4")

## Number of Ks
numKs = length(unique(problong$variable))

## Create a dataframe containing the map outlines
map = fortify(getMap(resolution = "high"))

## Colour definitions:
cols = c("#E31A1C","#7FC97F","#377EB8")
# blue=#377EB8, green=#7FC97F, oos=#FC8D59, orange=#FDB462, red=#E31A1C

## Create map
map1=ggplot() +
  geom_polygon(data=map, aes(x=long, y=lat, group=group),
               fill="grey", colour="black", size=0.5)+
  coord_fixed(ratio=1, xlim=c(-12.5,28), ylim=c(35,65), expand=F) +
  # coord_quickmap( xlim=c(-15,30),  ylim=c(35,65), expand=F) +
  geom_scatterpie(data=avg_mem, aes(x=lon, y=lat, r=1),
                  cols=names(prob[1:numKs]), color="black",
                  alpha=0.9)+
  scale_fill_manual(values=cols, labels=maplabs[1:numKs])+
  xlab("Longitude")+
  ylab("Latitude")+
  panel_border(colour="black", size=0.8, linetype = 1)+
  theme(
    axis.text = element_text(colour="black", size=12),
    axis.title = element_text(colour="black", size=14),
    panel.background = element_rect(fill="lightsteelblue2"),
    panel.grid.minor = element_line(colour="grey90", size=0.5),
    panel.grid.major = element_line(colour="grey90", size=0.5),
    plot.margin = margin(t = 2, r = 8, b = 2, l = 2, unit = "pt"),
    legend.text = element_text(size=12),
    legend.title = element_blank(),
    legend.key.size = unit(0.7, "cm"),
    # legend.spacing.x = unit(1.0, 'cm'),
    legend.position = "top",
    legend.direction = "horizontal",
    legend.justification="center",
  )
map1
title = paste("snapclust_", nLoc(data_filt), "snps_map_k", numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=10, height=8, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=10, height=8)


# Section 2 ---------------------------------------------------------------


# ----------------- #
#
# Snapclust using outlier SNPs
#
# ----------------- #

## Create outlier Genind dataset
outliers = c("11291","15581","32358","42395","53935","58053",
             "65064","65576")
data.outlier = data_filt[loc=outliers]
data.outlier

## Use AIC
# aic = snapclust.choose.k(max=20, data.outlier, IC=AIC)
# save(aic, file="snapclust_aic_out.RData")
load("snapclust_aic_out.RData")
out.aic = qplot(1:20, aic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="AIC")
out.aic

## Use BIC
# bic = snapclust.choose.k(max=20, data.outlier, IC=BIC)
# save(bic, file="snapclust_bic_out.RData")
load("snapclust_bic_out.RData")
out.bic = qplot(1:20, bic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="BIC")
out.bic

## Combine plots
library(cowplot)
plot_grid(out.aic, out.bic, labels=c("C","D"), nrow=2)
# ggsave(file="snapclustk_out.png", width=10, height=10, dpi=600)
# ggsave(file="snapclustk_out.pdf", width=10, height=10)


## Run Snapclust ML algorithm with K clusters
res = snapclust(data.outlier, k=3)
res
names(res)


# ----------------- #
#
# Plot results using facet_wrap
#
# ----------------- #

## Convert individual probabilities to dataframe
prob = as.data.frame(res$proba)

## Add column for individual IDs
prob$ind = rownames(prob)

## Add column with pop IDs
prob$pop = data.outlier$pop
unique(prob$pop)

## Convert dataframe to long format
library(reshape)
problong = melt(prob, id.vars=c("ind","pop"), value.name = "probability")

## Define order of facets using the levels argument in factor
unique(problong$pop)
site_order =  c("Tro","Ber","Flo","Gul","Kav","Lys","Sin","Hel","Oos",
                "Cro","Brd","Eye",
                "She","Ork","Heb","Sul","Cor","Hoo","Iom","Ios","Jer","Kil",
                "Loo","Lyn","Mul","Pad","Pem","Sbs","Ven",
                "Idr","Vig",
                "Sar","Laz","Tar","Ale","Sky","The","Tor")
problong$pop_ord = factor(problong$pop, levels=site_order)

## Number of Ks
numKs = length(unique(problong$variable))

## ggplot theme
ggtheme = theme(
  # axis.text.x = element_text(colour="black", size=5, angle=90),
  axis.text.x = element_blank(),
  axis.text.y = element_text(colour="black", size=6),
  axis.title = element_text(colour="black", size=15),
  axis.ticks.x = element_blank(),
  # facet labels
  strip.text = element_text(colour="black", size=15), 
  # panel.grid.minor = element_line(colour="grey90"),
  # panel.grid.major = element_line(colour="grey90"),
  # panel.border = element_rect(colour="black", fill=NA, size=0.5),
  plot.title = element_text(hjust = 0.5, size=18), # title centered
  legend.title = element_blank(),
  legend.text = element_text(size=12),
  legend.position = "top"
)

## Colour definitions
cols = c("#FDB462","#7FC97F","#377EB8","#E31A1C","yellow")

## Labels
labs = c(" Cluster 1 "," Cluster 2 "," Cluster 3 "," Cluster 4 "," Cluster 5 ")

## Plot barplot 
bar=ggplot(data=problong, aes(x=ind, y=value, fill=variable))+
  geom_bar(stat="identity", show.legend = F)+
  scale_y_continuous(expand=c(0,0))+
  # scale_x_discrete(labels=problong$pop)+
  facet_wrap(~pop_ord, scales="free")+
  # scale_fill_manual("Cluster", values=rainbow(length(unique(res$group))))+
  scale_fill_manual(values=cols, labels=labs)+
  ylab("Membership probability")+
  xlab("Individual")+
  ggtheme
bar
title = paste("snapclust_",nLoc(data.outlier),"snps_k",numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=12, height=10, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=12, height=10)


# ----------------- #
#
# Plot averaged results on map
#
# ----------------- #

## Create average cluster memberships for each population
head(prob)
avg_mem = aggregate(prob[, 1:numKs], list(prob$pop), mean)
head(avg_mem)

## Order by population
avg_mem = avg_mem[order(as.character(avg_mem$Group.1)), ]
head(avg_mem)

## Coordinates for pie charts
coord = read.csv("coords_all.csv")
head(coord)

# Order alphabetically by population
coord_ord = coord[order(coord$Code), ] 
head(coord_ord)

## Add data to avg_mem dataframe
avg_mem$lat = coord_ord$Lat
avg_mem$lon = coord_ord$Lon
head(avg_mem)

## Labels
maplabs = c("  Cluster 1   ","  Cluster 2   "," Cluster 3   "," Cluster 4")

## Number of Ks
numKs = length(unique(problong$variable))

## Create a dataframe containing the map outlines
map = fortify(getMap(resolution = "high"))

## Colour definitions:
cols = c("#E31A1C","#377EB8","#7FC97F")
# blue=#377EB8, green=#7FC97F, oos=#FC8D59, orange=#FDB462, red=#E31A1C

## Plot map
map2=ggplot() +
  geom_polygon(data=map, aes(x=long, y=lat, group=group),
               fill="grey", colour="black", size=0.5)+
  coord_fixed(ratio=1, xlim=c(-12.5,28), ylim=c(35,65), expand=F) +
  # coord_quickmap( xlim=c(-15,30),  ylim=c(35,65), expand=F) +
  scale_fill_manual(values=cols, labels=maplabs)+
  geom_scatterpie(data=avg_mem, aes(x=lon, y=lat, r=1),
                  cols=names(prob[1:numKs]), color="black",
                  alpha=0.9)+
  panel_border(colour="black", size=0.8, linetype = 1)+
  xlab("Longitude")+
  ylab("Latitude")+
  theme(
    axis.text = element_text(colour="black", size=12),
    axis.title = element_text(colour="black", size=14),
    panel.background = element_rect(fill="lightsteelblue2"),
    panel.grid.minor = element_line(colour="grey90", size=0.5),
    panel.grid.major = element_line(colour="grey90", size=0.5),
    plot.margin = margin(t = 2, r = 8, b = 2, l = 2, unit = "pt"),
    legend.text = element_text(size=12),
    legend.title = element_blank(),
    legend.key.size = unit(0.7, "cm"),
    # legend.spacing.x = unit(1.0, 'cm'),
    legend.position = "top",
    legend.direction = "horizontal",
    legend.justification="center",
    panel.border = element_rect(fill=NA, color="black", size=1)
  )
map2
title = paste("snapclust_", nLoc(data.outlier), "snps_map_k", numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=10, height=8, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=10, height=8)


# Section 3 ---------------------------------------------------------------


# ----------------- #
#
# Snapclust using neutral SNPs
#
# ----------------- #

## Create neutral Genind dataset
neutral = setdiff(locNames(data_filt), outliers)
data.neutral = data_filt[loc=neutral]
data.neutral

## Use AIC
# aic = snapclust.choose.k(max=20, data.neutral, IC=AIC)
# save(aic, file="snapclust_aic_neu.RData")
load("snapclust_aic_neu.RData")
neu.aic = qplot(1:20, aic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="AIC")
neu.aic

## Use BIC
# bic = snapclust.choose.k(max=20, data.neutral, IC=BIC)
# save(bic, file="snapclust_bic_neu.RData")
load("snapclust_bic_neu.RData")
neu.bic = qplot(1:20, bic, geom=c("point","line"),
                xlab="Number of clusters (k)", ylab="BIC")
neu.bic

## Combine plots
library(cowplot)
plot_grid(neu.aic, neu.bic, labels=c("E","F"), nrow=2)
# ggsave(file="snapclustk_neu.png", width=10, height=10, dpi=600)
# ggsave(file="snapclustk_neu.pdf", width=10, height=10)


## Run Snapclust ML algorithm with K clusters
res = snapclust(data.neutral, k=4)
res
names(res)


# ----------------- #
#
# Plot results using facet_wrap
#
# ----------------- #

## Convert individual probabilities to dataframe
prob = as.data.frame(res$proba)

## Add column for individual IDs
prob$ind = rownames(prob)

## Add column with pop IDs
prob$pop = data.neutral$pop
unique(prob$pop)

## Convert dataframe to long format
library(reshape)
problong = melt(prob, id.vars=c("ind","pop"), value.name = "probability")

## Define order of facets using the levels argument in factor
unique(problong$pop)
site_order =  c("Tro","Ber","Flo","Gul","Kav","Lys","Sin","Hel","Oos",
                "Cro","Brd","Eye",
                "She","Ork","Heb","Sul","Cor","Hoo","Iom","Ios","Jer","Kil",
                "Loo","Lyn","Mul","Pad","Pem","Sbs","Ven",
                "Idr","Vig",
                "Sar","Laz","Tar","Ale","Sky","The","Tor")
problong$pop_ord = factor(problong$pop, levels=site_order)

## Number of Ks
numKs = length(unique(problong$variable))

## ggplot theme
ggtheme = theme(
  # axis.text.x = element_text(colour="black", size=5, angle=90),
  axis.text.x = element_blank(),
  axis.text.y = element_text(colour="black", size=6),
  axis.title = element_text(colour="black", size=15),
  axis.ticks.x = element_blank(),
  # facet labels
  strip.text = element_text(colour="black", size=15), 
  # panel.grid.minor = element_line(colour="grey90"),
  # panel.grid.major = element_line(colour="grey90"),
  # panel.border = element_rect(colour="black", fill=NA, size=0.5),
  plot.title = element_text(hjust = 0.5, size=18), # title centered
  legend.title = element_blank(),
  legend.text = element_text(size=12),
  legend.position = "top"
)

## Colour definitions
# cols = c("#E31A1C","#7FC97F","#377EB8")
# cols = c("#FDB462","#377EB8","#E31A1C","yellow")
cols = c("#E31A1C","#FDB462","#7FC97F","#377EB8")

## Labels
labs = c(" Cluster 1 "," Cluster 2 "," Cluster 3 "," Cluster 4 "," Cluster 5 ")

## Change factor levels
# problong$variable = factor(problong$variable, levels=c("5","4","3","2","1"))

## Plot barplot 
bar=ggplot(data=problong, aes(x=ind, y=value, fill=variable))+
  geom_bar(stat="identity", show.legend = T)+
  scale_y_continuous(expand=c(0,0))+
  # scale_x_discrete(labels=problong$pop)+
  facet_wrap(~pop_ord, scales="free")+
  # scale_fill_manual("Cluster", values=rainbow(length(unique(res$group))))+
  scale_fill_manual(values=cols, labels=labs)+
  ylab("Membership probability")+
  xlab("Individual")+
  ggtheme
bar
title = paste("snapclust_",nLoc(data.neutral),"snps_k",numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=12, height=10, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=12, height=10)


# ----------------- #
#
# Plot averaged results on map
#
# ----------------- #

## Create average cluster memberships for each population
head(prob)
avg_mem = aggregate(prob[, 1:numKs], list(prob$pop), mean)
head(avg_mem)

## Order by population
avg_mem = avg_mem[order(as.character(avg_mem$Group.1)), ]
head(avg_mem)

## Coordinates for pie charts
coord = read.csv("coords_all.csv")
head(coord)

# Order alphabetically by population
coord_ord = coord[order(coord$Code), ] 
head(coord_ord)

## Add data to avg_mem dataframe
avg_mem$lat = coord_ord$Lat
avg_mem$lon = coord_ord$Lon
head(avg_mem)

## Labels
maplabs = c("  Cluster 1   ","  Cluster 2   "," Cluster 3   "," Cluster 4")

## Number of Ks
numKs = length(unique(problong$variable))

## Create a dataframe containing the map outlines
map = fortify(getMap(resolution = "high"))

## Colour definitions:
cols = c("#E31A1C","#FDB462","#7FC97F","#377EB8")
# blue=#377EB8, green=#7FC97F, oos=#FC8D59, orange=#FDB462, red=#E31A1C

## Plot map
map3=ggplot() +
  geom_polygon(data=map, aes(x=long, y=lat, group=group),
               fill="grey", colour="black", size=0.5)+
  coord_fixed(ratio=1, xlim=c(-12.5,28), ylim=c(35,65), expand=F) +
  # coord_quickmap( xlim=c(-15,30),  ylim=c(35,65), expand=F) +
  scale_fill_manual(values=cols, labels=maplabs)+
  geom_scatterpie(data=avg_mem, aes(x=lon, y=lat, r=1),
                  cols=names(prob[1:numKs]), color="black",
                  alpha=0.9)+
  xlab("Longitude")+
  ylab("Latitude")+
  panel_border(colour="black", size=0.8, linetype = 1)+
  theme(
    axis.text = element_text(colour="black", size=12),
    axis.title = element_text(colour="black", size=14),
    panel.background = element_rect(fill="lightsteelblue2"),
    panel.grid.minor = element_line(colour="grey90", size=0.5),
    panel.grid.major = element_line(colour="grey90", size=0.5),
    plot.margin = margin(t = 2, r = 8, b = 2, l = 2, unit = "pt"),
    legend.text = element_text(size=12),
    legend.title = element_blank(),
    legend.key.size = unit(0.7, "cm"),
    legend.position = "top",
    legend.direction = "horizontal",
    legend.justification="center"
  )
map3
title = paste("snapclust_", nLoc(data.neutral), "snps_map_k", numKs, sep="")
title
# ggsave(paste(title,".png",sep=""), width=10, height=8, dpi=600)
# ggsave(paste(title,".pdf",sep=""), width=10, height=8)


# Section 4 ---------------------------------------------------------------


# ----------------- #
#
# Random map with correct legend order
#
# ----------------- #

## Colour definitions
cols = c("#377EB8","#7FC97F","#E31A1C","#FDB462")
# blue=#377EB8, green=#7FC97F, oos=#FC8D59, orange=#FDB462, red=#E31A1C

## Plot random map
map4=ggplot() +
  geom_polygon(data=map, aes(x=long, y=lat, group=group),
               fill="grey", colour="black", size=0.5)+
  coord_fixed(ratio=1, xlim=c(-12.5,28), ylim=c(35,65), expand=F) +
  scale_fill_manual(values=cols, labels=maplabs)+
  geom_scatterpie(data=avg_mem, aes(x=lon, y=lat, r=1),
                  cols=names(prob[1:numKs]), color="black",
                  alpha=0.9)
map4

# ----------------- #
#
# Combine plots the using cowplot package
#
# ----------------- #

## Add new theme to plots
ggtheme1 = theme(axis.text = element_text(colour="black", size=12),
                axis.title = element_text(colour="black", size=14),
                panel.background = element_rect(fill="lightsteelblue2"),
                # panel.border = element_rect(linetype="solid", fill=NA,
                #                             size=0.5),
                panel.grid.minor = element_line(colour="grey90", size=0.5),
                panel.grid.major = element_line(colour="grey90", size=0.5),
                plot.margin = margin(t = 5, r = 2, b = 2, l = 2, unit = "pt"),
                legend.position = "none"
)

## Extract legend from one of the ggplots
mylegend = get_legend(map4 +
                        theme(legend.direction = "horizontal",
                              legend.justification="center",
                              legend.text = element_text(size=15),
                              legend.key.size = unit(0.7,"cm"),
                              legend.key = element_rect(size = 1),
                              legend.box.spacing = unit(0, "cm"),
                              legend.title = element_blank()
                        )
)

## Combine plots
library(cowplot)
plot_grid(map1 + ggtheme1,
          map2 + ggtheme1,
          map3 + ggtheme1,
          mylegend,
          labels = c("A","B","C",""),
          ncol = 2, nrow=2)
# ggsave(file="snapclust_combined.png", width=13, height=10, dpi=900)
# ggsave(file="snapclust_combined.pdf", width=13, height=10)




# ----------------- #
#
# Oosterschelde
#
# ----------------- #

## Create Atlantic only dataset with 65 SNPs
atl.pops = c("Brd","Cor","Cro","Eye","Heb","Hel","Hoo","Idr","Iom","Ios",
             "Jer","Kil","Loo","Lyn","Mul","Oos","Ork","Pad","Pem",
             "Sbs","She","Sul","Ven","Vig","Tro","Ber","Flo","Sin","Gul",
             "Lys","Kav")
data.oos = data.neutral[pop=atl.pops]
data.oos

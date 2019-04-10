#load the packages

library(ggplot2)
library(reshape2)
library(MASS)
library(rms)
library(ggrastr)
library(effsize)
library(VennDiagram)


#get data in there
da <- read.table("lost_genes_wormbase_boeck.tsv", sep="\t", header=T)

#get log2(dpcm + 1) for all transcriptional things....

da_2 <- lapply(da[,c(12:45)], function(dat) {((log(dat + 1,2)))})

da_3 <- cbind(da[,c(1,3:11)],da_2)

##LDA
#all caenorhabditis

all_caeno.lda <- lda(da_3$all_lost ~ da_3$domain + da_3$life_stage + da_3$phenotype + da_3$reference_count + da_3$tissue + da_3$interaction + da_3$EMB_0 + da_3$X4_cell + da_3$EMB_30 + da_3$EMB_60 + da_3$EMB_90 + da_3$EMB_120 + da_3$EMB_150 + da_3$EMB_180 + da_3$EMB_210 + da_3$EMB_240 + da_3$EMB_270 + da_3$EMB_300 + da_3$EMB_330 + da_3$EMB_360 + da_3$EMB_390 + da_3$EMB_420 + da_3$EMB_450 + da_3$EMB_480 + da_3$EMB_510 + da_3$EMB_540 + da_3$EMB_570 + da_3$EMB_600 + da_3$L1 + da_3$L2 + da_3$L3 + da_3$L4_her + da_3$young_adult_her + da_3$old_adult_her + da_3$male + da_3$adult_soma_her + da_3$adult_gonad_her + da_3$dauer_entry + da_3$dauer + da_3$dauer_exit)

all_caeno.lda

#re-project predicted values onto data

da_3$all_caeno_lda_predict <- predict(all_caeno.lda, da_3)$x

#functions for analyzing LDA from Avril Coghlan "A Little Book of R For Multivariate Analysis" 2017

#get means of LD1 by group

#lost genes

mean(da_3[da_3$all_lost == 1,]$all_caeno_lda_predict)

#retained genes

mean(da_3[da_3$all_lost == 0,]$all_caeno_lda_predict)



#determine allocation rule or midpoint between two means, see Coghlan 2017

allocation_cutoff <- ((mean(da_3[da_3$all_lost == 1,]$all_caeno_lda_predict)+mean(da_3[da_3$all_lost == 0,]$all_caeno_lda_predict))/2)

#allocation rule accuracy function, see Coghlan 2017

calcAllocationRuleAccuracy <- function(ldavalue, groupvariable, cutoffpoints)
  {
     # find out how many values the group variable can take
     groupvariable2 <- as.factor(groupvariable[[1]])
     levels <- levels(groupvariable2)
     numlevels <- length(levels)
     # calculate the number of true positives and false negatives for each group
     numlevels <- length(levels)
     for (i in 1:numlevels)
     {
        leveli <- levels[i]
        levelidata <- ldavalue[groupvariable==leveli]
        # see how many of the samples from this group are classified in each group
        for (j in 1:numlevels)
        {
           levelj <- levels[j]
           if (j == 1)
           {
              cutoff1 <- cutoffpoints[1]
              cutoff2 <- "NA"
              results <- summary(levelidata <= cutoff1)
           }
           else if (j == numlevels)
           {
              cutoff1 <- cutoffpoints[(numlevels-1)]
              cutoff2 <- "NA"
              results <- summary(levelidata > cutoff1)
           }
           else
           {
              cutoff1 <- cutoffpoints[(j-1)]
              cutoff2 <- cutoffpoints[(j)]
              results <- summary(levelidata > cutoff1 & levelidata <= cutoff2)
           }
           trues <- results["TRUE"]
           trues <- trues[[1]]
           print(paste("Number of samples of group",leveli,"classified as group",levelj," : ",
              trues,"(cutoffs:",cutoff1,",",cutoff2,")"))
        }
     }
  }

#as factors...
da_3$all_lost_factor <- as.factor(da_3$all_lost)
da_3$elegans_lost_factor <- as.factor(da_3$elegans_lost)
da_3$sp34_lost_factor <- as.factor(da_3$sp34_lost)

#classify predictions

calcAllocationRuleAccuracy(da_3$all_caeno_lda_predict,da_3$all_lost_factor,allocation_cutoff)

  #Correctly predicts loss or retention 55% ((10048+791)/length(da_3$all_caeno_lda_predict)) of the time.

#manova

all_caeno.man <-  manova(cbind(da_3$domain , da_3$life_stage , da_3$phenotype , da_3$reference_count , da_3$tissue , da_3$interaction , da_3$EMB_0 , da_3$X4_cell , da_3$EMB_30 , da_3$EMB_60 , da_3$EMB_90 , da_3$EMB_120 , da_3$EMB_150 , da_3$EMB_180 , da_3$EMB_210 , da_3$EMB_240 , da_3$EMB_270 , da_3$EMB_300 , da_3$EMB_330 , da_3$EMB_360 , da_3$EMB_390 , da_3$EMB_420 , da_3$EMB_450 , da_3$EMB_480 , da_3$EMB_510 , da_3$EMB_540 , da_3$EMB_570 , da_3$EMB_600 , da_3$L1 , da_3$L2 , da_3$L3 , da_3$L4_her , da_3$young_adult_her , da_3$old_adult_her , da_3$male , da_3$adult_soma_her , da_3$adult_gonad_her , da_3$dauer_entry , da_3$dauer , da_3$dauer_exit) ~ da_3$all_lost)

summary(all_caeno.man)

summary.aov(all_caeno.man)

#make plot

ggplot(da_3, aes(all_caeno_lda_predict, fill = all_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ld_plot <- ggplot(da_3, aes(all_caeno_lda_predict, fill = all_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ggsave("lda_all_caeno.pdf", width=4, height=3, units = "in", useDingbats=FALSE)
print(ld_plot)
dev.off



#LDA elegans group
elegans_group.lda <- lda(da_3$elegans_lost ~ da_3$domain + da_3$life_stage + da_3$phenotype + da_3$reference_count + da_3$tissue + da_3$interaction + da_3$EMB_0 + da_3$X4_cell + da_3$EMB_30 + da_3$EMB_60 + da_3$EMB_90 + da_3$EMB_120 + da_3$EMB_150 + da_3$EMB_180 + da_3$EMB_210 + da_3$EMB_240 + da_3$EMB_270 + da_3$EMB_300 + da_3$EMB_330 + da_3$EMB_360 + da_3$EMB_390 + da_3$EMB_420 + da_3$EMB_450 + da_3$EMB_480 + da_3$EMB_510 + da_3$EMB_540 + da_3$EMB_570 + da_3$EMB_600 + da_3$L1 + da_3$L2 + da_3$L3 + da_3$L4_her + da_3$young_adult_her + da_3$old_adult_her + da_3$male + da_3$adult_soma_her + da_3$adult_gonad_her + da_3$dauer_entry + da_3$dauer + da_3$dauer_exit)

elegans_group.lda

#re-project predicted values onto data

da_3$elegans_group_lda_predict <- predict(elegans_group.lda, da_3)$x


#get means of LD1 by group

	#lost genes

mean(da_3[da_3$elegans_lost == 1,]$elegans_group_lda_predict)

	#retained genes

mean(da_3[da_3$elegans_lost == 0,]$elegans_group_lda_predict)

#determine allocation rule or midpoint between two means, see Coghlan 2017

allocation_cutoff <- ((mean(da_3[da_3$elegans_lost == 1,]$elegans_group_lda_predict)+mean(da_3[da_3$elegans_lost == 0,]$elegans_group_lda_predict))/2)

#how good are the predictions?

calcAllocationRuleAccuracy(da_3$elegans_group_lda_predict,da_3$elegans_lost_factor,allocation_cutoff)

  #Correctly predicts loss or retention 55% ((10094+802)/length(da_3$elegans_group_lda_predict)) of the time.

#manova

elegans_group.man <-  manova(cbind(da_3$domain , da_3$life_stage , da_3$phenotype , da_3$reference_count , da_3$tissue , da_3$interaction , da_3$EMB_0 , da_3$X4_cell , da_3$EMB_30 , da_3$EMB_60 , da_3$EMB_90 , da_3$EMB_120 , da_3$EMB_150 , da_3$EMB_180 , da_3$EMB_210 , da_3$EMB_240 , da_3$EMB_270 , da_3$EMB_300 , da_3$EMB_330 , da_3$EMB_360 , da_3$EMB_390 , da_3$EMB_420 , da_3$EMB_450 , da_3$EMB_480 , da_3$EMB_510 , da_3$EMB_540 , da_3$EMB_570 , da_3$EMB_600 , da_3$L1 , da_3$L2 , da_3$L3 , da_3$L4_her , da_3$young_adult_her , da_3$old_adult_her , da_3$male , da_3$adult_soma_her , da_3$adult_gonad_her , da_3$dauer_entry , da_3$dauer , da_3$dauer_exit) ~ da_3$elegans_lost)

elegans_group.man

summary(elegans_group.man)

summary.aov(elegans_group.man)

#make plot

ggplot(da_3, aes(elegans_group_lda_predict, fill = elegans_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ld_plot <- ggplot(da_3, aes(elegans_group_lda_predict, fill = elegans_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ggsave("lda_elegans_group.pdf", width=4, height=3, units = "in", useDingbats=FALSE)
print(ld_plot)
dev.off

#LDA lost only in inopinata

sp34_lost.lda <- lda(da_3$sp34_lost ~ da_3$domain + da_3$life_stage + da_3$phenotype + da_3$reference_count + da_3$tissue + da_3$interaction + da_3$EMB_0 + da_3$X4_cell + da_3$EMB_30 + da_3$EMB_60 + da_3$EMB_90 + da_3$EMB_120 + da_3$EMB_150 + da_3$EMB_180 + da_3$EMB_210 + da_3$EMB_240 + da_3$EMB_270 + da_3$EMB_300 + da_3$EMB_330 + da_3$EMB_360 + da_3$EMB_390 + da_3$EMB_420 + da_3$EMB_450 + da_3$EMB_480 + da_3$EMB_510 + da_3$EMB_540 + da_3$EMB_570 + da_3$EMB_600 + da_3$L1 + da_3$L2 + da_3$L3 + da_3$L4_her + da_3$young_adult_her + da_3$old_adult_her + da_3$male + da_3$adult_soma_her + da_3$adult_gonad_her + da_3$dauer_entry + da_3$dauer + da_3$dauer_exit)

sp34_lost.lda

#re-project predicted values onto data

da_3$sp34_lost_lda_predict <- predict(sp34_lost.lda, da_3)$x


#get means of LD1 by group

	#lost genes

mean(da_3[da_3$sp34_lost == 1,]$sp34_lost_lda_predict)

	#retained genes

mean(da_3[da_3$sp34_lost == 0,]$sp34_lost_lda_predict)

#determine allocation rule or midpoint between two means, see Coghlan 2017

allocation_cutoff <- ((mean(da_3[da_3$sp34_lost == 1,]$sp34_lost_lda_predict)+mean(da_3[da_3$sp34_lost == 0,]$sp34_lost_lda_predict))/2)

#how good are the predictions?

calcAllocationRuleAccuracy(da_3$sp34_lost_lda_predict,da_3$sp34_lost_factor,allocation_cutoff)

#Correctly predicts loss or retention 71% ((13670+305)/length(da_3$sp34_lost_lda_predict)) of the time.
	#calls false losses 28% of the time (5618/length(da_3$sp34_lost_lda_predict)).

#manova

sp34_lost.man <-  manova(cbind(da_3$domain , da_3$life_stage , da_3$phenotype , da_3$reference_count , da_3$tissue , da_3$interaction , da_3$EMB_0 , da_3$X4_cell , da_3$EMB_30 , da_3$EMB_60 , da_3$EMB_90 , da_3$EMB_120 , da_3$EMB_150 , da_3$EMB_180 , da_3$EMB_210 , da_3$EMB_240 , da_3$EMB_270 , da_3$EMB_300 , da_3$EMB_330 , da_3$EMB_360 , da_3$EMB_390 , da_3$EMB_420 , da_3$EMB_450 , da_3$EMB_480 , da_3$EMB_510 , da_3$EMB_540 , da_3$EMB_570 , da_3$EMB_600 , da_3$L1 , da_3$L2 , da_3$L3 , da_3$L4_her , da_3$young_adult_her , da_3$old_adult_her , da_3$male , da_3$adult_soma_her , da_3$adult_gonad_her , da_3$dauer_entry , da_3$dauer , da_3$dauer_exit) ~ da_3$sp34_lost)

sp34_lost.man

summary(sp34_lost.man)

summary.aov(sp34_lost.man)

ggplot(da_3, aes(sp34_lost_lda_predict, fill = sp34_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ld_plot <- ggplot(da_3, aes(sp34_lost_lda_predict, fill = sp34_lost_factor)) + geom_density(alpha = 0.2, weight=0.5) + scale_fill_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16),legend.position="none") + xlab("LD1") + ylab("Density")

ggsave("lda_sp34_lost.pdf", width=4, height=3, units = "in", useDingbats=FALSE)
print(ld_plot)
dev.off


##PCA


#standardize variables

da_scaled <- as.data.frame(scale(da_3[5:44]))

#PCA

da_pca <- prcomp(da_scaled)

summary(da_pca)

#variance explained
sum((da_pca$sdev)^2)


#loadings of first principal component...

da_pca$rotation[,1]

summary(da_pca$rotation[,1])

#second principal component...

da_pca$rotation[,2]

summary(da_pca$rotation[,2])

#get pca ready for plotting...

pca_gg<-data.frame(da_pca$x,all_lost=da_3$all_lost_factor,elegans_lost=da_3$elegans_lost_factor,sp34_lost=da_3$sp34_lost_factor)

#plots

pca_plot <- ggplot(pca_gg, aes(x=PC1,y=PC2)) + geom_point_rast(aes(colour=all_lost), alpha=0.3,size=0.25) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16), legend.position="none") + xlab("PC1(72.3%)") + ylab("PC2(7.2%)")

ggsave("pca_all_caeno_lost.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(pca_plot)
dev.off

pca_plot <- ggplot(pca_gg, aes(x=PC1,y=PC2)) + geom_point_rast(aes(colour=elegans_lost), alpha=0.3,size=0.25) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16), legend.position="none") + xlab("PC1(72.3%)") + ylab("PC2(7.2%)")

ggsave("pca_elegans_lost.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(pca_plot)
dev.off

pca_plot <- ggplot(pca_gg, aes(x=PC1,y=PC2)) + geom_point_rast(aes(colour=sp34_lost), alpha=0.3,size=0.25) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16), legend.position="none") + xlab("PC1(72.3%)") + ylab("PC2(7.2%)")

ggsave("pca_sp34_lost.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(pca_plot)
dev.off


#multiple logistic regression

#all caeno

all_caeno.lrm <- lrm(all_lost ~ domain + life_stage + phenotype + reference_count + tissue + interaction + EMB_0 + X4_cell + EMB_30 + EMB_60 + EMB_90 + EMB_120 + EMB_150 + EMB_180 + EMB_210 + EMB_240 + EMB_270 + EMB_300 + EMB_330 + EMB_360 + EMB_390 + EMB_420 + EMB_450 + EMB_480 + EMB_510 + EMB_540 + EMB_570 + EMB_600 + L1 + L2 + L3 + L4_her + young_adult_her + old_adult_her + male + adult_soma_her + adult_gonad_her + dauer_entry + dauer + dauer_exit, data=da_3)

all_caeno.lrm

#elegans group

elegans_group.lrm <- lrm(elegans_lost ~ domain + life_stage + phenotype + reference_count + tissue + interaction + EMB_0 + X4_cell + EMB_30 + EMB_60 + EMB_90 + EMB_120 + EMB_150 + EMB_180 + EMB_210 + EMB_240 + EMB_270 + EMB_300 + EMB_330 + EMB_360 + EMB_390 + EMB_420 + EMB_450 + EMB_480 + EMB_510 + EMB_540 + EMB_570 + EMB_600 + L1 + L2 + L3 + L4_her + young_adult_her + old_adult_her + male + adult_soma_her + adult_gonad_her + dauer_entry + dauer + dauer_exit, data=da_3)

elegans_group.lrm

#inopinata only

sp34_lost.lrm <- lrm(sp34_lost ~ domain + life_stage + phenotype + reference_count + tissue + interaction + EMB_0 + X4_cell + EMB_30 + EMB_60 + EMB_90 + EMB_120 + EMB_150 + EMB_180 + EMB_210 + EMB_240 + EMB_270 + EMB_300 + EMB_330 + EMB_360 + EMB_390 + EMB_420 + EMB_450 + EMB_480 + EMB_510 + EMB_540 + EMB_570 + EMB_600 + L1 + L2 + L3 + L4_her + young_adult_her + old_adult_her + male + adult_soma_her + adult_gonad_her + dauer_entry + dauer + dauer_exit, data=da_3)

sp34_lost.lrm

#mann-whitney u tests

	#all caenorhabditis p

sapply(names(da_3[,c(5:44)]), function(x){wilcox.test(da_3[da_3$all_lost==0, x], da_3[da_3$all_lost==1, x], exact = FALSE)$p.value})

	#all caenorhabditis w
sapply(names(da_3[,c(5:44)]), function(x){wilcox.test(da_3[da_3$all_lost==0, x], da_3[da_3$all_lost==1, x], exact = FALSE)$statistic})

	#elegans group p

sapply(names(da_3[,c(5:44)]), function(x){wilcox.test(da_3[da_3$elegans_lost==0, x], da_3[da_3$elegans_lost==1, x], exact = FALSE)$p.value})
	#elegans group w

sapply(names(da_3[,c(5:44)]), function(x){wilcox.test(da_3[da_3$elegans_lost==0, x], da_3[da_3$elegans_lost==1, x], exact = FALSE)$statistic})

	#sp34 loss p

sapply(names(da_3[,c(5:44)]), function(x){wilcox.test(da_3[da_3$sp34_lost==0, x], da_3[da_3$sp34_lost==1, x], exact = FALSE)$p.value})



#effect sizes
	#all caeno
sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$all_lost==1, x],da_3[da_3$all_lost==0, x])$estimate})

	#elegans group
sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$elegans_lost==1, x],da_3[da_3$elegans_lost==0, x])$estimate})


	#sp34 loss
sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$sp34_lost==1, x], da_3[da_3$sp34_lost==0, x])$estimate})



#prep data frames for plotting effect sizes, Figure 4

all_df <-NULL
all_df$categories <- names(da_3[,c(5:44)])
all_df <- as.data.frame(all_df)
all_df$effsize <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$all_lost==1, x],da_3[da_3$all_lost==0, x])$estimate})
all_df$effsize.lower <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$all_lost==1, x],da_3[da_3$all_lost==0, x])$conf.int[1]})
all_df$effsize.upper <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$all_lost==1, x],da_3[da_3$all_lost==0, x])$conf.int[2]})
all_df$phylogenetic_scope <- rep("all Caenorhabditis",40)

elegans_df <-NULL
elegans_df$categories <- names(da_3[,c(5:44)])
elegans_df <- as.data.frame(elegans_df)
elegans_df$effsize <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$elegans_lost==1, x],da_3[da_3$elegans_lost==0, x])$estimate})
elegans_df$effsize.lower <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$elegans_lost==1, x],da_3[da_3$elegans_lost==0, x])$conf.int[1]})
elegans_df$effsize.upper <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$elegans_lost==1, x],da_3[da_3$elegans_lost==0, x])$conf.int[2]})
elegans_df$phylogenetic_scope <- rep("Elegans group",40)

sp34_df <-NULL
sp34_df$categories <- names(da_3[,c(5:44)])
sp34_df <- as.data.frame(elegans_df)
sp34_df$effsize <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$sp34_lost==1, x],da_3[da_3$sp34_lost==0, x])$estimate})
sp34_df$effsize.lower <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$sp34_lost==1, x],da_3[da_3$sp34_lost==0, x])$conf.int[1]})
sp34_df$effsize.upper <- sapply(names(da_3[,c(5:44)]), function(x){cohen.d(da_3[da_3$sp34_lost==1, x],da_3[da_3$sp34_lost==0, x])$conf.int[2]})
sp34_df$phylogenetic_scope <- rep("inopinata only",40)


es_df <- rbind(all_df,elegans_df,sp34_df)

#set aside by wormbase categories, embryonic, and postembryonic transcripts

es_df_wb <- es_df[es_df$categories == "domain" | es_df$categories == "life_stage" | es_df$categories == "phenotype" | es_df$categories == "reference_count" |es_df$categories ==  "tissue" |es_df$categories ==  "interaction",]

es_df_embryonic <- es_df[es_df$categories == "EMB_0" | es_df$categories == "X4_cell" | es_df$categories == "EMB_30" | es_df$categories == "EMB_60" | es_df$categories == "EMB_90" | es_df$categories == "EMB_120" | es_df$categories == "EMB_150" | es_df$categories == "EMB_180" | es_df$categories == "EMB_210" | es_df$categories == "EMB_240" | es_df$categories == "EMB_270" | es_df$categories == "EMB_300" | es_df$categories == "EMB_330" | es_df$categories == "EMB_360" | es_df$categories == "EMB_390" | es_df$categories == "EMB_420" | es_df$categories == "EMB_450" | es_df$categories == "EMB_480" | es_df$categories == "EMB_510" | es_df$categories == "EMB_540" | es_df$categories == "EMB_570" | es_df$categories == "EMB_600",]

es_df_postembryonic <- es_df[es_df$categories == "L1" | es_df$categories == "L2" | es_df$categories == "L3" | es_df$categories == "L4_her" | es_df$categories == "young_adult_her" | es_df$categories == "old_adult_her" | es_df$categories == "male" | es_df$categories == "adult_soma_her" | es_df$categories == "adult_gonad_her" | es_df$categories == "dauer_entry" | es_df$categories == "dauer" | es_df$categories == "dauer_exit",]

#get factor levels right

es_df_wb$categories <- factor(es_df_wb$categories, levels = c("domain", "interaction", "life_stage", "tissue", "phenotype", "reference_count"))

es_df_embryonic$categories <- factor(es_df_embryonic$categories, levels = c("EMB_0", "X4_cell", "EMB_30", "EMB_60", "EMB_90", "EMB_120", "EMB_150", "EMB_180", "EMB_210", "EMB_240", "EMB_270", "EMB_300", "EMB_330", "EMB_360", "EMB_390", "EMB_420", "EMB_450", "EMB_480", "EMB_510", "EMB_540", "EMB_570", "EMB_600"))

es_df_postembryonic$categories <- factor(es_df_postembryonic$categories, levels = c("L1", "L2", "L3", "L4_her", "young_adult_her", "old_adult_her",  "adult_soma_her", "adult_gonad_her","male", "dauer_entry", "dauer", "dauer_exit"))

es_df_wb$phylogenetic_scope <- factor(es_df_wb$phylogenetic_scope, levels = c("all Caenorhabditis","Elegans group","inopinata only"))
es_df_embryonic$phylogenetic_scope <- factor(es_df_embryonic$phylogenetic_scope, levels = c("all Caenorhabditis","Elegans group","inopinata only"))
es_df_postembryonic$phylogenetic_scope <- factor(es_df_postembryonic$phylogenetic_scope, levels = c("all Caenorhabditis","Elegans group","inopinata only"))




#get labels


embryo_order <- c("0","4 cell", "30", "60", "90","120","150","180", "210","240","270","300","330","360", "390","420","450","480","510","540","570","600")
postembryonic_order <- c("L1","L2","L3","L4","Young Adult","Old Adult","Soma","Gonad","Male","Dauer Entry","Dauer","Dauer Exit")
wb_category_order <- c("Domains", "Interactions", "Life stages", "Phenotypes", "Reference count", "Tissues")

all_caeno_category <- expression(paste("All ", italic("Caenorhabditis")))

elegans_group_category <- expression(paste(italic("Elegans"), " group"))

sp_34_category <- expression(paste(italic("C. inopinata")))

scope_order <- c(all_caeno_category, elegans_group_category, sp_34_category)


#make the plots

a <- ggplot(es_df_embryonic, aes(x=categories, y=effsize, colour=phylogenetic_scope)) + geom_hline(yintercept=0, linetype="dashed") + geom_errorbar(aes(ymin=effsize.lower, ymax=effsize.upper),position = position_dodge(width = 0.7), size=0.3) + geom_point(position = position_dodge(width = 0.7),size=1) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=8), axis.text.y = element_text(colour="black", size=8),axis.title=element_text(size=10,face="bold"),legend.position="none", axis.ticks = element_line(size = 1)) + xlab("Embryonic stage (min)") + ylab("Effect size of gene loss") + scale_x_discrete(labels=embryo_order) + scale_y_continuous(limits = c(-1,1),breaks = c(-1,-0.5,0,0.5,1))


ggsave("loss_retained_transcript_effect_size_embryonic.pdf", width=6, height=3, units = "in", useDingbats=FALSE)
print(a)
dev.off





a <- ggplot(es_df_postembryonic, aes(x=categories, y=effsize, colour=phylogenetic_scope)) + geom_hline(yintercept=0, linetype="dashed") + geom_errorbar(aes(ymin=effsize.lower, ymax=effsize.upper),position = position_dodge(width = 0.7), size=0.3) + geom_point(position = position_dodge(width = 0.7),size=1) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=8, angle = 45, hjust = 1), axis.text.y = element_text(colour="black", size=8),axis.title=element_text(size=10,face="bold"),legend.position="none", axis.ticks = element_line(size = 1)) + xlab("Postmbryonic stage/tissue") + ylab("Effect size of gene loss") + scale_x_discrete(labels=postembryonic_order) + scale_y_continuous(limits = c(-1,1),breaks = c(-1,-0.5,0,0.5,1))


ggsave("loss_retained_transcript_effect_size_postembryonic.pdf", width=6, height=3, units = "in", useDingbats=FALSE)
print(a)
dev.off




a <- ggplot(es_df_wb, aes(x=categories, y=effsize, colour=phylogenetic_scope)) + geom_hline(yintercept=0, linetype="dashed") + geom_errorbar(aes(ymin=effsize.lower, ymax=effsize.upper),position = position_dodge(width = 0.7), size=0.3) + geom_point(position = position_dodge(width = 0.7),size=1) + scale_colour_brewer(palette="Set1") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=8), axis.text.y = element_text(colour="black", size=8),axis.title=element_text(size=10,face="bold"),legend.position="none", axis.ticks = element_line(size = 1)) + xlab("WormBase category") + ylab("Effect size of gene loss") + scale_x_discrete(labels=wb_category_order) + scale_y_continuous(limits = c(-1,1),breaks = c(-1,-0.5,0,0.5,1))


ggsave("loss_retained_transcript_effect_size_wormbase.pdf", width=6, height=3, units = "in", useDingbats=FALSE)
print(a)
dev.off



#venn diagram for comparing all caeno losses with elegans group losses


venn.plot <- draw.pairwise.venn(1406, 1427, 330, category = c("All Caenorhabditis", "Elegans group"), lty = rep("blank", 
    2), fill = c("light blue", "pink"), alpha = rep(0.5, 2), cat.pos = c(0, 
    0), cat.dist = rep(0.025, 2), scaled = FALSE)

tiff(filename = "all_caeno_elegans_group_venn_diagram.tiff", compression = "lzw");
grid.draw(venn.plot)
dev.off()

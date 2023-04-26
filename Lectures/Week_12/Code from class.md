# Code from Selection

create environment

`mamba create -n week7 ddocent vcflib=1.0.3`

`mamba activate week7`

## Calling SNPs
Create working directory and link to the data

```bash
mkdir week12ds
cd week12ds
ln -s /home/BIO594/DATA/Week7/example/*.fq.gz .
```

Start dDocent

`dDocent`

Use these settings:
```
Number of Processors
20
Maximum Memory
0
Trimming
yes
Assembly?
yes
Type_of_Assembly
PE
Clustering_Similarity%
0.9
Mapping_Reads?
yes
Mapping_Match_Value
1
Mapping_MisMatch_Value
4
Mapping_GapOpen_Penalty
6
Calling_SNPs?
yes
Email
jpuritz@gmail.com
```

Use `5` for K1 and `3` for K2 during assembly

When finished, start filtering SNPs.  **I won't comment this code as it is all review**

## SNP Filtering
```
mkdir Filter
cd Filter/
ln -s ../TotalRawSNPs.vcf .
vcftools --vcf TotalRawSNPs.vcf --max-missing 0.5 --maf 0.001 --minQ 20 --recode --recode-INFO-all --out TRS
```
Output should resemble:
```
VCFtools - 0.1.14
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf TotalRawSNPs.vcf
        --recode-INFO-all
        --maf 0.001
        --minQ 20
        --max-missing 0.5
        --out TRS
        --recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 3142 out of a possible 3268 Sites
Run Time = 4.00 seconds
```

Command:
```
vcftools --vcf TRS.recode.vcf --minDP 5 --recode --recode-INFO-all --out TRSdp5
```

Output:
```
VCFtools - 0.1.14
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf TRS.recode.vcf
        --recode-INFO-all
        --minDP 5
        --out TRSdp5
        --recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 3142 out of a possible 3142 Sites
Run Time = 3.00 seconds
```

Command:
```
pop_missing_filter.sh TRSdp5.recode.vcf ../popmap 0.05 1 TRSdp5p05
```

Output:
```
After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 2948 out of a possible 3142 Sites
Run Time = 3.00 seconds
```

Command:
```
dDocent_filters TRSdp5p05.recode.vcf TRSdp5p05
```

Partial Output:

```
                                            Histogram of mean depth per site

  250 +-+-+---+---+---+---+---+---+--+---+---+---+---+---+---+---+---+---+---+---+---+---+--+---+---+---+---+---+-+-+
      +   +   +   +   +   +   +   +  +   +   +   +   +   +   +   +   +   +   +   +   +   +  +   +   +   +   +   +   +
      |                                      *            'meandepthpersite' using (bin($1,binwidth)):(1.0) ******* |
      |                                     ***                                                                     |
      |                                     ***                                                                     |
  200 +-+                                  ****                                                                   +-+
      |                                    ****                                                                     |
      |                                   *****                                                                     |
      |                                   *****                                                                     |
  150 +-+                                *******                                                                  +-+
      |                                  *******                                                                    |
      |                                  *******                                                                    |
      |                                  ********                                                                   |
      |                                  ********                                                                   |
  100 +-+                                ********                                                                 +-+
      |                                  ********                                                                   |
      |                                  ********                                                                   |
      |                                **********                                                                   |
   50 +-+                              **********                                                                 +-+
      |                               ************                                                                  |
      |                              **************                                                                 |
      |                              ***************                                                                |
      +   +   +   +   +   +   +   +  ****************+   +   +   +   +   +   +   +   +   +  +   +   +   +   +   +   +
    0 +-+-+---+---+---+---+---+---+********************--+---+---+---+---+---+---+---+---+--+---+---+---+---+---+-+-+
      10  15  20  25  30  35  40  45 50  55  60  65  70  75  80  85  90  95 100 105 110 11 120 125 130 135 140 145 150
                                                        Mean Depth

If distrubtion looks normal, a 1.645 sigma cutoff (~90% of the data) would be 5156.132535
The 95% cutoff would be 63
Would you like to use a different maximum mean depth cutoff than 63, yes or no
yes
Please enter new cutoff
75
Number of sites filtered based on maximum mean depth
 0 of 2472 

Number of sites filtered based on within locus depth mismatch
 0 of 2250 

Total number of sites filtered
 698 of 2948 

Remaining sites
 2250 


Filtered VCF file is called Output_prefix.FIL.recode.vcf

Filter stats stored in TRSdp5p05.filterstats
```

Commands:
```
vcfallelicprimitives -k -g TRSdp5p05.FIL.recode.vcf |sed 's:\.|\.:\.\/\.:g' > TRSdp5p05F.prim
vcftools --vcf TRSdp5p05F.prim --recode --recode-INFO-all --remove-indels --out SNP.TRSdp5p05F
```
Output:
```
After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1888 out of a possible 2431 Sites
Run Time = 0.00 seconds
```

Command:
```
filter_hwe_by_pop.pl -v SNP.TRSdp5p05F.recode.vcf -p ../popmap -c 0.5 -out SNP.TRSdp5p05FHWE
```
Output:
```
Processing population: PopA (20 inds)
Processing population: PopB (20 inds)
Processing population: PopC (20 inds)
Processing population: PopD (20 inds)
Outputting results of HWE test for filtered loci to 'filtered.hwe'
Kept 1888 of a possible 1888 loci (filtered 0 loci)

```
Command:
```
vcftools --vcf SNP.TRSdp5p05FHWE.recode.vcf --maf 0.05 --recode --recode-INFO-all --out SNP.TRSdp5p05FHWEmaf05
```
Output:
```
VCFtools - 0.1.14
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf SNP.TRSdp5p05FHWE.recode.vcf
        --recode-INFO-all
        --maf 0.05
        --out SNP.TRSdp5p05FHWEmaf05
        --recode

After filtering, kept 925 out of a possible 1888 Sites
Run Time = 0.00 seconds
```

## Converting from VCF to other outputs

Copy a PGDspider configuration file and file to map individuals to population
```
cp /home/BIO594/DATA/Week7/example/BSsnp.spid .
ln -s ../popmap .
mamba install pgdspider
```
Now, run PGDspider
```
PGDSpider2-cli -inputfile SNP.TRSdp5p05FHWEmaf05.recode.vcf -outputfile SNP.TRSdp5p05FHWEBS -spid BSsnp.spid
```
Output:
```
WARN  15:46:52 - PGDSpider configuration file not found! Loading default configuration.                   │
initialize convert process...                                                                             │
read input file...                                                                                        │
read input file done.                                                                                     │
write output file...                                                                                      │
write output file done.
```
## Outlier Detection

### Run BayeScan

To learn more about BayeScan [LINK](http://cmpg.unibe.ch/software/BayeScan/)
```
BayeScan2.1_linux64bits SNP.TRSdp5p05FHWEBS -nbp 30 -thin 20
```
Copy R source file
```
cp /home/BIO594/DATA/Week7/example/plot_R.r .
```

### Open Rstudio 
```
source("plot_R.r")
plot_bayescan("SNP.TRSdp5p05FH_fst.txt")
```

## More outlier Detection

For all other analyses, we need to limit SNPs to only those with two alleles:

```
vcftools --vcf SNP.TRSdp5p05FHWEmaf05.recode.vcf --max-alleles 2 --recode --recode-INFO-all --out SNP.TRSdp5p05FHWE2A
```

## PCAdapt

This program runs entirely in R and has excellent [documentation](https://bcm-uga.github.io/pcadapt/)


### Open Rstudio 

R code:
```R
#Load pcadapt library
library(pcadapt)

#load our VCF file into R
filename <- read.pcadapt("SNP.TRSdp5p05FHWE2A.recode.vcf", type = "vcf" )

#Create first PCA
x <- pcadapt(input = filename, K = 20)

#Plot the likelihoods
plot(x, option = "screeplot")
#Plot Plot the likelihoods for only first 10 K
plot(x, option = "screeplot", K = 10)

#Create population designations
poplist.names <- c(rep("POPA", 20),rep("POPB", 20),rep("POPC", 20), rep("POPD",20))

#Plot the actual PCA (first two PCAs)
plot(x, option = "scores", pop = poplist.names)
#Plot PCA with PCA 2 and PCA 3
plot(x, option = "scores", i = 2, j = 3, pop = poplist.names)
#Plot PCA with PCA 3 and PCA 4
plot(x, option = "scores", i = 3, j = 4, pop = poplist.names)

#Redo PCA with only 3 K
x <- pcadapt(filename, K = 3)

summary(x)

#Start looking for outliers
#Make Manhattan Plot
plot(x , option = "manhattan")
#Make qqplot
plot(x, option = "qqplot", threshold = 0.1)
# Look at P-value distribution
plot(x, option = "stat.distribution")

# Set FDR
library(qvalue)
qval <- qvalue(x$pvalues)$qvalues
alpha <- 0.1

# Save outliers
outliers <- which(qval < alpha)


# Testing for library effects

poplist.names <- c(rep("LIB1", 40),rep("LIB2", 40))
x <- pcadapt(input = filename, K = 20)

plot(x, option = "scores", pop = poplist.names)
plot(x, option = "scores", i = 2, j = 3, pop = poplist.names)



x <- pcadapt(filename, K = 2)

summary(x)

plot(x , option = "manhattan")
plot(x, option = "qqplot", threshold = 0.1)

plot(x, option = "stat.distribution")

library(qvalue)
qval <- qvalue(x$pvalues)$qvalues
alpha <- 0.1
outliers <- which(qval < alpha)
```

## R code for running Outflank
See documentation [here](https://github.com/whitlock/OutFLANK)

```
R
```

```R
library(OutFLANK)  # outflank package
library(vcfR)
library(bigsnpr)   # package for LD pruning

my_vcf <- read.vcfR("SNP.TRSdp5p05FHWE2A.recode.vcf")

geno <- extract.gt(my_vcf) # Character matrix containing the genotypes
position <- getPOS(my_vcf) # Positions in bp
chromosome <- getCHROM(my_vcf) # Chromosome information

G <- matrix(NA, nrow = nrow(geno), ncol = ncol(geno))

G[geno %in% c("0/0", "0|0")] <- 0
G[geno  %in% c("0/1", "1/0", "1|0", "0|1")] <- 1
G[geno %in% c("1/1", "1|1")] <- 2

G[is.na(G)] <- 9

head(G[,1:10])

pop <- read.table("~/week7/popmap", header=FALSE)
pop <- pop$V2


my_fst <- MakeDiploidFSTMat(t(G), locusNames = paste0(chromosome,"_", position), popNames = pop)

my_dist <- OutFLANK(my_fst, NumberOfSamples = 4, qthreshold=0.1, RightTrimFraction=0.1, LeftTrimFraction=0.1)


OutFLANKResultsPlotter(my_dist)

plot(my_dist$results$FST, col=as.numeric(as.factor(chromosome)))


my_dist$results[which(my_dist$results$OutlierFlag == TRUE),]
```

## BayEnv2

[Documentation](https://bitbucket.org/tguenther/bayenv2_public/src)

First, convert vcf to BayEnv input
```
cp /home/BIO594/DATA/Week7/example/SNPBayEnv.spid .
cp /home/BIO594/DATA/Week7/example/environ .
PGDSpider2-cli -inputfile SNP.TRSdp5p05FHWE2A.recode.vcf -outputfile SNP.TRSdp5p05FHWEBayEnv.txt -spid SNPBayEnv.spid
```

```
WARN  22:05:19 - PGDSpider configuration file not found! Loading default configuration.
initialize convert process...
read input file...
read input file done.
write output file...
write output file done.
```

Run BayEnv to generate the covariance matrix

`bayenv2 -i SNP.TRSdp5p05FHWEBayEnv.txt -p 4 -k 100000 -r 63479 > matrix.out`

This code generates 100,000 iterations.  We only need the last one.

`tail -5 matrix.out | head -4 > matrix`

With the matrix we will use our environmental factor file:

`cat environ`

```
-0.888330138    -0.565300997    0.080757285     1.37287385
-0.565300997    -0.484543712    -0.565300997    -0.403786427
```

The environmental file are standardized environmental data with each line representing an environemtal factor with the value for each population tab delimited.  This dummy file has 2 variables for 4 populations

Next, we calculate the Bayes Factor for each SNP for each environmental variable:

```
ln -s /usr/local/bin/bayenv2 .
calc_bf.sh SNP.TRSdp5p05FHWEBayEnv.txt environ matrix 4 10000 2
```

Next, we convert the output into something suitable to input into R
```
paste <(seq 1 923) <(cut -f2,3 bf_environ.environ ) > bayenv.out
cat <(echo -e "Locus\tBF1\tBF2") bayenv.out > bayenv.final
```

Now, open R

`R`

```
table_bay <- read.table("bayenv.final",header=TRUE)
plot(table_bay$BF1)

table_bay[which(table_bay$BF1 > 100),]
```


# Code from Population Structure


First, remember to create a week8 directory and copy the data

```bash
mkdir week12ps
cd week12ps
cp /home/BIO594/DATA/Week8/* .
```

Now, open RStudio

All R code from this point on...

```R
library(adegenet)
library(vcfR)


my_vcf <- read.vcfR("SNPs.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

#Test Population Structure
library("hierfstat")
fstat(my_genind)

matFst <- pairwise.fst(my_genind)



#PCA

X <- tab(my_genind, freq = TRUE, NA.method = "mean")
pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
barplot(pca1$eig[1:50], main = "PCA eigenvalues", col = heat.colors(50))
s.class(pca1$li, pop(my_genind))
title("PCA of simulated dataset\naxes 1-2")
add.scatter.eig(pca1$eig[1:20], 3,1,2)

col <- funky(15)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)


#Missing Data
my_vcf <- read.vcfR("SNP.missing.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

X <- tab(my_genind, freq = TRUE, NA.method = "mean")
pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)



my_vcf <- read.vcfR("SNP.missing2.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

X <- tab(my_genind, freq = TRUE, NA.method = "mean")
pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)


my_vcf <- read.vcfR("SNP.missingPopD2.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

X <- tab(my_genind, freq = TRUE, NA.method = "mean")
pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)

# Related


my_vcf <- read.vcfR("SNP.related.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

X <- tab(my_genind, freq = TRUE, NA.method = "mean")
pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)



# Isolation by distance
my_vcf <- read.vcfR("SNPs.vcf")


my_genind <- vcfR2genind(my_vcf)


strata<- read.table("strata", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

xy <-read.table("dist.mat")
xy
my_genind@other$xy <- xy


toto <- genind2genpop(my_genind)
Dgeo <- dist(my_genind$other$xy)
Dgen <- dist.genpop(toto,method=2)
ibd <- mantel.randtest(Dgen,Dgeo)

plot(ibd)
plot(Dgeo, Dgen)
abline(lm(Dgen~Dgeo), col="red",lty=2)


#DAPC

grp <- find.clusters(my_genind, max.n.clust=40)
table(pop(my_genind), grp$grp)

table.value(table(pop(my_genind), grp$grp), col.lab=paste("inf", 1:2), row.lab=paste("ori", 1:4))


dapc1 <- dapc(my_genind, grp$grp)
scatter(dapc1,col=col,bg="white", solid=1)



contrib <- loadingplot(dapc1$var.contr, axis=1, thres=.01, lab.jitter=1)
contrib


setPop(my_genind) <- ~Library

dapc1 <- dapc(my_genind, pop(my_genind))
contrib <- loadingplot(dapc1$var.contr, axis=1, thres=.05, lab.jitter=1)




#Structure Like


compoplot(dapc1, posi="bottomright",txt.leg=paste("Cluster", 1:6), lab="", ncol=1, xlab="individuals")

temp <- which(apply(dapc1$posterior,1, function(e) all(e<0.9)))

compoplot(dapc1, subset=temp, posi="bottomright", txt.leg=paste("Cluster", 1:4), ncol=2)


```


## How do I filter outlier loci out to create a neutral VCF file?

See code below [here](https://github.com/amyzyck/RADseq_Uca-rapax_2016/blob/master/Scripts/OutlierDetection/OutlierDetection_UcaRapax.md#combine-all-outlier-loci-into-one-file)

Many different ways to do this though!!!

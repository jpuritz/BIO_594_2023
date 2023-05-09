# Assignment due on 4/26/2022


# Part 1: Simulated Data

  * Run at least two outlier detection programs
    * Generate a VCF file with only neutral SNPs  
  * Run at least one PCA and one DAPC with the neutral data
  * Perform at least two analyses from Silliman et al


### Create environment
```bash
mkdir Week12
mamba create -n Week12 ddocent
mamba activate Week12
mamba init
mamba activate Week12

cd Week12
```

## "Filter the SNPs (you actually did this last week)"

### Copying filtered SNPs from last week

```bash
cp ../Week11/SNP.DP3g95p5maf05.HWE.recode.vcf  .
```

## "Run at least two outlier detection programs"

### Converting from VCF to other outputs

Copy a PGDspider configuration file and file to map individuals to population

```bash
cp /home/BIO594/DATA/Week7/example/BSsnp.spid .
ln -s ../Week11/popmap .
mamba install pgdspider
```

Now, run PGDspider
```bash
PGDSpider2-cli -inputfile SNP.DP3g95p5maf05.HWE.recode.vcf -outputfile BS_input -spid BSsnp.spid
```

Output file is called: BS_input

### Outlier Detection method 1: Run BayeScan

```bash
BayeScan2.1_linux64bits BS_input -nbp 30 -thin 20
```

Copy source file

```bash
cp /home/BIO594/DATA/Week7/example/plot_R.r .
```

Rstudio 

```R
setwd("~/Week12")
source("plot_R.r")
plot_bayescan("BS_input_fst.txt")
```

Bayesscan found 5 outliers: 

[1] 179 307 308 671 672


![BayesScan.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/BayesScan.png?raw=true)

### Outlier Detection method 2: PCAadapt

For all other analyses, we need to limit SNPs to only those with two alleles:

```bash
vcftools --vcf SNP.DP3g95p5maf05.HWE.recode.vcf --max-alleles 2 --recode --recode-INFO-all --out SNP.DP3g95p5maf05_vcftoolsOD
```

Output: SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf

#### PCAdapt in Rstudio

R code:
```R
#set working directory
setwd("~/Week12")

#Load pcadapt library
library(pcadapt)

#load our VCF file into R
filename <- read.pcadapt("SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf", type = "vcf" )
```

Output:

100 variant(s) have been discarded as they are not SNPs.
Summary:

	- input file:				SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf
	- output file:				/tmp/RtmpPObkQ2/filea1506bf99787.pcadapt

	- number of individuals detected:	80
	- number of loci detected:		974

874 lines detected.
80 columns detected.

```R
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
```

running with K = 3 
```R
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
outliers
```

Outliers: 152 & 153

```R
# Testing for library effects

poplist.names <- c(rep("LIB1", 40),rep("LIB2", 40))
x <- pcadapt(input = filename, K = 20)

plot(x, option = "scores", pop = poplist.names)
plot(x, option = "scores", i = 2, j = 3, pop = poplist.names)
```

running with K = 2 
```R
x <- pcadapt(filename, K = 2)

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

outliers
```

Outliers: 8, 152, 153

### Outlier Detection method 3: BayEnv2

First, convert vcf to BayEnv input

```bash
cp /home/BIO594/DATA/Week7/example/SNPBayEnv.spid .
cp /home/BIO594/DATA/Week7/example/environ .
PGDSpider2-cli -inputfile SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf -outputfile SNP.BayEnv.txt -spid SNPBayEnv.spid
```

output: SNP.BayEnv.txt

Run BayEnv to generate the covariance matrix

`bayenv2 -i SNP.BayEnv.txt -p 4 -k 100000 -r 63479 > matrix.out`

This code generates 100,000 iterations.  We only need the last one.

`tail -5 matrix.out | head -4 > matrix`

With the matrix we will use our environmental factor file:

`cat environ`

Next, we calculate the Bayes Factor for each SNP for each environmental variable:

```
ln -s /usr/local/bin/bayenv2 .
calc_bf.sh SNP.BayEnv.txt environ matrix 4 10000 2
```

Next, we convert the output into something suitable to input into R
```
paste <(seq 1 974) <(cut -f2,3 bf_environ.environ ) > bayenv.out
cat <(echo -e "Locus\tBF1\tBF2") bayenv.out > bayenv.final
```

In R:

```R
table_bay <- read.table("bayenv.final",header=TRUE)
plot(table_bay$BF1)

table_bay[which(table_bay$BF1 > 100),]
```

  Locus    BF1     BF2
305   305 172.59 0.47304
667   667 477.73 0.63856
668   668 563.73 1.67150

####  PCAadapt, BayeScan, and BayEnv2 summary of results.

BayeScan: 179, 307, 308, 671, 672

PCAadapt (K=3): 152, 153

PCAadapt (K=2): 8, 152, 153

BayEnv2: 305, 667, 668

The programs identified very different individuals as outliers.

Make file called all.outliers, with one line per outlier from the list above

```bash
nano all.outliers
cat all.outliers
```

179
307
308
671
672
152
153
8
305
667
668

We have 11 outliers total.

Match outliers to the lines in the SNP file (based off of Amy's code [here](https://github.com/amyzyck/RADseq_Uca-rapax_2016/blob/master/Scripts/OutlierDetection/OutlierDetection_UcaRapax.md#combine-all-outlier-loci-into-one-file))

```bash
mawk '!/#/' SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf | cut -f1,2 > totalloci
NUM=(`cat totalloci | wc -l`)

cat all.outliers | parallel "grep -w ^{} loci.plus.index" | cut -f2,3> outlier.loci.txt
```

## Generate a VCF file with only neutral SNPs  

based on code below "Combine all outlier loci into one file" [here](https://github.com/amyzyck/RADseq_Uca-rapax_2016/blob/master/Scripts/OutlierDetection/OutlierDetection_UcaRapax.md#combine-all-outlier-loci-into-one-file)

```bash
vcftools --vcf SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf --exclude-positions outlier.loci.txt --recode-INFO-all --out neutralloci --recode
```

After filtering, kept 963 out of a possible 974 Sites.

Yay, the 11 outliers were successfully removed.

From now on we will work with the file "neutralloci.recode.vcf"

## Run at least one PCA and one DAPC with the neutral data

Get strata (LibraryInfo) and dist.mat files:

```
cp /home/BIO594/Exercises/Week_12/simulated/LibraryInfo .

cp /home/BIO594/DATA/Week8/dist.mat .
```

In R:

```R
setwd("~/Week12")
library(adegenet)
library(vcfR)


my_vcf <- read.vcfR("neutralloci.recode.vcf")


my_genind <- vcfR2genind(my_vcf)

strata<- read.table("LibraryInfo", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

#Test Population Structure
library("hierfstat")
#fstat(my_genind)
fstatic <- genind2hierfstat(my_genind)

#matFst <- pairwise.fst(my_genind)

matFst <- pairwise.neifst(fstatic)
matFst_WC <- pairwise.WCfst(fstatic)
```

Both pairwise tests gave the same result, so I will continue on with the result "matFst" using the Nei version.

```R
#PCA

X <- tab(my_genind, freq = TRUE, NA.method = "mean")

pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
barplot(pca1$eig[1:50], main = "PCA eigenvalues", col = heat.colors(50))
s.class(pca1$li, pop(my_genind))
title("PCA of simulated dataset\naxes 1-2")
add.scatter.eig(pca1$eig[1:20], 3,1,2)

col <- funky(15)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)
```

![PopStruct_2.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/PopStruct_2.png?raw=true)


```R
# Isolation by distance
my_vcf <- read.vcfR("neutralloci.recode.vcf")

my_genind <- vcfR2genind(my_vcf)

strata<- read.table("LibraryInfo", header=TRUE)
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
```

```R
#DAPC

grp <- find.clusters(my_genind, max.n.clust=40)
```

retained 2 PCs and 6 clusters

```R
table(pop(my_genind), grp$grp)

table.value(table(pop(my_genind), grp$grp), col.lab=paste("inf", 1:2), row.lab=paste("ori", 1:4))

dapc1 <- dapc(my_genind, grp$grp)
```

retained 2 PCs and 2  discriminant functions 

```R
scatter(dapc1,col=col,bg="white", solid=1)

contrib <- loadingplot(dapc1$var.contr, axis=1, thres=.01, lab.jitter=1)
contrib
```

![PopStruct_4.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/PopStruct_4.png?raw=true)

![PopStruct_5.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/PopStruct_5.png?raw=true)

``R
setPop(my_genind) <- ~Library

dapc2 <- dapc(my_genind, pop(my_genind))
```

retained 2 PCs and 1  discriminant functions 

```R
scatter(dapc2,col=col,bg="white", solid=1)

contrib <- loadingplot(dapc2$var.contr, axis=1, thres=.05, lab.jitter=1)
```


```R
#Structure Like

compoplot(dapc1, posi="bottomright",txt.leg=paste("Cluster", 1:6), lab="", ncol=1, xlab="individuals")

temp <- which(apply(dapc1$posterior,1, function(e) all(e<0.9)))

compoplot(dapc1, subset=temp, posi="bottomright", txt.leg=paste("Cluster", 1:4), ncol=2)
```

![PopStruct_9.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/PopStruct_9.png?raw=true)

![PopStruct_10.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/simulated/PopStruct_10.png?raw=true)

## Perform at least two analyses from Silliman et al

### Will come back to this...



# Part 1: Real Data
* For the realdata
  * Run BayeScan
  * Run BayEnv
  * Run at least one PCA and one DAPC using outlier free data set
  * Perform at least two analyses from Silliman et al	

## Load environment and copy over data
```bash
mamba activate Week12

cd Week12

mkdir real_data
cd real_data

cp /home/BIO594/Exercises/Week_12/realdata/* .

ls
```

### Converting from VCF to other outputs

Copy a PGDspider configuration file and file to map individuals to population

Run PGDspider
```bash
PGDSpider2-cli -inputfile SNP.DP3g98maf01_85INDoutFIL.NO2a.HWE.FIL.recode.vcf -outputfile BS_input -spid BSsnp.spid
```

Output file is called: BS_input

## Run BayeScan

```bash
BayeScan2.1_linux64bits BS_input -nbp 30 -thin 20
```

Here as of 12PM May 7

Copy source file

```bash
cp /home/BIO594/DATA/Week7/example/plot_R.r .
```

Rstudio 

```R
setwd("~/Week12/real_data")
source("../plot_R.r")
plot_bayescan("BS_input_fst.txt")
```

Bayesscan found no outliers.


![BayesScan.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/BayesScan.png?raw=true)

## Run BayEnv

First, convert vcf to BayEnv input

```bash
PGDSpider2-cli -inputfile SNP.DP3g98maf01_85INDoutFIL.NO2a.HWE.FIL.recode.vcf -outputfile SNP.BayEnv.txt -spid SNPBayEnv.spid
```

output: SNP.BayEnv.txt

Run BayEnv to generate the covariance matrix


determine number of populations

`cut popmap -f 2 | uniq | wc -l`

16 populations 

`bayenv2 -i SNP.BayEnv.txt -p 16 -k 100000 -r 63479 > matrix.out`

This code generates 100,000 iterations.  We only need the last one.

`tail -17 matrix.out | head -16 > matrix`

With the matrix we will use our environmental factor file:

`cat environ`

Next, we calculate the Bayes Factor for each SNP for each environmental variable:

```
ln -s /usr/local/bin/bayenv2 .
calc_bf.sh SNP.BayEnv.txt environ matrix 16 10000 2
```

Next, we convert the output into something suitable to input into R

```
cat bf_environ.environ | wc -l
```

7302 lines

```
paste <(seq 1 7302) <(cut -f2,3 bf_environ.environ ) > bayenv.out
cat <(echo -e "Locus\tBF1\tBF2") bayenv.out > bayenv.final
```

In R:

```R
setwd("~/Week12/real_data")
table_bay <- read.table("bayenv.final",header=TRUE)
plot(table_bay$BF1)

table_bay[which(table_bay$BF1 > 100),]
```

No outliers.

Instead of making a new VCF file with only neutral SNPs, I am continuing on with the original filtered VCF file above since both BayEnv and BayesScan did not detect any outliers. Keeping 7302/7302 SNPs.

## Run at least one PCA and one DAPC using outlier free data set

In R:

```R
setwd("~/Week12/real_data")
library(adegenet)
library(vcfR)

my_vcf <- read.vcfR("SNP.DP3g98maf01_85INDoutFIL.NO2a.HWE.FIL.recode.vcf")
```

Scanning file to determine attributes.
File attributes:
  meta lines: 64
  header_line: 65
  variant count: 7303
  column count: 393
Meta line 64 read in.
All meta lines processed.
gt matrix initialized.
Character matrix gt created.
  Character matrix gt rows: 7303
  Character matrix gt cols: 393
  skip: 0
  nrows: 7303
  row_num: 0
Processed variant: 7303
All variants processed

```R
my_genind <- vcfR2genind(my_vcf)

strata<- read.table("LibraryInfo", header=TRUE)
strata_df <- data.frame(strata)
strata(my_genind) <- strata_df

setPop(my_genind) <- ~Population

#Test Population Structure
library("hierfstat")
fstatic <- genind2hierfstat(my_genind)

matFst <- pairwise.neifst(fstatic)

#PCA

X <- tab(my_genind, freq = TRUE, NA.method = "mean")

pca1 <- dudi.pca(X, scale = FALSE, scannf = FALSE, nf = 3)
barplot(pca1$eig[1:50], main = "PCA eigenvalues", col = heat.colors(50))
s.class(pca1$li, pop(my_genind))
title("PCA of real dataset axes 1-2")
add.scatter.eig(pca1$eig[1:20], 3,1,2)

col <- funky(15)
s.class(pca1$li, pop(my_genind),xax=1,yax=2, col=col, axesell=FALSE, cstar=0, cpoint=3, grid=FALSE)
```

![PopStruct_2.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_2.png?raw=true)


#### 3 clusters 

```R
#DAPC

grp <- find.clusters(my_genind, max.n.clust=40)
```

retained 300 PCs and 3 clusters

```R
table(pop(my_genind), grp$grp)

table.value(table(pop(my_genind), grp$grp), col.lab=paste("inf", 1:3), row.lab=paste("ori", 1:16))

dapc1 <- dapc(my_genind, grp$grp)
```

retained 300 PCs and 2 discriminant functions 

```R
scatter(dapc1,col=col,bg="white", solid=1)

contrib <- loadingplot(dapc1$var.contr, axis=1, thres=.01, lab.jitter=1)
contrib
```

![PopStruct_4.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_4.png?raw=true)

![PopStruct_5.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_5.png?raw=true)

```R
#Structure Like

compoplot(dapc1, posi="bottomright",txt.leg=paste("Cluster", 1:3), lab="", ncol=1, xlab="individuals")
```

![PopStruct_9.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_9.png?raw=true)

#### 5 clusters:

```R
#DAPC

grp <- find.clusters(my_genind, max.n.clust=40)
```

retained 300 PCs and 5 clusters

```R
setPop(my_genind) <- ~Population
table(pop(my_genind), grp$grp)

table.value(table(pop(my_genind), grp$grp), col.lab=paste("inf", 1:5), row.lab=paste("ori", 1:16))

dapc1 <- dapc(my_genind, grp$grp)
```

retained 300 PCs and 4 discriminant functions 

```R
scatter(dapc1,col=col,bg="white", solid=1)

contrib <- loadingplot(dapc1$var.contr, axis=1, thres=.01, lab.jitter=1)
contrib
```

![PopStruct_10.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_10.png?raw=true)

![PopStruct_11.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_11.png?raw=true)

```R
#Structure Like

compoplot(dapc1, posi="bottomright",txt.leg=paste("Cluster", 1:5), lab="", ncol=1, xlab="individuals")
```

![PopStruct_12.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_12.png?raw=true)


#### Library effects

``R
setPop(my_genind) <- ~Library

dapc2 <- dapc(my_genind, pop(my_genind))
```

retained 300 PCs and 2  discriminant functions 

```R
scatter(dapc2,col=col,bg="white", solid=1)

contrib <- loadingplot(dapc2$var.contr, axis=1, thres=.05, lab.jitter=1)

```
![PopStruct_7.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/realdata/PopStruct_7.png?raw=true)



## Perform at least two analyses from Silliman et al	


# Part 2

* Repeat the redundancy analysis documented [here](https://github.com/Tom-Jenkins/seascape_rda_tutorial)

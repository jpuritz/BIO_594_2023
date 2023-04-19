# SNP calling and filtering exercise
Week 7 - BIO 594
Megan Guidry

## Begin by creating a conda environment
`conda create -n week7 ddocent`
`conda activate week7`

## Calling SNPS
Create working directory and then create a link to the data we will be using in that working directory 
```
mkdir week7
cd week7
ln -s /home/BIO594/Exercises/Week07_and_Week_08/simulated/*.fq.gz .
```

Run dDocent

`dDocent`

Set the following settings:
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
mguidry@gmail.com
```

After starting dDocent with the above settings, you'll be prompted to set reference assemby cutoff values. 
For this exercise, I used the following:
`5` for K1 and `3` for K2

Once you enter this, you'll get the following message from dDocent:
> At this point, all configuration information has been entered and dDocent may take several hours to run.
> It is recommended that you move this script to a background operation and disable terminal input and output.
> All data and logfiles will still be recorded.

> To do keep dDocent running in the background:
> Press `control` and `Z` simultaneously
> Type `bg` and press `enter`
> Type `disown -h` and press `enter`
> Now sit back, relax, and wait for your analysis to finish

You'll get some output like this after it's finished running
```
dDocent has finished with an analysis in /home/mguidry/week7 

dDocent started Sat Mar 19 11:23:24 EDT 2022 

dDocent finished Sat Mar 19 11:31:47 EDT 2022 

After filtering, kept 3113 out of a possible 3268 Sites
```

Now, we can move on to filtering those SNPs!

## SNP Filtering

First, lets make a `filter` directory and link to our data in the `week7` directory
```
mkdir Filter
cd Filter/
ln -s ../TotalRawSNPs.vcf .
ls
```

Next, we'll use vcftools to start filtering.

*Quick guide to the parameters below:*
`Max missing` = Proportion of missing data to exclude
`maf` = Minor allele frequency - filters out SNPs with maf lower than set value
`minQ` = Minimum quality score to include 

```
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
After filtering, kept 3140 out of a possible 3268 Sites
Run Time = 1.00 seconds
```
We are down to **3140 SNPs** now!

Let's keep going and set the lower end of of our depth threshold!
*Quick guide to the following parameters:*
`minDP` = minimum depth 
Essentially the following is filtering to include genotypes with as few as 5 reads and exlcudes those under 5 reads.

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
After filtering, kept 3140 out of a possible 3140 Sites
Run Time = 3.00 seconds
```
This didn't get rid of any SNPs because it's simulated data!

Next, we'll remove individuals that didn't sequence well with this script that assesses and filters for missing data.
```
pop_missing_filter.sh TRSdp5.recode.vcf ../popmap 0.05 1 TRSdp5p05
```

Output:
```
After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 2946 out of a possible 3140 Sites
Run Time = 1.00 seconds
```
**2946 SNPs**

Next, we'll run the dDocent filters described in detail on the [dDocent filtering tutorial](https://www.ddocent.com/filtering/).
```
dDocent_filters TRSdp5p05.recode.vcf TRSdp5p05
```

dDocent will prompt you with a couple questions at this point. 
> Overlap expected? No
> Mixed SE and PE libraries? No

Partial Output:

```
Number of sites filtered based on allele balance at heterozygous loci, locus quality, and mapping quality / Depth
 474 of 2946 

Are reads expected to overlap?  In other words, is fragment size less than 2X the read length?  Enter yes or no.
no
Number of additional sites filtered based on overlapping forward and reverse reads
 0 of 2472 

Is this from a mixture of SE and PE libraries? Enter yes or no.
no
Number of additional sites filtered based on properly paired status
 0 of 2472 

Number of sites filtered based on high depth and lower than 2*DEPTH quality score
 292 of 2472 


                                                                                                                        
                                                                                                                        
                                               Histogram of mean depth per site                                         
      300 +---------------------------------------------------------------------------------------------------------+   
          |   +    +    +     +    +     +    +    +     +    +    +     +    +     +    +    +     +    +     +    |   
          |                                               'meandepthpersite' using (bin($1,binwidth)):(1.0) ******* |   
          |                                                                                     *****               |   
      250 |-+                                                                                   * * *             +-|   
          |                                                                                     * * ***             |   
          |                                                                                     * * * *             |   
          |                                                                                  **** * * *             |   
      200 |-+                                                                                ** * * * *           +-|   
          |                                                                                  ** * * * **            |   
          |                                                                                **** * * * **            |   
      150 |-+                                                                            *** ** * * * **          +-|   
          |                                                                              * * ** * * * ****          |   
          |                                                                              * * ** * * * ** *          |   
          |                                                                              * * ** * * * ** *          |   
      100 |-+                                                                            * * ** * * * ** *        +-|   
          |                                                                              * * ** * * * ** *          |   
          |                                                                          *** * * ** * * * ** *          |   
          |                                                                          * *** * ** * * * ** *          |   
       50 |-+                                                                       ** * * * ** * * * ** *        +-|   
          |                                                                       **** * * * ** * * * ** *****      |   
          |                                                                       * ** * * * ** * * * ** * * ****   |   
          |   +    +    +     +    +     +    +    +     +    +    +     +    + *** ** * * * ** * * * ** * * * **** |   
        0 +---------------------------------------------------------------------------------------------------------+   
              12   15   18    21   24    27   30   33    36   39   42    45   48    51   54   57    60   63    66   69  
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
 696 of 2946 

Remaining sites
 2250 


Filtered VCF file is called Output_prefix.FIL.recode.vcf

Filter stats stored in TRSdp5p05.filterstats
```

We have to change the formatting of the vcf file and save it as a prim file. Then we can run that prim file in vcftools to remove indels
```
vcfallelicprimitives -k -g TRSdp5p05.FIL.recode.vcf |sed 's:\.|\.:\.\/\.:g' > TRSdp5p05F.prim
vcftools --vcf TRSdp5p05F.prim --recode --recode-INFO-all --remove-indels --out SNP.TRSdp5p05F
```
Output:
```
After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1888 out of a possible 2431 Sites
Run Time = 1.00 seconds
```

Now we'll filter for Hardy-Weinberg Equilibrium
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

Run the following HWE filtered dataset through a filter that retains SNPs with minor allele frequencies of 0.05 and higher
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
**Down to 925 SNPs!**

## Converting from VCF to other outputs
Some downstream analyses will require other file formats. We can convert files from VCF to other formats using PGDspider.

Copy a PGDspider configuration file and file to map individuals to population
```
cp /home/BIO594/DATA/Week7/example/BSsnp.spid .
ln -s ../popmap .
```
Now, run PGDspider. This program is written in java.
```
java -jar /usr/local/bin/PGDSpider2-cli.jar -inputfile SNP.TRSdp5p05FHWEmaf05.recode.vcf -outputfile SNP.TRSdp5p05FHWEBS -spid BSsnp.spid
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
Cool! Now we can move on to outlier detection with BayeScan

## Outlier Detection

### Run BayeScan

In brief, [BayeScan](http://cmpg.unibe.ch/software/BayeScan/) attempts to find loci under selection using differences in allele frequencies between populations. Putative outliers are measured with Fst coefficients.

In this code, `nbp` is the "number of pilot runs" (default 20) and `thin` is the "thinning interval size" or the number of iterations between two samples (default 10). These values set the parameters for the Markov "chain". Because this code is an interative process, it takes a while to run.
```
BayeScan2.1_linux64bits SNP.TRSdp5p05FHWEBS -nbp 30 -thin 20
```
Copy R source file
```
cp /home/BIO594/DATA/Week7/example/plot_R.r .
```

### Open Rstudio or open an R interactive terminal in Visual Studio Code
To use R in VS code, you need an extension, but this is straightforward to download and get started on. 

Run the following to plot the output of BayeScan.
```
source("plot_R.r")
png("BS_plot.png") 
plot_bayescan("SNP.TRSdp5p05FH_fst.txt")
dev.off()
```

Resulting plot
![](figures/BS_plot.png)

## More outlier Detection

For all other analyses, we need to limit SNPs to only those with two alleles. Let's go back to bash and do that with the following line:
```
vcftools --vcf SNP.TRSdp5p05FHWEmaf05.recode.vcf --max-alleles 2 --recode --recode-INFO-all --out SNP.TRSdp5p05FHWE2A
```
Output: 
```
After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 923 out of a possible 925 Sites
Run Time = 0.00 seconds
```

## PCAdapt

This program runs entirely in R and has excellent [documentation](https://bcm-uga.github.io/pcadapt/). 
Here, I switched back over to my interactive R terminal in VS code.

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
png("likelihoods.png")
plot(x, option = "screeplot")
dev.off()
![](figures/likelihoods.png)

#Plot the likelihoods for only first 10 K
png("likelihoods_10K.png")
plot(x, option = "screeplot", K = 10)
dev.off()
![](figures/likelihoods_10K.png)

#Create population designations
poplist.names <- c(rep("POPA", 20),rep("POPB", 20),rep("POPC", 20), rep("POPD",20))

#Plot the actual PCA (first two PCAs)
png("PC1_PC2.png")
plot(x, option = "scores", pop = poplist.names)
dev.off()
![](figures/PC1_PC2.png)
#Plot PCA with PCA 2 and PCA 3
png("PC2_PC3.png")
plot(x, option = "scores", i = 2, j = 3, pop = poplist.names)
dev.off()
![](figures/PC2_PC3.png)
#Plot PCA with PCA 3 and PCA 4
png("PC3_PC4.png")
plot(x, option = "scores", i = 3, j = 4, pop = poplist.names)
dev.off()
![](figures/PC3_PC4.png)

#Redo PCA with only 3 K
x <- pcadapt(filename, K = 3)
summary(x)

#Plot the actual PCA (first two PCAs)
png("3K_PC1_PC2.png")
plot(x, option = "scores", pop = poplist.names)
dev.off()
![](figures/3K_PC1_PC2.png)
#Plot PCA with PCA 2 and PCA 3
png("3K_PC2_PC3.png")
plot(x, option = "scores", i = 2, j = 3, pop = poplist.names)
dev.off()
![](figures/3K_PC2_PC3.png)

#Start looking for outliers
#Make Manhattan Plot
png("manhattan.png")
plot(x , option = "manhattan")
dev.off()
![](figures/manhattan.png)
#Make qqplot
png("qqplot.png")
plot(x, option = "qqplot", threshold = 0.1)
dev.off()
![](figures/manhattan.png)
# Look at P-value distribution
png("pval.png")
plot(x, option = "stat.distribution")
dev.off()

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
java -jar /usr/local/bin/PGDSpider2-cli.jar -inputfile SNP.TRSdp5p05FHWE2A.recode.vcf -outputfile SNP.TRSdp5p05FHWEBayEnv.txt -spid SNPBayEnv.spid
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

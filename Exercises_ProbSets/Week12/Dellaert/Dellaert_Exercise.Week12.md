# Assignment due on 4/26/2022


## Part 1
In the directory, `/home/BIO594/Exercises/Week_12`, you will find a few useful files and two directories, `realdata` and `simulated`

I would like you to complete the following and push it to your own folder in this repository directory.

* For the simulated data
  * Filter the SNPs (you actually did this last week)
  * Run at least two outlier detection programs
    * Generate a VCF file with only neutral SNPs  
  * Run at least one PCA and one DAPC with the neutral data
  * Perform at least two analyses from Silliman et al
* For the realdata
  * Run BayeScan
  * Run BayEnv
  * Run at least one PCA and one DAPC using outlier free data set
  * Perform at least two analyses from Silliman et al	
    
Each directory has a `popmap` `environ` and `LibraryInfo` files

`popmap` is a mapping of individuals to populations

`environ` is an environmental factor file for BayEnv

`LibraryInfo` maps samples to sequencing library

There are also PGDspider configuration files and an R file for BayeScan output plotting.

## Part 2

* Repeat the redundancy analysis documented [here](https://github.com/Tom-Jenkins/seascape_rda_tutorial)

### Have fun!

## Part 1


  * Run at least two outlier detection programs
    * Generate a VCF file with only neutral SNPs  
  * Run at least one PCA and one DAPC with the neutral data
  * Perform at least two analyses from Silliman et al
* For the realdata
  * Run BayeScan
  * Run BayEnv
  * Run at least one PCA and one DAPC using outlier free data set
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

* Filter the SNPs (you actually did this last week)

### Copying filtered SNPs from last week

```bash
cp ../Week11/SNP.DP3g95p5maf05.HWE.recode.vcf  .
```

* Run at least two outlier detection programs

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

### Run BayeScan

```bash
BayeScan2.1_linux64bits BS_input -nbp 30 -thin 20
```

Copy source file

```bash
cp /home/BIO594/DATA/Week7/example/plot_R.r .
```

### Open Rstudio 
```R
setwd("~/Week12")
source("plot_R.r")
plot_bayescan("BS_input_fst.txt")
```

Bayesscan found 5 outliers: 

[1] 179 307 308 671 672


![BayesScan.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week12/Dellaert/BayesScan.png?raw=true)

## More outlier Detection

For all other analyses, we need to limit SNPs to only those with two alleles:

```bash
vcftools --vcf SNP.DP3g95p5maf05.HWE.recode.vcf --max-alleles 2 --recode --recode-INFO-all --out SNP.DP3g95p5maf05_vcftoolsOD
```

Output: SNP.DP3g95p5maf05_vcftoolsOD.recode.vcf
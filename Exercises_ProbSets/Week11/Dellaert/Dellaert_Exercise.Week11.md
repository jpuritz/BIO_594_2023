# Assignment due on 4/19/2023


In the directory, `/home/BIO594/Exercises/Week_11`, you will find fastq files, library information, environmental info, and a popmap.

I would like you to complete the following and push it to your own folder in this repository directory.

1. Call SNPs
2. Filter SNPs


```
mkdir Week11
cd Week11

mkdir callSNPs
cd callSNPs
ln -s /home/BIO594/Exercises/Week_11/*.fq.gz .

mamba create -n Week11_Ex ddocent
source activate Week11_Ex
```

### Call SNPs

```
dDocent
```

80 individuals are detected. Is this correct? 
**yes**
Proceeding with 80 individuals
dDocent detects 80 processors available on this system.
Please enter the maximum number of processors to use for this analysis.
**10**
Do you want to quality trim your reads?
**yes**
Do you want to perform an assembly?
**yes**
What type of assembly would you like to perform?  Enter SE for single end, PE for paired-end, RPE for paired-end sequencing for RAD protocols with random shearing, or OL for paired-end sequencing that has substantial overlap.
**PE**
Reads will be assembled with Rainbow
CD-HIT will cluster reference sequences by similarity. The -c parameter (% similarity to cluster) may need to be changed for your taxa.
Would you like to enter a new c parameter now? Type yes or no and press [ENTER]
**yes** **0.9**
Do you want to map reads?  Type yes or no and press [ENTER]
**yes**
Would you like to enter a new parameters now? Type yes or no and press [ENTER]
**no**
Proceeding with default values for BWA read mapping.
Do you want to use FreeBayes to call SNPs?  Please type yes or no and press [ENTER]
**yes**

Choose cutoff:

![Graph0.png](https://raw.githubusercontent.com/jpuritz/BIO_594_2023/main/Exercises_ProbSets/Week11/Dellaert/Graph0.png)

I chose a cutoff of 4. 

![Graph01.png](https://raw.githubusercontent.com/jpuritz/BIO_594_2023/main/Exercises_ProbSets/Week11/Dellaert/Graph01.png)

I chose a cutoff of 15. 

End up with file called TotalRawSNPs.vcf

### Filter VCF file

"In this code, we call vcftools, feed it a vcf file after the --vcf flag, --max-missing 0.5 tells it to filter genotypes called below 50% (across all individuals) the --mac 3 flag tells it to filter SNPs that have a minor allele count less than 3. This is relative to genotypes, so it has to be called in at least 1 homozygote and 1 heterozygote or 3 heterozygotes. The --recode flag tells the program to write a new vcf file with the filters, --recode-INFO-all keeps all the INFO flags from the old vcf file in the new one. Lastly --out designates the name of the output"

```
ls *vcf

#TotalRawSNPs.vcf

vcftools --vcf TotalRawSNPs.vcf --max-missing 0.5 --minQ 30 --mac 3 --recode --recode-INFO-all --out raw.g5mac3
```

Got a lot of warnings but ended with this:

- After filtering, kept 80 out of 80 Individuals
- Outputting VCF file...
- After filtering, kept 1969 out of a possible 3287 Sites
- Run Time = 0.00 seconds

Now our filtered VCF is: raw.g5mac3.recode.vcf

### More filtering:

Recode genotypes that have less than 3 reads

```
vcftools --vcf raw.g5mac3.recode.vcf --minDP 3 --recode --recode-INFO-all --out raw.g5mac3dp3
```

After filtering, kept 1969 out of a possible 1969 Sites

Checking our filtering using Jon's script:

```
curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/ErrorCount.sh
chmod +x ErrorCount.sh
./ErrorCount.sh raw.g5mac3dp3.recode.vcf
```

Result:
- This script counts the number of potential genotyping errors due to low read depth
- It report a low range, based on a 50% binomial probability of observing the second allele in a heterozygote and a high range based on a 25% probability.
- Potential genotyping errors from genotypes from only 1 read range from 0.0 to 0.0
- Potential genotyping errors from genotypes from only 2 reads range from 0.0 to 0.0
- Potential genotyping errors from genotypes from only 3 reads range from  43.875 to 147.42
- Potential genotyping errors from genotypes from only 4 reads range from 20.9375 to 105.86
- Potential genotyping errors from genotypes from only 5 reads range from 13.96875 to 105
- 80 number of individuals and 1969 equals 157520 total genotypes
- Total genotypes not counting missing data 157069
- Total potential error rate is between 0.0005015709656265718 and 0.0022810357231535182
- SCORCHED EARTH SCENARIO
- WHAT IF ALL LOW DEPTH HOMOZYGOTE GENOTYPES ARE ERRORS?????
- The total SCORCHED EARTH error rate is 0.0072133902934379155.

The next step is to get rid of individuals that did not sequence well.  We can do this by assessing individual levels of missing data.

```
vcftools --vcf raw.g5mac3dp3.recode.vcf --missing-indv

#cat out.imiss #to examine the result
```

- After filtering, kept 80 out of 80 Individuals
- Outputting Individual Missingness
- After filtering, kept 1969 out of a possible 1969 Sites

Plot data

```
mawk '!/IN/' out.imiss | cut -f5 > totalmissing
gnuplot << \EOF
set terminal dumb size 120, 30
set autoscale
unset label
set title "Histogram of % missing data per individual"
set ylabel "Number of Occurrences"
set xlabel "% of missing data"
binwidth=0.01
bin(x,width)=width*floor(x/width) + binwidth/2.0
set lmargin 10
plot 'totalmissing' using (bin($1,binwidth)):(1.0) smooth freq with boxes
pause -1
EOF
```

![Graph1.png](https://raw.githubusercontent.com/jpuritz/BIO_594_2023/main/Exercises_ProbSets/Week11/Dellaert/Graph1.png)

It looks like about 75 individuals have less than 0.01 missing data and the other 5 have between 0.01 and 0.015 missing data.

Therefore, I am not going to remove any individuals. 

Now: restrict the data to variants called in a high percentage of individuals and filter by mean depth of genotypes

```
vcftools --vcf raw.g5mac3dp3.recode.vcf --max-missing 0.95 --maf 0.05 --recode --recode-INFO-all --out DP3g95maf05 --min-meanDP 20
```

**After filtering, kept 1161 out of a possible 1969 Sites**

```
head popmap

mawk '$2 == "PopA"' popmap > A.keep
mawk '$2 == "PopB"' popmap > B.keep
mawk '$2 == "PopB"' popmap > C.keep
mawk '$2 == "PopB"' popmap > D.keep
```

 Next, we use VCFtools to estimate missing data for loci in each population

```
vcftools --vcf DP3g95maf05.recode.vcf --keep A.keep --missing-site --out A

vcftools --vcf DP3g95maf05.recode.vcf --keep B.keep --missing-site --out B

vcftools --vcf DP3g95maf05.recode.vcf --keep C.keep --missing-site --out C

vcftools --vcf DP3g95maf05.recode.vcf --keep D.keep --missing-site --out D
```

For all 4, the output was:

#After filtering, kept 20 out of 80 Individuals

#Outputting Site Missingness

#After filtering, kept 1161 out of a possible 1161 Sites

- Combine the 4 files
- Make a list of loci about the threshold of 10% missing data to remove. 

```
cat A.lmiss B.lmiss C.lmiss D.lmiss | mawk '!/CHR/' | mawk '$6 > 0.1' | cut -f1,2 >> badloci
```

No bad loci!!!

## Now really filtering

"vcffilter works with simple conditional statements, so this filters out loci with an allele balance below 0.25 and above 0.75.  However, it does include those that are close to zero.

The last condition is to catch loci that are fixed variants (all individuals are homozygous for one of the two variants).

The -s tells the filter to apply to sites, not just alleles"


```
vcftools --vcf DP3g95maf05.recode.vcf --exclude-positions badloci --recode --recode-INFO-all --out DP3g95p5maf05

vcffilter -s -f "AB > 0.25 & AB < 0.75 | AB < 0.01" DP3g95p5maf05.recode.vcf > DP3g95p5maf05.fil1.vcf
```

To see how many loci are now in the VCF file, you could feed it into VCFtools or you can just use a simple mawk statement

```
mawk '!/#/' DP3g95p5maf05.recode.vcf | wc -l
```

1161

```
mawk '!/#/' DP3g95p5maf05.fil1.vcf | wc -l
```

1153

### Filtered 8 loci.

"The next filter we will apply filters out sites that have reads from both strands.  For GWAS and even RNAseq, this can be a good thing.

Unless you are using super small genomic fragment or really long reads (MiSeq).  A SNP should be covered only by forward or only reverse reads."

```
vcffilter -f "SAF / SAR > 100 & SRF / SRR > 100 | SAR / SAF > 100 & SRR / SRF > 100" -s DP3g95p5maf05.fil1.vcf > DP3g95p5maf05.fil2.vcf

mawk '!/#/' DP3g95p5maf05.fil2.vcf | wc -l
```

Still have 1153 loci.

"The next filter looks at the ratio of mapping qualities between reference and alternate alleles. The rationale here is that, again, because RADseq loci and alleles all should start from the same genomic location there should not be large discrepancy between the mapping qualities of two alleles."


```
vcffilter -f "MQM / MQMR > 0.9 & MQM / MQMR < 1.05" DP3g95p5maf05.fil2.vcf > DP3g95p5maf05.fil3.vcf

mawk '!/#/' DP3g95p5maf05.fil3.vcf | wc -l
```

Still have 1153 loci.

"Yet another filter that can be applied is whether or not their is a discrepancy in the properly paired status of for reads supporting reference or alternate alleles.


```
vcffilter -f "PAIRED > 0.05 & PAIREDR > 0.05 & PAIREDR / PAIRED < 1.75 & PAIREDR / PAIRED > 0.25 | PAIRED < 0.05 & PAIREDR < 0.05" -s DP3g95p5maf05.fil3.vcf > DP3g95p5maf05.fil4.vcf

mawk '!/#/' DP3g95p5maf05.fil4.vcf | wc -l
```

Still have 1153 loci.

"The next filter we will apply is to look at the ration of locus quality score to depth"

First filter: removing any locus that has a quality score below 1/4 of the depth.

```
vcffilter -f "QUAL / DP > 0.25" DP3g95p5maf05.fil4.vcf > DP3g95p5maf05.fil5.vcf

mawk '!/#/' DP3g95p5maf05.fil5.vcf | wc -l
```

1151: Filtered 2 additional loci.

Second filter: 

1. Create a list of the depth of each locus

```
cut -f8 DP3g95p5maf05.fil5.vcf | grep -oe "DP=[0-9]*" | sed -s 's/DP=//g' > DP3g95p5maf05.fil5.DEPTH
```

2. Create a list of quality scores and calculate mean depth

```
mawk '!/#/' DP3g95p5maf05.fil5.vcf | cut -f1,2,6 > DP3g95p5maf05.fil5.vcf.loci.qual

mawk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' DP3g95p5maf05.fil5.DEPTH
```

Mean depth: 4702.78

3. Now the the mean plus 3X the square of the mean

```
python2.7 -c "print int(4703+3*(4703**0.5))"
```

4908

4. Next we paste the depth and quality files together and find the loci above the cutoff that do not have quality scores 2 times the depth, then remove those sites and recalculate depth across loci with vcftools

```
paste DP3g95p5maf05.fil5.vcf.loci.qual DP3g95p5maf05.fil5.DEPTH | mawk -v x=4908 '$4 > x' | mawk '$3 < 2 * $4' > DP3g95p5maf05.fil5.lowQDloci

vcftools --vcf DP3g95p5maf05.fil5.vcf --site-depth --exclude-positions DP3g95p5maf05.fil5.lowQDloci --out DP3g95p5maf05.fil5
```

- After filtering, kept 80 out of 80 Individuals
- Outputting Depth for Each Site
- **After filtering, kept 1068 out of a possible 1151 Sites**

5. Look at the depth calculated by vcftools, x = 80 (# of individuals)

```
cut -f3 DP3g95p5maf05.fil5.ldepth > DP3g95p5maf05.fil5.site.depth

mawk '!/D/' DP3g95p5maf05.fil5.site.depth | mawk -v x=80 '{print $1/x}' > meandepthpersite
```

6. Plot the mean depth per site

```
gnuplot << \EOF
set terminal dumb size 120, 30
set autoscale
set xrange [10:150]
unset label
set title "Histogram of mean depth per site"
set ylabel "Number of Occurrences"
set xlabel "Mean Depth"
binwidth=1
bin(x,width)=width*floor(x/width) + binwidth/2.0
set xtics 5
plot 'meandepthpersite' using (bin($1,binwidth)):(1.0) smooth freq with boxes
pause -1
EOF
```

![Graph2.png](https://raw.githubusercontent.com/jpuritz/BIO_594_2023/main/Exercises_ProbSets/Week11/Dellaert/Graph2.png)

Looking good!!


### HWE Filter

"The next filter to apply is HWE.  Heng Li also found that HWE is another excellent filter to remove erroneous variant calls. We don't want to apply it across the board, since population structure will create departures from HWE as well.  We need to apply this by population. I've included a perl script written by Chris Hollenbeck, one of the PhD student's in my previous lab that will do this for us."

```
curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/filter_hwe_by_pop.pl
chmod +x filter_hwe_by_pop.pl
```


First, we need to convert our variant calls to SNPs: vcfallelicprimatives

Next, we can feed this VCF file into VCFtools to remove indels.


```
vcfallelicprimitives DP3g95p5maf05.fil5.vcf --keep-info --keep-geno > DP3g95p5maf05.prim.vcf

vcftools --vcf DP3g95p5maf05.prim.vcf --remove-indels --recode --recode-INFO-all --out SNP.DP3g95p5maf05
```

**After filtering, kept 937 out of a possible 1206 Sites**

Now, let's apply the HWE filter.

```
perl filter_hwe_by_pop.pl -v SNP.DP3g95p5maf05.recode.vcf -p popmap -o SNP.DP3g95p5maf05.HWE -h 0.01
```

**Kept 936 of a possible 937 loci (filtered 1 loci)**



Final Filtered FILE:

SNP.DP3g95p5maf05.HWE.recode.vcf
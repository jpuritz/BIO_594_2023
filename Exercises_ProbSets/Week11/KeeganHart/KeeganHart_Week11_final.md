# Keegan Hart Week 11 Solution
## This file was created to show the process of how I called and filtered SNPs for the data contained in `/home/BIO594/Exercises/Week_11`. 

### First I copied the folder containing the data into my personal directory so I could manipulate files while maintaining original data files and directory
```
cd BIO594/Exercises/Week_11_copy
ls
cd ..
cp -r  Week_11 ~/repo/
```
### Now that the files are all on my personal directory I can run dDocent.

```
(base) [khart@KITT Week11_copy]$ dDocent
dDocent 2.8.12 

Contact jpuritz@uri.edu with any problems 

 Checking for required software

All required software is installed!

dDocent version 2.8.12 started Wed Apr 19 11:16:28 EDT 2023 

80 individuals are detected. Is this correct? Enter yes or no and press [ENTER]
yes
Proceeding with 80 individuals
dDocent detects 80 processors available on this system.
Please enter the maximum number of processors to use for this analysis.
10

Do you want to quality trim your reads?
Type yes or no and press [ENTER]?
yes

Do you want to perform an assembly?
Type yes or no and press [ENTER].
yes
What type of assembly would you like to perform?  Enter SE for single end, PE for paired-end, RPE for paired-end sequencing for RAD protocols with random shearing, or OL for paired-end sequencing that has substantial overlap.
Then press [ENTER]
PE
Reads will be assembled with Rainbow
CD-HIT will cluster reference sequences by similarity. The -c parameter (% similarity to cluster) may need to be changed for your taxa.
Would you like to enter a new c parameter now? Type yes or no and press [ENTER]
yes
Please enter new value for c. Enter in decimal form (For 90%, enter 0.9)
0.9
Do you want to map reads?  Type yes or no and press [ENTER]
yes
BWA will be used to map reads.  You may need to adjust -A -B and -O parameters for your taxa.
Would you like to enter a new parameters now? Type yes or no and press [ENTER]
no
Proceeding with default values for BWA read mapping.
Do you want to use FreeBayes to call SNPs?  Please type yes or no and press [ENTER]
yes



                       Number of Unique Sequences with More than X Coverage (Counted within individuals)
 Number of Unique Sequences
   105000 ++----------+-----------+----------+-----------+-----------+-----------+----------+-----------+----------++
          +           +           +          +           +           +           +          +           +           +
          *****                                                                                                     |
   100000 ++   *                                                                                                   ++
          |     ******                                                                                              |
          |           ******                                                                                        |
          |                 ******                                                                                  |
    95000 ++                      ***********                                                                      ++
          |                                  ******                                                                 |
          |                                        ******                                                           |
    90000 ++                                             ******                                                    ++
          |                                                    ******                                               |
          |                                                          ******                                         |
    85000 ++                                                               ******                                  ++
          |                                                                      ******                             |
          |                                                                            *****                        |
    80000 ++                                                                                ******                 ++
          |                                                                                       ******            |
          |                                                                                             ******      |
          |                                                                                                   ******|
    75000 ++                                                                                                       +*
          |                                                                                                         |
          +           +           +          +           +           +           +          +           +           +
    70000 ++----------+-----------+----------+-----------+-----------+-----------+----------+-----------+----------++
          2           4           6          8           10          12          14         16          18          20
                                                           Coverage

Please choose data cutoff.  In essence, you are picking a minimum (within individual) coverage level for a read (allele) to be used in the reference assembly
4



                                 Number of Unique Sequences present in more than X Individuals
   Number of Unique Sequences
     3500 ++-----------+-------------+------------+------------+------------+-------------+------------+-----------++
          +            +             +            +            +            +             +            +            +
          |                                                                                                         |
          |                                                                                                         |
          |    *                                                                                                    |
     3000 ++    *                                                                                                  ++
          |      *                                                                                                  |
          |       ***                                                                                               |
          |                                                                                                         |
     2500 ++         *                                                                                             ++
          |           *                                                                                             |
          |            ***                                                                                          |
          |               ***                                                                                       |
          |                  **                                                                                     |
     2000 ++                   ***                                                                                 ++
          |                       ***                                                                               |
          |                          *******                                                                        |
          |                                 ******                                                                  |
     1500 ++                                      ********                                                         ++
          |                                               *************                                             |
          |                                                            ****************                             |
          |                                                                            ******************           |
          +            +             +            +            +            +             +            + ************
     1000 ++-----------+-------------+------------+------------+------------+-------------+------------+-----------++
          0            5             10           15           20           25            30           35           40
                                                     Number of Individuals

Please choose data cutoff.  Pick point right before the assymptote. A good starting cutoff might be 10% of the total number of individuals
10

Using VCFtools to parse TotalRawSNPS.vcf for SNPs that are called in at least 90% of individuals

dDocent has finished with an analysis in /home/khart/repo/Week11_copy 

dDocent started Wed Apr 19 11:16:28 EDT 2023 

dDocent finished Wed Apr 19 11:26:53 EDT 2023 

After filtering, kept 3144 out of a possible 3283 Sites 
```

### Now I can move on to filtering SNP's by following the dDocent SNP Filtering Tutorial 
```
mkdir filtering
cd filtering
```
### Link to vcf file in Week11_copy
```
ln -s ../TotalRawSNPs.vcf
```
### Confirm that vcf file is now in filtering
```
ls
```
### Run vcf tools 
```
vcftools --vcf TotalRawSNPs.vcf --max-missing 0.5 --mac 3 --minQ 30 --recode --recode-INFO-all --out raw.g5mac3

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1966 out of a possible 3283 Sites
Run Time = 1.00 seconds
```
### Check what file was created
```
(base) [khart@KITT filtering]$ ls
raw.g5mac3.log  raw.g5mac3.recode.vcf  TotalRawSNPs.vcf
```
### The next filter we will apply is a minimum depth for a genotype call and a minimum mean depth, keeping genotypes with as few as 3 reads
```
vcftools --vcf raw.g5mac3.recode.vcf --minDP 3 --recode --recode-INFO-all --out raw.g5mac3dp3 

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1966 out of a possible 1966 Sites
Run Time = 0.00 seconds
```
### Get rid of individuals that do not sequence well
```
vcftools --vcf raw.g5mac3dp3.recode.vcf --missing-indv

After filtering, kept 80 out of 80 Individuals
Outputting Individual Missingness
After filtering, kept 1966 out of a possible 1966 Sites
Run Time = 1.00 seconds
```
### Look at results
```
(base) [khart@KITT filtering]$ cat out.imiss
INDV    N_DATA  N_GENOTYPES_FILTERED    N_MISS  F_MISS
PopA_001        1966    0       18      0.00915565
PopA_002        1966    0       10      0.00508647
PopA_003        1966    0       3       0.00152594
PopA_004        1966    0       10      0.00508647
PopA_005        1966    0       14      0.00712106
PopA_006        1966    0       20      0.0101729
PopA_007        1966    0       8       0.00406918
PopA_008        1966    0       13      0.00661241
PopA_009        1966    0       17      0.008647
PopA_010        1966    0       8       0.00406918
PopA_011        1966    0       11      0.00559512
PopA_012        1966    0       15      0.0076297
PopA_013        1966    0       18      0.00915565
PopA_014        1966    0       16      0.00813835
PopA_015        1966    0       9       0.00457782
PopA_016        1966    0       23      0.0116989
PopA_017        1966    0       17      0.008647
PopA_018        1966    0       15      0.0076297
PopA_019        1966    0       24      0.0122075
PopA_020        1966    0       9       0.00457782
PopB_001        1966    0       18      0.00915565
PopB_002        1966    0       14      0.00712106
PopB_003        1966    0       19      0.00966429
PopB_004        1966    0       12      0.00610376
PopB_005        1966    0       3       0.00152594
PopB_006        1966    0       9       0.00457782
PopB_007        1966    0       16      0.00813835
PopB_008        1966    0       11      0.00559512
PopB_009        1966    0       4       0.00203459
PopB_010        1966    0       9       0.00457782
PopB_011        1966    0       11      0.00559512
PopB_012        1966    0       8       0.00406918
PopB_013        1966    0       10      0.00508647
PopB_014        1966    0       9       0.00457782
PopB_015        1966    0       19      0.00966429
PopB_016        1966    0       12      0.00610376
PopB_017        1966    0       17      0.008647
PopB_018        1966    0       3       0.00152594
PopB_019        1966    0       17      0.008647
PopB_020        1966    0       5       0.00254323
PopC_001        1966    0       9       0.00457782
PopC_002        1966    0       11      0.00559512
PopC_003        1966    0       9       0.00457782
PopC_004        1966    0       6       0.00305188
PopC_005        1966    0       20      0.0101729
PopC_006        1966    0       19      0.00966429
PopC_007        1966    0       22      0.0111902
PopC_008        1966    0       18      0.00915565
PopC_009        1966    0       3       0.00152594
PopC_010        1966    0       18      0.00915565
PopC_011        1966    0       10      0.00508647
PopC_012        1966    0       19      0.00966429
PopC_013        1966    0       13      0.00661241
PopC_014        1966    0       25      0.0127162
PopC_015        1966    0       12      0.00610376
PopC_016        1966    0       15      0.0076297
PopC_017        1966    0       8       0.00406918
PopC_018        1966    0       10      0.00508647
PopC_019        1966    0       22      0.0111902
PopC_020        1966    0       15      0.0076297
PopD_001        1966    0       11      0.00559512
PopD_002        1966    0       14      0.00712106
PopD_003        1966    0       12      0.00610376
PopD_004        1966    0       6       0.00305188
PopD_005        1966    0       14      0.00712106
PopD_006        1966    0       12      0.00610376
PopD_007        1966    0       18      0.00915565
PopD_008        1966    0       7       0.00356053
PopD_009        1966    0       13      0.00661241
PopD_010        1966    0       26      0.0132248
PopD_011        1966    0       14      0.00712106
PopD_012        1966    0       21      0.0106816
PopD_013        1966    0       12      0.00610376
PopD_014        1966    0       17      0.008647
PopD_015        1966    0       13      0.00661241
PopD_016        1966    0       19      0.00966429
PopD_017        1966    0       15      0.0076297
PopD_018        1966    0       14      0.00712106
PopD_019        1966    0       19      0.00966429
PopD_020        1966    0       17      0.008647
```

### Make a histogram
```
mawk '!/IN/' out.imiss | cut -f5 > totalmissing
gnuplot << \EOF 
set terminal dumb size 120, 30
set autoscale 
unset label
set title "Histogram of % missing data per individual"
set ylabel "Number of Occurrences"
set xlabel "% of missing data"
#set yr [0:100000]
binwidth=0.01
bin(x,width)=width*floor(x/width) + binwidth/2.0
plot 'totalmissing' using (bin($1,binwidth)):(1.0) smooth freq with boxes
pause -1
EOF



                                       Histogram of % missing data per individual

  80 ++---------+----------+----------+----------+-----------+----------+----------+----------+----------+---------++
     +          +          +          +          +           + 'totalmissing' using (bin($1,binwidth)):(1.0) ****** +
     |                                                                                                              |
  70 ********************************************************                                                      ++
     *                                                      *                                                       |
     *                                                      *                                                       |
  60 *+                                                     *                                                      ++
     *                                                      *                                                       |
     *                                                      *                                                       |
  50 *+                                                     *                                                      ++
     *                                                      *                                                       |
  40 *+                                                     *                                                      ++
     *                                                      *                                                       |
     *                                                      *                                                       |
  30 *+                                                     *                                                      ++
     *                                                      *                                                       |
     *                                                      *                                                       |
  20 *+                                                     *                                                      ++
     *                                                      *                                                       |
     *                                                      *                                                       |
  10 *+                                                     *********************************************************
     *                                                      **                                                      *
     *          +          +          +          +          **          +          +          +          +          *
   0 ****************************************************************************************************************
   0.005      0.006      0.007      0.008      0.009        0.01      0.011      0.012      0.013      0.014      0.015
                                                    % of missing data

```
### According to the histogram, 70 individuals have less than 0.01% missing data. In the SNP Filtering tutorial there are individuals with more than 50% missing data so some individuals were removed. With such low values of missing data I do not believe that we need to remove any individuals...

### Restrict the data to variants called in a high percentage of individuals and filter by mean depth of genotypes
```
vcftools --vcf raw.g5mac3dp3.recode.vcf --max-missing 0.95 --maf 0.05 --recode --recode-INFO-all --out DP3g95maf05 --min-meanDP 20

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1156 out of a possible 1966 Sites
Run Time = 1.00 seconds
```

### Look at popmap
```
ln - s ../popmap
ls
```
### popmap is now in filtering
```
cat popmap 

PopA_001        PopA
PopA_002        PopA
PopA_003        PopA
PopA_004        PopA
PopA_005        PopA
PopA_006        PopA
PopA_007        PopA
PopA_008        PopA
PopA_009        PopA
PopA_010        PopA
PopA_011        PopA
PopA_012        PopA
PopA_013        PopA
PopA_014        PopA
PopA_015        PopA
PopA_016        PopA
PopA_017        PopA
PopA_018        PopA
PopA_019        PopA
PopA_020        PopA
PopB_001        PopB
PopB_002        PopB
PopB_003        PopB
PopB_004        PopB
PopB_005        PopB
PopB_006        PopB
PopB_007        PopB
PopB_008        PopB
PopB_009        PopB
PopB_010        PopB
PopB_011        PopB
PopB_012        PopB
PopB_013        PopB
PopB_014        PopB
PopB_015        PopB
PopB_016        PopB
PopB_017        PopB
PopB_018        PopB
PopB_019        PopB
PopB_020        PopB
PopC_001        PopC
PopC_002        PopC
PopC_003        PopC
PopC_004        PopC
PopC_005        PopC
PopC_006        PopC
PopC_007        PopC
PopC_008        PopC
PopC_009        PopC
PopC_010        PopC
PopC_011        PopC
PopC_012        PopC
PopC_013        PopC
PopC_014        PopC
PopC_015        PopC
PopC_016        PopC
PopC_017        PopC
PopC_018        PopC
PopC_019        PopC
PopC_020        PopC
PopD_001        PopD
PopD_002        PopD
PopD_003        PopD
PopD_004        PopD
PopD_005        PopD
PopD_006        PopD
PopD_007        PopD
PopD_008        PopD
PopD_009        PopD
PopD_010        PopD
PopD_011        PopD
PopD_012        PopD
PopD_013        PopD
PopD_014        PopD
PopD_015        PopD
PopD_016        PopD
PopD_017        PopD
PopD_018        PopD
PopD_019        PopD
PopD_020        PopD
```
### Now we need to create four lists that have just the individual names for each population
```
mawk '$2 == "PopA"' popmap > 1.keep && mawk '$2 == "PopB"' popmap > 2.keep
mawk '$2 == "PopC"' popmap > 3.keep && mawk '$2 == "PopD"' popmap > 4.keep
```
### There are now 4 new files: 1.keep, 2.keep, 3.keep, 4.keep

### use VCFtools to estimate missing data for loci in each population
```
vcftools --vcf DP3g95maf05.recode.vcf --keep 1.keep --missing-site --out 1

Keeping individuals in 'keep' list
After filtering, kept 20 out of 80 Individuals
Outputting Site Missingness
After filtering, kept 1156 out of a possible 1156 Sites
Run Time = 0.00 seconds

vcftools --vcf DP3g95maf05.recode.vcf --keep 2.keep --missing-site --out 2

Keeping individuals in 'keep' list
After filtering, kept 20 out of 80 Individuals
Outputting Site Missingness
After filtering, kept 1156 out of a possible 1156 Sites
Run Time = 0.00 seconds

vcftools --vcf DP3g95maf05.recode.vcf --keep 3.keep --missing-site --out 3

Keeping individuals in 'keep' list
After filtering, kept 20 out of 80 Individuals
Outputting Site Missingness
After filtering, kept 1156 out of a possible 1156 Sites
Run Time = 0.00 seconds

vcftools --vcf DP3g95maf05.recode.vcf --keep 4.keep --missing-site --out 4

Keeping individuals in 'keep' list
After filtering, kept 20 out of 80 Individuals
Outputting Site Missingness
After filtering, kept 1156 out of a possible 1156 Sites
Run Time = 0.00 seconds
```
### We now have files named 1.lmiss, 2.lmiss, 3.lmiss, 4.lmiss with the following format: 
```
-3 1.lmiss

CHR     POS     N_DATA  N_GENOTYPE_FILTERED     N_MISS  F_MISS
dDocent_Contig_6        149     40      0       0       0
dDocent_Contig_22       17      40      0       0       0
```

### Combine the two files and make a list of loci about the threshold of 10% missing data to remove
```
cat 1.lmiss 2.lmiss 3.lmiss 4.lmiss | mawk '!/CHR/' | mawk '$6 > 0.1' | cut -f1,2 >> badloci
```
### Feed this file back into VCFtools to remove any of the loci
```
vcftools --vcf DP3g95maf05.recode.vcf --exclude-positions badloci --recode --recode-INFO-all --out DP3g95p5maf05

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1156 out of a possible 1156 Sites
Run Time = 0.00 seconds
```
## From this point forward, the filtering steps assume that the vcf file was generated by FreeBayes
```
mawk '/#/' DP3g95maf05.recode.vcf

```
```
##fileformat=VCFv4.2
##fileDate=20230419
##source=freeBayes v1.3.6
##reference=reference.fasta
##contig=<ID=dDocent_Contig_1000,length=206>
##phasing=none
##INFO=<ID=NS,Number=1,Type=Integer,Description="Number of samples with data">
##INFO=<ID=DP,Number=1,Type=Integer,Description="Total read depth at the locus">
##INFO=<ID=DPB,Number=1,Type=Float,Description="Total read depth per bp at the locus; bases in reads overlapping / bases in haplotype">
##INFO=<ID=AC,Number=A,Type=Integer,Description="Total number of alternate alleles in called genotypes">
##INFO=<ID=AN,Number=1,Type=Integer,Description="Total number of alleles in called genotypes">
##INFO=<ID=AF,Number=A,Type=Float,Description="Estimated allele frequency in the range (0,1]">
##INFO=<ID=RO,Number=1,Type=Integer,Description="Count of full observations of the reference haplotype.">
##INFO=<ID=AO,Number=A,Type=Integer,Description="Count of full observations of this alternate haplotype.">
##INFO=<ID=PRO,Number=1,Type=Float,Description="Reference allele observation count, with partial observations recorded fractionally">
##INFO=<ID=PAO,Number=A,Type=Float,Description="Alternate allele observations, with partial observations recorded fractionally">
##INFO=<ID=QR,Number=1,Type=Integer,Description="Reference allele quality sum in phred">
##INFO=<ID=QA,Number=A,Type=Integer,Description="Alternate allele quality sum in phred">
##INFO=<ID=PQR,Number=1,Type=Float,Description="Reference allele quality sum in phred for partial observations">
##INFO=<ID=PQA,Number=A,Type=Float,Description="Alternate allele quality sum in phred for partial observations">
##INFO=<ID=SRF,Number=1,Type=Integer,Description="Number of reference observations on the forward strand">
##INFO=<ID=SRR,Number=1,Type=Integer,Description="Number of reference observations on the reverse strand">
##INFO=<ID=SAF,Number=A,Type=Integer,Description="Number of alternate observations on the forward strand">
##INFO=<ID=SAR,Number=A,Type=Integer,Description="Number of alternate observations on the reverse strand">
##INFO=<ID=SRP,Number=1,Type=Float,Description="Strand balance probability for the reference allele: Phred-scaled upper-bounds estimate of the probability of observing the deviation between SRF and SRR given E(SRF/SRR) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=SAP,Number=A,Type=Float,Description="Strand balance probability for the alternate allele: Phred-scaled upper-bounds estimate of the probability of observing the deviation between SAF and SAR given E(SAF/SAR) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=AB,Number=A,Type=Float,Description="Allele balance at heterozygous sites: a number between 0 and 1 representing the ratio of reads showing the reference allele to all reads, considering only reads from individuals called as heterozygous">
##INFO=<ID=ABP,Number=A,Type=Float,Description="Allele balance probability at heterozygous sites: Phred-scaled upper-bounds estimate of the probability of observing the deviation between ABR and ABA given E(ABR/ABA) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=RUN,Number=A,Type=Integer,Description="Run length: the number of consecutive repeats of the alternate allele in the reference genome">
##INFO=<ID=RPP,Number=A,Type=Float,Description="Read Placement Probability: Phred-scaled upper-bounds estimate of the probability of observing the deviation between RPL and RPR given E(RPL/RPR) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=RPPR,Number=1,Type=Float,Description="Read Placement Probability for reference observations: Phred-scaled upper-bounds estimate of the probability of observing the deviation between RPL and RPR given E(RPL/RPR) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=RPL,Number=A,Type=Float,Description="Reads Placed Left: number of reads supporting the alternate balanced to the left (5') of the alternate allele">
##INFO=<ID=RPR,Number=A,Type=Float,Description="Reads Placed Right: number of reads supporting the alternate balanced to the right (3') of the alternate allele">
##INFO=<ID=EPP,Number=A,Type=Float,Description="End Placement Probability: Phred-scaled upper-bounds estimate of the probability of observing the deviation between EL and ER given E(EL/ER) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=EPPR,Number=1,Type=Float,Description="End Placement Probability for reference observations: Phred-scaled upper-bounds estimate of the probability of observing the deviation between EL and ER given E(EL/ER) ~ 0.5, derived using Hoeffding's inequality">
##INFO=<ID=DPRA,Number=A,Type=Float,Description="Alternate allele depth ratio.  Ratio between depth in samples with each called alternate allele and those without.">
##INFO=<ID=ODDS,Number=1,Type=Float,Description="The log odds ratio of the best genotype combination to the second-best.">
##INFO=<ID=GTI,Number=1,Type=Integer,Description="Number of genotyping iterations required to reach convergence or bailout.">
##INFO=<ID=TYPE,Number=A,Type=String,Description="The type of allele, either snp, mnp, ins, del, or complex.">
##INFO=<ID=CIGAR,Number=A,Type=String,Description="The extended CIGAR representation of each alternate allele, with the exception that '=' is replaced by 'M' to ease VCF parsing.  Note that INDEL alleles do not have the first matched base (which is provided by default, per the spec) referred to by the CIGAR.">
##INFO=<ID=NUMALT,Number=1,Type=Integer,Description="Number of unique non-reference alleles in called genotypes at this position.">
##INFO=<ID=MEANALT,Number=A,Type=Float,Description="Mean number of unique non-reference allele observations per sample with the corresponding alternate alleles.">
##INFO=<ID=LEN,Number=A,Type=Integer,Description="allele length">
##INFO=<ID=MQM,Number=A,Type=Float,Description="Mean mapping quality of observed alternate alleles">
##INFO=<ID=MQMR,Number=1,Type=Float,Description="Mean mapping quality of observed reference alleles">
##INFO=<ID=PAIRED,Number=A,Type=Float,Description="Proportion of observed alternate alleles which are supported by properly paired read fragments">
##INFO=<ID=PAIREDR,Number=1,Type=Float,Description="Proportion of observed reference alleles which are supported by properly paired read fragments">
##INFO=<ID=MIN_DP,Number=1,Type=Integer,Description="Minimum depth in gVCF output block.">
##INFO=<ID=END,Number=1,Type=Integer,Description="Last position (inclusive) in gVCF output record.">
##INFO=<ID=technology.Illumina,Number=A,Type=Float,Description="Fraction of observations supporting the alternate observed in reads from Illumina">
##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
##FORMAT=<ID=GQ,Number=1,Type=Float,Description="Genotype Quality, the Phred-scaled marginal (or unconditional) probability of the called genotype">
##FORMAT=<ID=GL,Number=G,Type=Float,Description="Genotype Likelihood, log10-scaled likelihoods of the data given the called genotype for each possible genotype generated from the reference and alternate alleles given the sample ploidy">
##FORMAT=<ID=DP,Number=1,Type=Integer,Description="Read Depth">
##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Number of observation for each allele">
##FORMAT=<ID=RO,Number=1,Type=Integer,Description="Reference allele observation count">
##FORMAT=<ID=QR,Number=1,Type=Integer,Description="Sum of quality of the reference observations">
##FORMAT=<ID=AO,Number=A,Type=Integer,Description="Alternate allele observation count">
##FORMAT=<ID=QA,Number=A,Type=Integer,Description="Sum of quality of the alternate observations">
##FORMAT=<ID=MIN_DP,Number=1,Type=Integer,Description="Minimum depth in gVCF output block.">
#CHROM  POS     ID      REF     ALT     QUAL    FILTER  INFO    FORMAT  PopA_001        PopA_002        PopA_003        PopA_004        PopA_005        PopA_006        PopA_007  PopA_008 PopA_009        PopA_010        PopA_011        PopA_012        PopA_013        PopA_014        PopA_015        PopA_016        PopA_017        PopA_018        PopA_019  PopA_020 PopB_001        PopB_002        PopB_003        PopB_004        PopB_005        PopB_006        PopB_007        PopB_008        PopB_009        PopB_010        PopB_011  PopB_012 PopB_013        PopB_014        PopB_015        PopB_016        PopB_017        PopB_018        PopB_019        PopB_020        PopC_001        PopC_002        PopC_003  PopC_004 PopC_005        PopC_006        PopC_007        PopC_008        PopC_009        PopC_010        PopC_011        PopC_012        PopC_013        PopC_014        PopC_015  PopC_016 PopC_017        PopC_018        PopC_019        PopC_020        PopD_001        PopD_002        PopD_003        PopD_004        PopD_005        PopD_006        PopD_007  PopD_008 PopD_009        PopD_010        PopD_011        PopD_012        PopD_013        PopD_014        PopD_015        PopD_016        PopD_017        PopD_018        PopD_019  PopD_020
```


## The first filter we will apply will be on allele balance. Allele balance is: a number between 0 and 1 representing the ratio of reads showing the reference allele to all reads, considering only reads from individuals called as heterozygous Because RADseq targets specific locations of the genome, we expect that the allele balance in our data (for real loci) should be close to 0.5 We can use the vcffilter program from vcflib.

### Filter out loci with an allele balance below 0.25 and above 0.75.
```
vcffilter -s -f "AB > 0.25 & AB < 0.75 | AB < 0.01" DP3g95p5maf05.recode.vcf > DP3g95p5maf05.fil1.vcf
```
### See how many loci are now in the VCF file
```
mawk '!/#/' DP3g95p5maf05.recode.vcf | wc -l
1156
```
```
mawk '!/#/' DP3g95p5maf05.fil1.vcf | wc -l
1148
```

### We have filtered 8 loci

### filter out sites that have reads from both strands
```
vcffilter -f "SAF / SAR > 100 & SRF / SRR > 100 | SAR / SAF > 100 & SRR / SRF > 100" -s DP3g95p5maf05.fil1.vcf > DP3g95p5maf05.fil2.vcf
```
```
mawk '!/#/' DP3g95p5maf05.fil2.vcf | wc -l
1148
```
### No additional loci filtered

### Look at  ratio of mapping qualities between reference and alternate alleles
```
vcffilter -f "MQM / MQMR > 0.9 & MQM / MQMR < 1.05" DP3g95p5maf05.fil2.vcf > DP3g95p5maf05.fil3.vcf
```
```
mawk '!/#/' DP3g95p5maf05.fil3.vcf | wc -l
1148
```

### Yet another filter that can be applied is whether or not their is a discrepancy in the properly paired status of for reads supporting reference or alternate alleles.
```
vcffilter -f "PAIRED > 0.05 & PAIREDR > 0.05 & PAIREDR / PAIRED < 1.75 & PAIREDR / PAIRED > 0.25 | PAIRED < 0.05 & PAIREDR < 0.05" -s DP3g95p5maf05.fil3.vcf > DP3g95p5maf05.fil4.vcf
```
```
mawk '!/#/' DP3g95p5maf05.fil4.vcf | wc -l
1148
```
### Remove any locus that has a quality score below 1/4 of the depth.
```
vcffilter -f "QUAL / DP > 0.25" DP3g95p5maf05.fil4.vcf > DP3g95p5maf05.fil5.vcf
```
### Create a list of the depth of each locus
```
cut -f8 DP3g95p5maf05.fil5.vcf | grep -oe "DP=[0-9]*" | sed -s 's/DP=//g' > DP3g95p5maf05.fil5.DEPTH
```
### Create a list of quality scores.
```
mawk '!/#/' DP3g95p5maf05.fil5.vcf | cut -f1,2,6 > DP3g95p5maf05.fil5.vcf.loci.qual
```
### Calculate the mean depth
```
mawk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' DP3g95p5maf05.fil5.DEPTH
4702.01
```
### Calculate mean plus 3X the square of the mean
```
python2.7 -c "print int(4702.1+3*(4702.1**0.5))"
4907
# the script from the SNP filtering tutorial was not working for me until i specified python2.7
```
### paste the depth and quality files together and find the loci above the cutoff that do not have quality scores 2 times the depth
```
paste DP3g95p5maf05.fil5.vcf.loci.qual DP3g95p5maf05.fil5.DEPTH | mawk -v x=2084 '$4 > x' | mawk '$3 < 2 * $4' > DP3g95p5maf05.fil5.lowQDloci
```
### Now we can remove those sites and recalculate the depth across loci with VCFtools
```
vcftools --vcf DP3g95p5maf05.fil5.vcf --site-depth --exclude-positions DP3g95p5maf05.fil5.lowQDloci --out DP3g95p5maf05.fil5

After filtering, kept 80 out of 80 Individuals
Outputting Depth for Each Site
After filtering, kept 881 out of a possible 1146 Sites
Run Time = 0.00 seconds
```

### Now let’s take VCFtools output and cut it to only the depth scores
```
cut -f3 DP3g95p5maf05.fil5.ldepth > DP3g95p5maf05.fil5.site.depth
```
### calculate the average depth by dividing the above file by the number of individuals: 80
```
mawk '!/D/' DP3g95p5maf05.fil5.site.depth | mawk -v x=80 '{print $1/x}' > meandepthpersite
```
### Plot data as histogram
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
```


                                             Histogram of mean depth per site

  120 ++--+---+---+---+---+---+---+--+---+---+---+---+---+---+---+---+---+---+---+---+---+--+---+---+---+---+---+--++
      +   +   +   +   +   +   +   +  +   +   +   +   +   + 'meandepthpersite' using (bin($1,binwidth)):(1.0)+****** +
      |                                                                                                             |
      |                                      *                                                                      |
  100 ++                                     *                                                                     ++
      |                                      *                                                                      |
      |                                   ** *                                                                      |
      |                                   ** **                                                                     |
   80 ++                                  ** **                                                                    ++
      |                                  *** **                                                                     |
      |                                  *******                                                                    |
   60 ++                                 *******                                                                   ++
      |                                  ********                                                                   |
      |                                  ********                                                                   |
      |                                  ********                                                                   |
   40 ++                                 ********                                                                  ++
      |                                  ********                                                                   |
      |                                ***********                                                                  |
      |                                *************                                                                |
   20 ++                               *************                                                               ++
      |                                *************                                                                |
      |                              ***************                                                                |
      +   +   +   +   +   +   +   +  *****************   +   +   +   +   +   +   +   +   +  +   +   +   +   +   +   +
    0 ++--+---+---+---+---+---+-***********************--+---+---+---+---+---+---+---+---+--+---+---+---+---+---+--++
      10  15  20  25  30  35  40  45 50  55  60  65  70  75  80  85  90  95 100 105 110 115120 125 130 135 140 145 150
                                                        Mean Depth
```
## HWE Filter
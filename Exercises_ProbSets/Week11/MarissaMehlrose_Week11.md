#Week 11 Exercise

##Calling and Filtering SNPs
```
(base) [mmehlrose@KITT ~]$ mkdir Week_11
(base) [mmehlrose@KITT ~]$ cd Week_11/
(base) [mmehlrose@KITT Week_11]$ ln -s 
/home/BIO594/Exercises/Week_11/*.fq.gz .
(base) [mmehlrose@KITT Week_11]$ dDocent

80 individuals are detected. Is this correct? Enter yes or no and press [ENTER]
yes
Proceeding with 80 individuals
dDocent detects 80 processors available on this system.
Please enter the maximum number of processors to use for this analysis.
5

Do you want to quality trim your reads?
Type yes or no and press [ENTER]?
yes

Do you want to perform an assembly?
Type yes or no and press [ENTER].
Yes

What type of assembly would you like to perform?  Enter SE for single end, PE for paired-end, RPE for paired-end sequencing for RAD protocols with random shearing, or OL for paired-end sequencing that has substantial overlap.
Then press [ENTER]
PE

Reads will be assembled with Rainbow
CD-HIT will cluster reference sequences by similarity. The -c parameter (% similarity to cluster) may need to be changed for your taxa.
Would you like to enter a new c parameter now? Type yes or no and press [ENTER]
Yes

Please enter new value for c. Enter in decimal form (For 90%, enter 0.9)
0.9

Do you want to map reads?  Type yes or no and press [ENTER]
Yes

BWA will be used to map reads.  You may need to adjust -A -B and -O parameters for your taxa.
Would you like to enter a new parameters now? Type yes or no and press [ENTER]
yes
Please enter new value for A (match score).  It should be an integer.  Default is 1.
1

Please enter new value for B (mismatch score).  It should be an integer.  Default is 4.
4

Please enter new value for O (gap penalty).  It should be an integer.  Default is 6.
6

Do you want to use FreeBayes to call SNPs?  Please type yes or no and press [ENTER]
yes


dDocent will require input during the assembly stage.  Please wait until prompt says it is safe to move program to the background.

Trimming reads and simultaneously assembling reference sequences


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
3


                                 Number of Unique Sequences present in more than X Individuals
   Number of Unique Sequences
     3500 ++-----------+-------------+------------+------------+------------+-------------+------------+-----------++
          +            +             +            +            +            +             +            +            +
          |                                                                                                         |
          |    *                                                                                                    |
          |     *                                                                                                   |
     3000 ++     *                                                                                                 ++
          |      *                                                                                                  |
          |       ***                                                                                               |
          |                                                                                                         |
     2500 ++         *                                                                                             ++
          |           *                                                                                             |
          |            ***                                                                                          |
          |               ***                                                                                       |
          |                  **                                                                                     |
     2000 ++                   ***                                                                                 ++
          |                       *****                                                                             |
          |                            *****                                                                        |
          |                                 ******                                                                  |
     1500 ++                                      **********                                                       ++
          |                                                 **************                                          |
          |                                                               *************                             |
          |                                                                            *********************        |
          +            +             +            +            +            +             +            +    *********
     1000 ++-----------+-------------+------------+------------+------------+-------------+------------+-----------++
          0            5             10           15           20           25            30           35           40
                                                     Number of Individuals

Please choose data cutoff.  Pick point right before the assymptote. A good starting cutoff might be 10% of the total number of individuals
8

dDocent assembled 1961 sequences (after cutoffs) into 1000 contigs
After filtering, kept 3134 out of a possible 3277 Sites 

.
(base) [mmehlrose@KITT Week_11]$ vcftools --gzvcf TotalRawSNPs.vcf --max-missing 0.5 --mac 3 --minQ 30 --recode --recode-INFO-all --out Total

VCFtools - 0.1.17
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--gzvcf TotalRawSNPs.vcf
	--recode-INFO-all
	--mac 3
	--minQ 30
	--max-missing 0.5
	--out Total
	--recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1959 out of a possible 3277 Sites
Run Time = 1.00 seconds

(base) [mmehlrose@KITT Week_11]$ vcftools --vcf Total.recode.vcf --minDP 3 --recode --recode-INFO-all --out TotalDP3

VCFtools - 0.1.17
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf Total.recode.vcf
	--recode-INFO-all
	--minDP 3
	--out TotalDP3
	--recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1959 out of a possible 1959 Sites
Run Time = 1.00 seconds

(base) [mmehlrose@KITT Week_11]$ vcftools --vcf TotalDP3.recode.vcf --missing-indv


Parameters as interpreted:
	--vcf TotalDP3.recode.vcf
	--missing-indv

After filtering, kept 80 out of 80 Individuals
Outputting Individual Missingness
After filtering, kept 1959 out of a possible 1959 Sites
Run Time = 0.00 seconds

(base) [mmehlrose@KITT Week_11]$ cat out.imiss
INDV	N_DATA	N_GENOTYPES_FILTERED	N_MISS	F_MISS
PopA_001	1959	0	18	0.00918836
PopA_002	1959	0	12	0.00612557
PopA_003	1959	0	5	0.00255232
PopA_004	1959	0	12	0.00612557
PopA_005	1959	0	16	0.00816743
PopA_006	1959	0	22	0.0112302
PopA_007	1959	0	8	0.00408372
PopA_008	1959	0	14	0.0071465
PopA_009	1959	0	18	0.00918836
PopA_010	1959	0	10	0.00510465
PopA_011	1959	0	13	0.00663604
PopA_012	1959	0	17	0.0086779
PopA_013	1959	0	19	0.00969883
PopA_014	1959	0	17	0.0086779
PopA_015	1959	0	11	0.00561511
PopA_016	1959	0	22	0.0112302
PopA_017	1959	0	16	0.00816743
PopA_018	1959	0	17	0.0086779
PopA_019	1959	0	24	0.0122511
PopA_020	1959	0	10	0.00510465
PopB_001	1959	0	19	0.00969883
PopB_002	1959	0	15	0.00765697
PopB_003	1959	0	20	0.0102093
PopB_004	1959	0	14	0.0071465
PopB_005	1959	0	3	0.00153139
PopB_006	1959	0	10	0.00510465
PopB_007	1959	0	17	0.0086779
PopB_008	1959	0	13	0.00663604
PopB_009	1959	0	6	0.00306279
PopB_010	1959	0	9	0.00459418
PopB_011	1959	0	13	0.00663604
PopB_012	1959	0	9	0.00459418
PopB_013	1959	0	11	0.00561511
PopB_014	1959	0	10	0.00510465
PopB_015	1959	0	19	0.00969883
PopB_016	1959	0	13	0.00663604
PopB_017	1959	0	19	0.00969883
PopB_018	1959	0	5	0.00255232
PopB_019	1959	0	18	0.00918836
PopB_020	1959	0	6	0.00306279
PopC_001	1959	0	11	0.00561511
PopC_002	1959	0	13	0.00663604
PopC_003	1959	0	11	0.00561511
PopC_004	1959	0	7	0.00357325
PopC_005	1959	0	21	0.0107198
PopC_006	1959	0	21	0.0107198
PopC_007	1959	0	23	0.0117407
PopC_008	1959	0	19	0.00969883
PopC_009	1959	0	4	0.00204186
PopC_010	1959	0	22	0.0112302
PopC_011	1959	0	10	0.00510465
PopC_012	1959	0	21	0.0107198
PopC_013	1959	0	14	0.0071465
PopC_014	1959	0	26	0.0132721
PopC_015	1959	0	12	0.00612557
PopC_016	1959	0	16	0.00816743
PopC_017	1959	0	9	0.00459418
PopC_018	1959	0	12	0.00612557
PopC_019	1959	0	22	0.0112302
PopC_020	1959	0	16	0.00816743
PopD_001	1959	0	15	0.00765697
PopD_002	1959	0	15	0.00765697
PopD_003	1959	0	13	0.00663604
PopD_004	1959	0	9	0.00459418
PopD_005	1959	0	13	0.00663604
PopD_006	1959	0	12	0.00612557
PopD_007	1959	0	19	0.00969883
PopD_008	1959	0	10	0.00510465
PopD_009	1959	0	16	0.00816743
PopD_010	1959	0	26	0.0132721
PopD_011	1959	0	16	0.00816743
PopD_012	1959	0	22	0.0112302
PopD_013	1959	0	14	0.0071465
PopD_014	1959	0	17	0.0086779
PopD_015	1959	0	13	0.00663604
PopD_016	1959	0	19	0.00969883
PopD_017	1959	0	17	0.0086779
PopD_018	1959	0	14	0.0071465
PopD_019	1959	0	20	0.0102093
PopD_020	1959	0	18	0.00918836

(base) [mmehlrose@KITT Week_11]$ mawk '$5 > 0.5' out.imiss | cut -f1 > lowDP.indv

(base) [mmehlrose@KITT Week_11]$ vcftools --vcf TotalDP3.recode.vcf --remove lowDP.indv --recode --recode-INFO-all --out TotalDP3minlow

Parameters as interpreted:
	--vcf TotalDP3.recode.vcf
	--remove lowDP.indv
	--recode-INFO-all
	--out TotalDP3minlow
	--recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1959 out of a possible 1959 Sites
Run Time = 1.00 seconds

(base) [mmehlrose@KITT Week_11]$ vcftools --vcf TotalDP3minlow.recode.vcf --max-missing 0.95 --maf 0.05 --recode --recode-INFO-all --out TotDP3minlowmaf5 --min-meanDP 20


Parameters as interpreted:
	--vcf TotalDP3minlow.recode.vcf
	--recode-INFO-all
	--maf 0.05
	--min-meanDP 20
	--max-missing 0.95
	--out TotDP3minlowmaf5
	--recode

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 1148 out of a possible 1959 Sites
Run Time = 1.00 seconds

(base) [mmehlrose@KITT Week_11]$ curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/dDocent_filters
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  9713  100  9713    0     0  28345      0 --:--:-- --:--:-- --:--:-- 28345

(base) [mmehlrose@KITT Week_11]$ chmod +x dDocent_filters
(base) [mmehlrose@KITT Week_11]$ ./dDocent_filters

This script will automatically filter a FreeBayes generated VCF file using criteria related to site depth,
quality versus depth, strand representation, allelic balance at heterzygous individuals, and paired read representation.
The script assumes that loci and individuals with low call rates (or depth) have already been removed. 

Contact Jon Puritz (jpuritz@gmail.com) for questions and see script comments for more details on particular filters 

Usage is bash dDocent_filters.sh VCF_file Output_prefix

(base) [mmehlrose@KITT Week_11]$ vcfallelicprimitives TotDP3minlowmaf5Filt.FIL.recode.vcf --keep-info --keep-geno > TotDP3minlowmaf5Filt.prim.vcf
(base) [mmehlrose@KITT Week_11]$ vcftools --vcf TotDP3minlowmaf5Filt.prim.vcf --remove-indels --recode --recode-INFO-all --out SNP.TotFilt

VCFtools - 0.1.17
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf TotDP3minlowmaf5Filt.prim.vcf
	--recode-INFO-all
	--out SNP.TotFilt
	--recode
	--remove-indels

After filtering, kept 80 out of 80 Individuals
Outputting VCF file...
After filtering, kept 803 out of a possible 1028 Sites
Run Time = 0.00 seconds
```

**The filtering left us with 803 SNP calls. The tutorial said that we should feel confident in this filtering process, so I stopped there!**


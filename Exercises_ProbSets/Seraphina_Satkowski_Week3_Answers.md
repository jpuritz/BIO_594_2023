# Seraphina's Problem Set 1
## Due 2/15/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week3_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document



## Problems

1. Let's imagine a 5 bp section of a genome, and that there is a SNP (A/G) in basepair 3.  Assume that we are genotyping **one** heterozygous individual (50% chance of sequencing either allele).  Please calculate the probability for the following sequencing reads:
    
     **Set 1**

     ```
    AAATG
    AAATG
    AAATG
    ```
     **Set 1 answer**

    ```
    (.5)(.5)(.5)= 0.125 probability 
    ```

    **Set 2**

    ```
    AAATG
    AAATG
    AAATG
    AAATG
    AAATG
    ```
    **Set 2 Answer**

    ```
    (.5)(.5)(.5)(.5)(.5) = 0.03125 probability
    ```


    **Set 3**

    ```
    AAATG
    AAGTG
    AAATG
    AAATG
    AAATG
    ```
    **Set 3 Answer**
    $$ P(x=m)=\frac{5!}{(5-4)!4!}(.5)^5(1-.5)^{5-4}
    = .078125
    
##
#

2. Way back in old 1993, Spitze reported the following number of genotypes at the *PGI* allozyme locus in the *Daphnia* population in Nothing Pond:

|Genotype|Count|
|--------|-----|
|*SS*| 11|
|*SS-*|55|
|*S-S-*|61|

    A. What are the observed genotype and allele frequencies?

|Observed Genotype|Freq|
|--------|----|
|*SS*| 0.0866|
*SS-* | 0.443|
*S-S-* | 0.4803|


**Observed Allele Frequency**

**S** 
$$ p= \frac {2(11)+55}{2(127)}= .303 $$
**S-** 
$$ q= \frac {55+ 2(61)}{2(127)}= .696 $$
# 

    B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

Expected number of each genotype assuming HW proportions 

**SS**
$$ (p^2N) $$
$$ .303^2(127)$$
$$ = 11.65 $$

**SS-**
$$ (2pq N) $$
$$ 2(.303)(.696)((127)) $$
$$ = 53.5 $$

**S-S-**
$$ q^2 N $$
$$ .696^2 (127) $$
$$ 61.5 $$

Chi Squared Test: 
$$ \sum \frac {(Observed - Expected)^2}{Expected} $$
$$ = \frac {(11-11.65)^2}{11.65} + \frac {(55-53.5)^2}{53.5} + \frac {(61.5-61)^2}{61} $$
$$ = .03 + .04 + 0.004 = .074 $$
#

    C. What is the observed heterozygosity in this population and what is the expected heterozygosity?

Observed Heterozygosity
(**SS-**) was ***55***

Expected Heterozygosity was: 

$$ (2pqN) $$
$$ (2(.303)(.696)(127))$$
$$ = 53.5 $$
#

3.  Let's imagine another small population with the following genotype counts at a single SNP:

|Genotype|Count|
|--------|-----|
|A/A|0|
|A/G|10|
|GG|0|

    A. What are the observed genotype and allele frequencies?
|Observed Genotype| Freq|
|-----------------|-----|
|A/A| 0|
|A/G| 1.0|
|G/G| 0|
 
|Observed Allele| Freq|
|---------------|-----|
|A| .5|
|G| .5|

#



    B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

**A/A Expected Freq**
$$ p^2N $$
$$ = .5^2(10) $$
$$ = 1.5 $$

**A/G Expected Freq**
$$ 2pqN $$
$$ 2(.5)(.5)(10) $$
$$ = 5 $$

**G/G Expected Freq**
$$ q^2N $$
$$ (.5)^2 (10) $$
$$ = 1.5 $$

**Chi-Squard Test**

$$ X^2 = \sum \frac {(Observed - Expected)^2}{Expected} $$ 
$$ = \frac {(0-1.5)^2}{1.5} + \frac {(0-1.5)^2}{1.5} + \frac {(10-5)^2}{5} $$
$$ = 1.5 + 1.5 + 5 = 8 $$

The observed frequencies do not agree with HW expecttations and are above 3.84, therefore we reject the null hypothesis

We know 3.84 is our significant P because 3 genotypes - 2 alleles = 1 degree of freedom
#

    C. Simulate one generation of random mating (you don't need to code this simulation; it can be by hand):
        * Pair off the ten indivduals into mating pairs
        * Randomly pick two expected offspring genotypes per pair (10 offspring genotypes)
        * Create a new genotype table from the offsrping only (should only be 10 genotypes)
        * Repeat subqestions A and B on the new genotype table

|   | A|G|
|---|--|-|
|A|AA|AG|
|G|AG|GG|

Repeat 5x for 10 individuals to be produced

|Pairs|
|-----|
|AA AG|
|AG GG|
|GG GG|
|AA GG|
|AA AA|

|Observed Genotype|Counts|Freq|
|------------|------|----|
|AA| 4|0.4|
|AG| 2|0.2|
|GG|4|0.4|

|Observed Allele|Counts|Freq|
|------------|------|----|
|A| 10|0.5|
|G| 10|0.5|

**Expected Genotype**
$$ p = \frac{2(4)+2}{2(10)} $$
$$ = 0.5 $$

$$ q = \frac{2(4)+2}{2(10)} $$
$$ = 0.5 $$

|Expected Genotype|Freq|
|--------------|----|
|AA|$$ p^2N = 2.5 $$ |
|AG|$$ 2pqN = 5 $$|
|GG|$$ q^2N = 2.5 $$|

$$ 3 Genotypes - 2 Alleles = 1 DOF $$
$$ P=0.05=3.84 $$

**Chi Squared Test**
$$ X^2 = \sum \frac {(Observed - Expected)^2}{Expected} $$ 
$$ = \frac {(4-2.5)^2}{2.5} + \frac {(2-5)^2}{5} + \frac {(4-2.5)^2}{2.5} $$
$$ = 0.9 + 1.8 + 0.9 = 3.6 $$

We accept the null hypothesis as 3.6 < 3.84 
#


4.  Take a look at Gel C below:


Gel C is the banding pattern from two AFLP markers (the upper and lower sets of bands).
    
    A. Estimate the frequency (q) of the null allele of each of the two AFLP markers assuming HWE.
    
Total number of individuals: $$ 6+101+39+14=160 $$

|**Genotypes**| |
|-------------|-|
|U/U| Band present|
|U/nU| Band present|
|nU/nU|No Band Present|

**Upper Markers:**
|Genotype|frequency|
|-------|---------|
|U/U, U/nU | $$\frac{140}{160}=.875 $$|
|nU/nU| $$\frac{20}{160}=.125 $$|

null allele freq 
$$ \sqrt(.125) = .354 $$

**Lower Markers**
|Genotype|Frequency|
|--|--|
|U/U,U/nU| $$\frac{45}{160}= .28 $$
|nU/nU| $$\frac{115}{160} = .72 $$

null allele freq: $$\sqrt(.72) = .85 $$



    B. Estimate the percentage of *band-present* individuals (not the overall frequencies) that are heterozygous at each of the two markers.  What biological principle does the difference between these two percentages illustrate?


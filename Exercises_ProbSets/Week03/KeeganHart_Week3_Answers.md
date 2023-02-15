# Keegan Hart Problem Set 1
## Problems
### 1. Let's imagine a 5 bp section of a genome, and that there is a SNP (A/G) in basepair 3. Assume that we are genotyping one heterozygous individual (50% chance of sequencing either allele). Please calculate the probability for the following sequencing reads:

**Set 1**
    
    ```
    AAATG
    AAATG
    AAATG
    ```
**Answer Set 1**

```
The probability of having A at basepair 3 in all 3 reads of a heterozygous individual is:
1/2 * 1/2 * 1/2 = 1/8
```

 **Set 2**

    ```
    AAATG
    AAATG
    AAATG
    AAATG
    AAATG
    ```
**Answer Set 2**

```
The probability of having A at basepair 3 in all 5 reads of a heterozygous individual is:
1/2 * 1/2 * 1/2 * 1/2 * 1/2 = 1/32
```

 **Set 3**

    ```
    AAATG
    AAGTG
    AAATG
    AAATG
    AAATG
    ```
**Answer Set 3**

```
The probability of having 4 reads with A in basepair 3 and one read with G in basepair 3 is: 
```
$$  P_x = \frac {5!}{(5-4)!* 4!} * \frac{1}{2}^4 * \frac{1}{2}^1 = \frac{5}{32}$$

### 2. Way back in old 1993, Spitze reported the following number of genotypes at the *PGI* allozyme locus in the *Daphnia* population in Nothing Pond:

|Genotype|Count|
|--------|-----|
|*SS*| 11|
|*SS-*|55|
|*S-S-*|61|

### A. What are the observed genotype and allele frequencies?
### B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?
### C. What is the observed heterozygosity in this population and what is the expected heterozygosity?
\
 **Answer Set A**
 
genotype frequency :
$$ SS = 11/127 = 0.087 $$
$$ SS^- = 55/127 = 0.43 $$
$$ S^-S^- = 61/127 = 0.48$$

allelic frequency: 
$$ S = \frac{2(11) + 55}{2(127)} = 0.3 $$
$$ S^- = \frac {2(61) + 55}{2(127)} - 0.7$$

 **Answer Set B**

 genotypic frequencies under Hardy-Weinberg:
$$ SS = 0.3^2 * 127= 11.43$$
$$ S^-S^- = .7^2 * 127 = 62.23 $$
$$ SS^- = (2)(.3)(.7) * 127  = 53.34$$
   
   Chi square: There are 1 degrees of freedom due to their being 3 genotypes and 2 alleles
$$ x^2 = \frac{(11-11.43)^2}{11.43} + \frac{(61-62.23)^2}{62.23} + \frac{(55-53.34)^2}{53.34} = 0.016 + 0.052 + 0.024 = 0.09$$
    1.2 < 3.84 so observed frequencies agree with HWE expectations

 **Answer Set C**
\
    expected heterozygosity:
$$ 2pq = 53.34$$
\
    observed heterozygosity:
    $$frequency \space of \space SS^-$$
### 3.  Let's imagine another small population with the following genotype counts at a single SNP:

|Genotype|Count|
|--------|-----|
|A/A|0|
|A/G|10|
|GG|0|

### A. What are the observed genotype and allele frequencies?
### B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?
### C. Simulate one generation of random mating (you don't need to code this simulation; it can be by hand):
        * Pair off the ten indivduals into mating pairs
        * Randomly pick two expected offspring genotypes per pair (10 offspring genotypes)
        * Create a new genotype table from the offsrping only (should only be 10 genotypes)
        * Repeat subqestions A and B on the new genotype table

**Answer Set A**
\
 observed genotype frequency:

 $$AA = \frac{0}{10} = 0$$
 $$GG = \frac{10}{10} = 1$$
 $$AG = \frac{0}{10} = 0$$

allele frequency:
$$A = \frac{(2 * 0) + 10}{20}$$
$$G = \frac{(2 * 0) + 10}{20}$$

**Answer Set B**

genotypic frequencies expected under Hardy-Weinberg:
 $$AA = \frac{1}{2}^2 * 10 = 1.5$$
 $$GG = \frac{1}{2}^2 * 10 = 1.5$$
 $$AG = 2 * \frac{1}{2} * \frac{1}{2} *10 = 5$$

 Chi square: There are 1 degrees of freedom due to their being 3 genotypes and 2 alleles
$$x^2 = \frac{(0-1.5)^2}{1.5} + \frac{(0-1.5)^2}{1.5} + \frac{(10-5)^2}{5} = 1.5 + 1.5 + 5 = 8$$
    8 > 3.84 (value for 1 degrees of freedom) so observed frequencies do not agree with HWE expectations

 
**Answer Set C**

    
|   	|   A	|  G 	|
|---	|---	|---	|
|   A	|  AA 	|   AG	| 
|   G	|  AG 	|   GG	| 


 X 5 for all mating pairs

pair 1) AA GG\
pair 2) AG AG\
pair 3) AA AA\
pair 4) GG GG\
pair 5) AG AA

|Genotype|Count|
|--------|-----|
|A/A|4|
|A/G|3|
|GG|3|

observed genotype frequencies:
$$AA = \frac{4}{10} = 0.4$$
$$GG = \frac{3}{10} = 0.3$$
$$AG = \frac{3}{10} = 0.3$$

 allele frequencies:
$$A = \frac{(2 * 4) + 3}{20} = \frac{11}{20} = 0.55$$
$$G = \frac{(2 * 3) + 3}{20} = \frac{9}{20} = 0.45$$

 genotypic frequencies under HWE:
$$AA = 0.55^2 * 10 = 3.025$$
$$GG = 0.45^2 * 10 = 2.025$$
$$AG = 2 * 0.55 * 0.45 *10 = 4.95$$

Chi square: There are 1 degrees of freedom due to their being 3 genotypes and 2 alleles
$$x^2 = \frac{(4-3.025)^2}{3.025} + \frac{(3-2.025)^2}{2.025} + \frac{(3-4.95)^2}{4.95} = 0.31 + 0.469 + 0.77 = 1.549$$
1.549 < 3.84 so observed frequencies agree with HWE expectations

<br>

### 4. Take a look at Gel C below:


![img](./img/February%209%2C%202023/IMG_0524.jpeg)

Gel C is the banding pattern from two AFLP markers (the upper and lower sets of bands).
    
    A. Estimate the frequency (q) of the null allele of each of the two AFLP markers assuming HWE.
    
    B. Estimate the percentage of *band-present* individuals (not the overall frequencies) that are heterozygous at each of the two markers.  What biological principle does the difference between these two percentages illustrate?

**Answer Set A**
\
Genotype frequencies for Bottom band:
|Genotypes|Count|Frequency| Expected
|--------|-----|--------|------------|
|$$BB, Bnb$$|$$6 + 39 = 45$$|$$45/160 = 0.28$$|$$p^2N + 2pqN$$
|$$nbnb$$|$$ 101+ 14 = 115$$|$$115/160 = 0.72$$|$$q^2N $$|

Genotype frequencies for Top band:
|Genotypes|Count|Frequency| Expected
|--------|-----|--------| ----------|
|$$TT, Tnt$$|$$101 + 39 = 140$$|$$140/160 = 0.875$$|$$p^2N + 2pqN$$|
|$$ntnt$$|$$6+ 14 = 20 $$|$$20/160 = 0.125$$|$$q^2N$$|


frequency of null alleles:
$$nb = \sqrt{0.25} = 0.5$$
$$nt = \sqrt{0.125} = 0.35$$

**Answer Set B**

If we have the two r values (null allele frequencies) of 0.35 and 0.5 how do we calculate the p and q values to then determine 2pq for each marker?

Bottom band:
$$p^2N+2pqN =45$$
$$ (160)(p^2) + (2)(p)(0.5)(160)=45$$
$$160p^2 + 160p = 45$$
$$p^2 +p = 45/160$$
$$p^2 + p - 0.28125 = 0$$
$$p = 0.229$$
$$2pq = (2)(0.229)(0.5) = 0.229$$
$$2pqN = (0.229)(160) = 36.64 $$
\
Top band:
$$p^2N+2pqN =140$$
$$ (160)(p^2) + (2)(p)(0.35)(160)=140$$
$$160p^2 + 112p = 140$$
$$160p^2 +112p - 140= 0$$
$$p = 0.65$$
$$2pq = 2(0.65)(0.35) = 0.455$$
$$2pqN = (0.455)(160) =72.8 $$

The biological principle this represents is: linkage disequilibrium?
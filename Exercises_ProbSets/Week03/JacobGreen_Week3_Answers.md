# Problem Set 1

## Due 2/15/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week3_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document

I worked with Zoe, Megan, Keegan, and Seraphina

## Problems

### 1. Let's imagine a 5 bp section of a genome, and that there is a SNP (A/G) in basepair 3.  Assume that we are genotyping **one** heterozygous individual (50% chance of sequencing either allele).  Please calculate the probability for the following sequencing reads:

#### Set 1

```text
AAATG
AAATG
AAATG

P(A) X P(A) X P(A)
(1/2) X (1/2) X (1/2) = .125

Using the binomial distribution function
```

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\

P = \frac{3!}{3!(3-3)!} * \frac{1}{2}^3 * \frac{1}{2}^0\\

P = \frac{6}{6*1} * \frac{1}{8} * \frac{1}{1} = 1 * \frac{1}{8} * 1 = \frac{1}{8}\\
P = 0.125
$$

### Set 2

```text
AAATG
AAATG
AAATG
AAATG
AAATG


P(A) X P(A) X P(A) X P(A) X P(A)
(1/2) X (1/2) X (1/2) X (1/2) X (1/2) = .03125
```

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\
P = \frac{5!}{5!(5-5)!} * \frac{1}{2}^5 * \frac{1}{2}^0\\
P = \frac{120}{120*1} * \frac{1}{32} * \frac{1}{1} = 1 * \frac{1}{32} * 1 = \frac{1}{32}\\
P = 0.03125
$$

### Set 3

```text
AAATG
AAGTG
AAATG
AAATG
AAATG


P(A) X P(G) X P(A) X P(A) X P(A)

(1/2) X (1/2) X (1/2) X (1/2) X (1/2) = .03125

This is not correct though. There is an issue with how is calculate the probabilty of all the A events with the G event. Here the binomial distribution equation comes in handy.
```

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\
P = \frac{5!}{4!(5-4)!} * \frac{1}{2}^4 * \frac{1}{2}^1\\
P = \frac{120}{24*1} * \frac{1}{16} * \frac{1}{2} = \frac{120}{768}= \frac{120}{768}\\
P = 0.15625
$$

### 2. Way back in old 1993, Spitze reported the following number of genotypes at the *PGI* allozyme locus in the *Daphnia* population in Nothing Pond

<center>

|Genotype|Count|
|--------|-----|
|*SS*| 11|
|*SS-*|55|
|*S-S-*|61|

</center>

#### A. What are the observed genotype and allele frequencies?

* Total sampled = 127

* Genotype frequencies
  * $SS = (11/127) = 0.087$
  * $SS- = (55/127) = 0.43$
  * $S-S- = (61/127) = 0.48$
  
* Allele Frequecies
  * $q = S = \frac{2*SS + SS-}{2N}$

    $q = \frac{2*11 + 55}{2*127}$
  
    $q= \frac{22 + 55}{254}$

    $q = 0.30$

  * $p = S- = \frac{2*S-S- + SS-}{2N}$

    $p = \frac{2*61 + 55}{2*127}$
  
    $p= \frac{55 + 177}{254}$

    $p = 0.70$

#### B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

```text
Hardy Weinberg equation:
```

$$
(p + q)^2 = p^2 + 2pq + q^2
$$

* $p^2 x N = 0.30^2 * 127 = 11.43$

* $2pq x N = 2(.30)(.70) * 127 = 53.34$

* $q^2 x N = .70^2 * 127 = 62.23$

```text
Apply Chi Squared equation:
```

* Chi Squared: $\sum(O-E)^2 / E$

  * $x2 = \frac{(11-11.43)^2}{11.43} + \frac{(55-53.34)^2}{53.34} + \frac{(61 - 62.23)^2}{62.23}$

  * $x2 = 0.016 + 0.052 + 0.024$

  * $x2 = 0.09$

```text
Since we have 2 alleles and three genotypes our degress of freedom is 1 and our alpha is 0.05

Our x2 value of 0.09 is smaller than the Chi squared table value of 3.84. Therefore we would accept the null hypothesis that this locus is in HW equilibrium.
```

#### C. What is the observed heterozygosity in this population and what is the expected heterozygosity?

* Observed heterozygosity (Ho) = Genotype frequency of (SS-) = 0.43

* Expected heterozygosity $(He) = 1 - \sum(p_i^2)$
  * $He = 1 - (p^2 + q^2)$
  * $He = 1 - (0.303^2 + 0.697^2)$
  * $He = 1 - (0.092 + 0.486)$
  * $He = 1 - 0.578$
  * $He = 0.422$

### 3. Let's imagine another small population with the following genotype counts at a single SNP

<center>

|Genotype|Count|
|--------|-----|
|A/A|0|
|A/G|10|
|G/G|0|

</center>

#### A. What are the observed genotype and allele frequencies?

* Total sampled = 10

* Genotype frequencies
  * $A/A = (0/10) = 0$
  * $A/G = (10/10) = 1$
  * $G/G = (0/10) = 0$
  
* Allele frequencies  
  * $q = A = \frac{2*AA + AG}{2N}$

    $q = \frac{2*0 + 10}{2*10}$
  
    $q= \frac{0 + 10}{20}$ 

    $q = 0.5$

  * $p = G = \frac{2*GG + AG}{2N}$

    $p = \frac{2*0 + 10}{2*10}$
  
    $p= \frac{0 + 10}{20}$

    $p = 0.5$

#### B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

```text
Hardy Weinberg equation:
```

$$
(p + q)^2 = p^2 + 2pq + q^2
$$

* $p^2 * N = 0.5^2 * 10 = 2.5$

* $2pq * N = 2(.5)(.5) * 10 = 5$

* $q^2 * N = .5^2 * 10 = 2.5$

```text
Apply Chi Squared equation:
```

* Chi Squared: $\sum\frac{(O-E)^2}{E}$

  * $x2 = \frac{(0-2.5)^2}{2.5} + \frac{(10-5)^2}{5} + \frac{(0 - 2.5)^2}{2.5}$

  * $x2 = 2.5 + 5 + 2.5$

  * $x2 = 10$

```text
Since we have 2 alleles and three genotypes our degress of freedom is 1 and our alpha is 0.05

Our x2 value of 10 is greater than the Chi squared table value of 3.84. Therefore we would reject the null hypothesis that this locus is in HW equilibrium.
```

#### C. Simulate one generation of random mating (you don't need to code this simulation; it can be by hand)

* Pair off the ten indivduals into mating pairs
* Randomly pick two expected offspring genotypes per pair (10 offspring genotypes)
* Create a new genotype table from the offsrping only (should only be 10 genotypes)
* Repeat subquestions A and B on the new genotype table

<center>

|Genotype|Count|
|--------|-----|
|A/A|5|
|A/G|3|
|G/G|2|

</center>

#### A. What are the observed genotype and allele frequencies?

* Total sampled = 10

* Genotype frequencies
  * $A/A = (5/10) = 0.5$
  * $A/G = (3/10) = 0.3$
  * $G/G = (2/10) = 0.2$
  
* Allele frequencies  
  * $q = A = \frac{2*AA + AG}{2N}$

    $q = \frac{2*5 + 3}{2*10}$
  
    $q= \frac{0 + 10}{20}$ 

    $q = 0.65$

  * $p = G = \frac{2*GG + AG}{2N}$

    $p = \frac{2*2 + 3}{2*10}$
  
    $p= \frac{4 + 3}{20}$

    $p = 0.35$

#### B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

```text
Hardy Weinberg equation:
```

$$
(p + q)^2 = p^2 + 2pq + q^2
$$

* $p^2 * N = 0.65^2 * 10 = 4.23$

* $2pq * N = 2(.65)(.35) * 10 = 4.54$

* $q^2 * N = 0.35^2 * 10 = 1.23$

```text
Apply Chi Squared equation:
```

* Chi Squared: $\sum\frac{(O-E)^2}{E}$

  * $x2 = \frac{(5-4.23)^2}{4.23} + \frac{(3-4.54)^2}{4.54} + \frac{(2 - 1.23)^2}{1.23}$

  * $x2 = 0.14 + 0.52 + 0.48$

  * $x2 = 1.14$

```text
Since we have 2 alleles and three genotypes our degress of freedom is 1 and our alpha is 0.05

Our x2 value of 1.14 is smaller than the Chi squared table value of 3.84. Therefore we would accept the null hypothesis that this locus is in HW equilibrium.
```

### 4. Take a look at Gel C below

![img](./img/February%209%2C%202023/IMG_0524.jpeg)

Gel C is the banding pattern from two AFLP markers (the upper and lower sets of bands).

A. Estimate the frequency (q) of the null allele of each of the two AFLP markers assuming HWE.

Genotypes: null/lower, upper/null , null/lower, upper/lower, null/null

Total mumber of individuals:

$6+ 101+ 39+ 14 = 160$

Genotype Frequency

|  Genotype   | Count | Frequency        |
|-------------|-------|------------------|
| null/lower  |   6   | 6/160   =  0.0375  |
| upper/null  |  101  | 101/160 = 0.63125 |
| null/lower  |   39  | 39/160  = 0.24375 |
| null/null   |   14  | 14/160  = 0.0875 |

The frequency the null alleles is sqrt(0.0875), or 0.296, because the expected genotype frequency of the null/null will be the q^2. Since in this case q^2 = 0.0875, q = 0.296.

Alt answer by locus:

Upper locus Genotypes:

* U/U, U/nU - band present

* nU/nU - no band present

Total number of individuals: $6+ 101+ 39+ 14 = 160$

Genotype Frequency

|  Genotype   |     Count     |   Frequency        |
|-------------|---------------|--------------------|
| U/U, U/nU   | 101+39 = 140  | 140/160 =  0.875   |
| nU/nU       | 6+14 = 20     | 20/160 = 0.125     |

The frequency the null alleles is sqrt(0.125), or 0.354, because the expected genotype frequency of the null/null will be the q^2. Since in this case q^2 = 0.125, q = 0.354.

Lower locus Genotypes:

* L/L, L/nL - band present

* nL/nL - no band present

Total number of individuals: 6+ 101+ 39+ 14 = 160

Genotype Frequency

|  Genotype   |     Count     |   Frequency        |
|-------------|---------------|--------------------|
| L/L, L/nL   | 6+39 = 45     | 45/160 =  0.28125  |
| nL/nL       | 101+14 = 115  | 115/160 = 0.71875  |

B. Estimate the percentage of *band-present* individuals (not the overall frequencies) that are heterozygous at each of the two markers.  What biological principle does the difference between these two percentages illustrate?

Review answers from Jon

Upper: $\frac{2pq}{p^2 + 2pq} = 0.523$

Lower: $\frac{2pq}{p^2 + 2pq}= 0.918$

This demonstrates homozygotic dominance.
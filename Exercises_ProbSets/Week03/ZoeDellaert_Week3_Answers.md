# Problem Set 1

## Due 2/15/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week3_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document

### Discussed some answers with Jacob, Keegan, and Seraphina

## Problems

1. Let's imagine a 5 bp section of a genome, and that there is a SNP (A/G) in basepair 3.  Assume that we are genotyping **one** heterozygous individual (50% chance of sequencing either allele).  Please calculate the probability for the following sequencing reads:

**Set 1**
```
    AAATG
    AAATG
    AAATG
```
- This individual has one allele that is AAATG and one allele that is AAGTG.
- Probability: (1/2) * (1/2) * (1/2) = (1/8) = 0.125

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\
P = \frac{3!}{3!(3-3)!} * \frac{1}{2}^3 * \frac{1}{2}^0\\
P = \frac{6}{6*1} * \frac{1}{8} * \frac{1}{1} = 1 * \frac{1}{8} * 1 = \frac{1}{8}\\
P = 0.125
$$

**Set 2**
```
    AAATG
    AAATG
    AAATG
    AAATG
    AAATG
```
- This individual has one allele that is AAATG and one allele that is AAGTG.
- Probability: (1/2) * (1/2) * (1/2) * (1/2) * (1/2) = (1/32) = 0.03125

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\
P = \frac{5!}{5!(5-5)!} * \frac{1}{2}^5 * \frac{1}{2}^0\\
P = \frac{120}{120*1} * \frac{1}{32} * \frac{1}{1} = 1 * \frac{1}{32} * 1 = \frac{1}{32}\\
P = 0.03125
$$

 **Set 3**
```
    AAATG
    AAGTG
    AAATG
    AAATG
    AAATG
```
- This individual has one allele that is AAATG and one allele that is AAGTG.
- Conditional probability
    - four reads are AAATG and one is AAGTG

$$
P = \frac{n!}{k!(n-k)!} * p^x * q^{n-k}\\
P = \frac{5!}{4!(5-4)!} * \frac{1}{2}^4 * \frac{1}{2}^1\\
P = \frac{120}{24*1} * \frac{1}{16} * \frac{1}{2} = \frac{120}{768}= \frac{120}{768}\\
P = 0.15625
$$

2. Way back in old 1993, Spitze reported the following number of genotypes at the *PGI* allozyme locus in the *Daphnia* population in Nothing Pond:

    |Genotype|Count|
    |--------|-----|
    | *SS*   | 11  |
    | *SS-*  | 55  |
    | *S-S-* | 61  |

    A. What are the observed genotype and allele frequencies?

- Genotype frequencies:
    - Total number: 127

        | Genotype |     Frequency   |
        |----------|-----------------|
        | *SS*     | 11/127 = 0.0866 |
        | *SS-*    | 55/127 = 0.433  |
        | *S-S-*   | 61/127 = 0.480  |

- Allele Frequencies:

$$
    p = S = \frac{2*NSS + NSS-}{2N} = \frac{2*11 + 55}{2*127} = \frac{77}{254} = 0.303\\
    q = S- = \frac{2*NS-S- + NSS-}{2N} = \frac{2*61 + 55}{2*127} = \frac{177}{254} = 0.697
$$

    B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

$$
(p + q)^2 = p^2 + 2pq + q^2\\
(S + S-)^2 = (S)^2 + 2(S)(S-) + (S-)^2\\
(0.303 + 0.697)^2 = (0.303)^2 + 2(0.303)(0.697) + (0.697)^2\\
1 = 0.09181 + 0.4224 + 0.4858
$$

        | Genotype |      Expected Frequency   | Expected Count      |
        |----------|---------------------------|---------------------|
        | *SS*     | (0.303)^2 = 0.09181       | 127*0.09181 = 11.66 |
        | *SS-*    | 2(0.303)(0.697) = 0.4224  | 127*0.4224 = 53.64  |
        | *S-S-*   | (0.697)^2 =  0.4858       | 127*0.4858 = 61.70  |

Using count numbers:
- Chi Squared: Sum of (O-E)^2 / E

- Chi Squared = $\frac{(11 - 11.66)^2}{11.66} + \frac{(55 - 53.64)^2}{53.64} + \frac{(61 - 61.70)^2}{61.70}$
- $= 0.03736 + 0.03448 + 0.007942$
- $= 0.079782$

    The chi-squared statistic is 0.079782. For this example the degrees of freedom is equal to 1 (3 genotypes - 2 alleles). The chi-square critical value for one degree of freedom with an alpha of 0.05 is 3.84. 0.079782 < 3.84, so the observed genotype frequencies are not significantly different from the expected genotype frequencies. They agree with the HWE expectations.

    C. What is the observed heterozygosity in this population and what is the expected heterozygosity?

- Observed heterozygosity: Genotype frequency of SS-, or 0.433.

- Expected heterozygosity:
    - He = 1 - Sum($p_i ^ 2$)
    - He = $1 - (p^2 + q^2)$
    - He = $1 - (0.303^2 + 0.697^2)$
    - He = 1 - (0.091809 + 0.485809)
    - He = 1 - 0.577618
    - He = 0.422382

3. Let's imagine another small population with the following genotype counts at a single SNP:

    |Genotype|Count|
    |--------|-----|
    |  A/A   |  0  |
    |  A/G   |  10 |
    |  G/G   |  0  |

    A. What are the observed genotype and allele frequencies?

- Genotype frequencies:
    - Total number: 10

    | Genotype |     Frequency   |
    |----------|-----------------|
    | *A/A*    |     0           |
    | *A/G*    | 10/10 = 1       |
    | *G/G*     |     0          |

- Allele Frequencies:
    - $p = A = \frac{2N_{A/A} + N_{A/G}}{2N} = \frac{2*0 + 10}{2 * 10} = \frac{10}{20} = 0.5$
    - $q = G = \frac{2N_{G/G} + N_{A/G}}{2N} = \frac{2*0 + 10}{2 * 10} = \frac{10}{20} = 0.5$

    B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

    - $(p + q)^2 = p^2 + 2pq + q^2$

    - $(A + G)^2 = (A)^2 + 2(A)(G) + (G)^2$

    - $(0.5 + 0.5)^2 = (0.5)^2 + 2(0.5)(0.5) + (0.5)^2$
    - $1 = 0.25 + 0.5 + 0.25$ 

        | Genotype |      Expected Frequency   | Expected Count  |
        |----------|---------------------------|-----------------|
        | *SS*     | (0.5)^2 = 0.25            | 10*0.25 = 2.5   |
        | *SS-*    | 2(0.5)(0.5) = 0.5         | 10*0.5 = 5      |
        | *S-S-*   | (0.5)^2 = 0.25            | 10*0.25 = 2.5   |

    Using count numbers:
    - Chi Squared: Sum of (O-E)^2 / E
    - Chi Squared = $\frac{(0 - 2.5)^2}{2.5} + \frac{(10-5)^2}{5} + \frac{(0 - 2.5)^2}{2.5}$
    - $= \frac{6.25}{2.5} + \frac{25}{5} + \frac{6.25}{2.5}$
    - $= 2.5 + 5 + 2.5$
    - $= 10$

    The chi-squared statistic is 10. For this example the degrees of freedom is equal to 1 (3 genotypes - 2 alleles). The chi-square critical value for one degree of freedom with an alpha of 0.05 is 3.84. 10 > 3.84, so the observed genotype frequencies are significantly different from the expected genotype frequencies. They do not agree with the HWE expectations.

    C. Simulate one generation of random mating (you don't need to code this simulation; it can be by hand):

    * Pair off the ten indivduals into mating pairs
    * Randomly pick two expected offspring genotypes per pair (10 offspring genotypes)
    * Create a new genotype table from the offspring only (should only be 10 genotypes)
    * Repeat subqestions A and B on the new genotype table

    F1 offspring genotypes:

    |Genotype|Count|
    |--------|-----|
    |  A/A   |  2  |
    |  A/G   |  7  |
    |  G/G   |  1  |

    C - A. What are the observed genotype and allele frequencies?

- Genotype frequencies:
    - Total number: 10

    | Genotype |     Frequency   |
    |----------|-----------------|
    | *A/A*    |    2/10 = 0.2   |
    | *A/G*    |    7/10 = 0.7   |
    | *G/G*    |    1/10 = 0.1   |

- Allele Frequencies:
    - $p = A = \frac{2N_{A/A} + N_{A/G}}{2N} = \frac{2*2 + 7}{2 * 10} = \frac{11}{20} = 0.55$
    - $q = G = \frac{2N_{G/G} + N_{A/G}}{2N} = \frac{2*1 + 7}{2 * 10} = \frac{9}{20}  = 0.45$

    C - B. Given the observed allele frequencies, what are the genotypic frequencies expected under Hardy-Weinberg?  Using a chi-square test, how well do the observed genotype frequences agree with the HWE expecations?

    - $(p + q)^2 = p^2 + 2pq + q^2$

    - $(A + G)^2 = (A)^2 + 2(A)(G) + (G)^2$

    - $(0.55 + 0.45)^2 = (0.55)^2 + 2(0.55)(0.45) + (0.45)^2$
    - $1 = 0.3025 + 0.495 + 0.2025$

        | Genotype |      Expected Frequency   | Expected Count    |
        |----------|---------------------------|-------------------|
        | *SS*     | (0.55)^2 = 0.3025         | 10*0.3025 = 3.025 |
        | *SS-*    | 2(0.55)(0.45) = 0.495     | 10*0.495 = 4.95   |
        | *S-S-*   | (0.45)^2 = 0.2025         | 10*0.2025 = 2.025 |

    Using count numbers:
    - Chi Squared: Sum of (O-E)^2 / E
    - Chi Squared = $\frac{(2-3.025)^2}{3.025} + \frac{(7-4.95)^2}{4.95} + \frac{(1-2.025)^2}{2.025}$
    - $= \frac{1.050625}{3.025} + \frac{4.2025}{4.95} + \frac{1.050625}{2.025}$
    - $= 0.34731 + 0.84899 + 0.51883$
    - $= 1.71513$

The chi-squared statistic is 1.71513. For this example the degrees of freedom is equal to 1 (3 genotypes - 2 alleles). The chi-square critical value for one degree of freedom with an alpha of 0.05 is 3.84. 1.71513 < 3.84, so the observed genotype frequencies are no longer significantly different from the expected genotype frequencies. They now agree with the HWE expectations.

4. Take a look at Gel C below:

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
- U/U, U/nU - band present
- nU/nU - no band present

Total number of individuals: $6+ 101+ 39+ 14 = 160$

Genotype Frequency

|  Genotype   |     Count     |   Frequency        |
|-------------|---------------|--------------------|
| U/U, U/nU   | 101+39 = 140  | 140/160 =  0.875   |
| nU/nU       | 6+14 = 20     | 20/160 = 0.125     |

The frequency the null alleles is sqrt(0.125), or 0.354, because the expected genotype frequency of the null/null will be the q^2. Since in this case q^2 = 0.125, q = 0.354.

Lower locus Genotypes:
- L/L, L/nL - band present
- nL/nL - no band present

Total number of individuals: 6+ 101+ 39+ 14 = 160

Genotype Frequency

|  Genotype   |     Count     |   Frequency        |
|-------------|---------------|--------------------|
| L/L, L/nL   | 6+39 = 45     | 45/160 =  0.28125  |
| nL/nL       | 101+14 = 115  | 115/160 = 0.71875  |

The frequency the null alleles is sqrt(0.71875), or 0.84779, because the expected genotype frequency of the null/null will be the q^2. Since in this case q^2 = 0.71875, q = 0.84779.

B. Estimate the percentage of *band-present* individuals (not the overall frequencies) that are heterozygous at each of the two markers.  What biological principle does the difference between these two percentages illustrate?

Upper: $2pq = 2 * (1-0.354) * 0.354 = 0.457368$

Lower: $2pq = 2 * (1-0.84779) * 0.84779 = 0.25808$

This demonstrates homozygotic dominance.

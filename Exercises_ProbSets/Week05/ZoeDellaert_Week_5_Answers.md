# Problem Set 3
## Due 3/1/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week5_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document


## Problems

**1.  The fly *Eurosta solidaginis* forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop.  A studoy of allozyme frequencies in 21 subpopulations of *E. solidaginis* on two different speices of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of *F<sub>ST</sub>*:**

|Locus    | *F<sub>ST</sub>* |
|---------|------------------|
| *GAP-1* | 0.10             |
| *TPI-1* | 0.11             |
| *IDH-1* | 0.02             |
| *HBDH-1*| 0.62             |
| *GPD-1* | 0.11             |
| *PGM-1* | 0.14             |

* **Calculate the expected number of migrants per generation for each locus.  What is your interpretation of these data?  Do you think the differentiation at these loci is caused soley by a balance between migration and drift?  Why or why not?**

"Equation 9.12 can be rearranged to allow estimation of the average number of migrants (mN) from FST, under the island model, as follows: $\hat{mN} \approx \frac{1 − F_{ST}}{4F_{ST}}$ (eqn 9.17)"

| locus    | $F_{ST}$ | $1-F_{ST}$ | $4F_{ST}$ | $\frac{1 − F_{ST}}{4F_{ST}}$ | $\hat{mN} \approx \frac{1 − F_{ST}}{4F_{ST}}$ |
|----------|----------|------------|-----------|--------------|-------|
| *GAP-1*  | 0.1      | 0.9        | 0.4       | 2.25         | 2.3   |
| *TPI-1*  | 0.11     | 0.89       | 0.44      | 2.022727273  | 2.0   |
| *IDH-1*  | 0.02     | 0.98       | 0.08      | 12.25        | 12.3  |
| *HBDH-1* | 0.62     | 0.38       | 2.48      | 0.1532258065 | 0.2   |
| *GPD-1*  | 0.11     | 0.89       | 0.44      | 2.022727273  | 2.0   |
| *PGM-1*  | 0.14     | 0.86       | 0.56      | 1.535714286  | 1.5   |

The locus that stands out is *IDH-1*, with an estimated number of migrants of around 12. I interpret these data to mean that the population is likely **not at migration-drift equilibrium**, because if it was there would not likley be a locus that indicates over 6 times the migration of the other loci. Gene flow and genetic drift should, in theory, affect all loci in the same way. This population likley breaks the assumptions of the ulsand model. *HBDH-1* also stands out for having an estimated # of migrants of zero, which is low compared to the average of ~2 of the other loci. Both *IDH-1* and *HBDH-1* could be outlier loci.

* **Most of the differentiation at *HBDH-1* show in the data occurs between the two species of host plants; nine of the subpopulations occured on *Solidago altissima* and the other 12 subpops were on *S. gigantean*.  The frequency of one of the two *HBDH* alleles is 0.84 on *S. altissima* and 0.13 on *S. gigantea*.  How does this affect your interpretation of the results?**

This allele could be under directional selection with a selection advantage on *S. altissima*.

**2.  Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations,66 were fixed for the a allele, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):**

|Subpopulation |*p* |*H<sub>O</sub>* |
|--------------|----|----------------|
|1-66|1|0|
|67|0.86|0.06|
|68|0.80|0.12|
|69|0.70|0.20|
|70|0.96|0.03|
|71|0.96|0.09|
|72|0.73|0.15|
|73|0.91|0.06|

* **Calculate the three F-statistics for these data and check to make sure they have the correct mathematical relationship. Do these comparisons fit your expectations based on the mating systems of this species? Why or why not? If not, do you have a possible explanation for the lack of fit?**

First, I will calculate the q allele frequency and *H<sub>e</sub>*

| Subpopulation | *p*  | *q* = 1-*p* | *H<sub>e</sub>* = 2*pq* |
|---------------|------|-------------|-------------------------|
| 1-66          | 1    | 0           | 0                       |
| 67            | 0.86 | 0.14        | 0.24                    |
| 68            | 0.8  | 0.2         | 0.32                    |
| 69            | 0.7  | 0.3         | 0.42                    |
| 70            | 0.96 | 0.04        | 0.08                    |
| 71            | 0.96 | 0.04        | 0.08                    |
| 72            | 0.73 | 0.27        | 0.39                    |
| 73            | 0.91 | 0.09        | 0.16                    |

$F_{IS} = 1 − \frac{H_o}{H_S}$ "where *H<sub>O</sub>* is the observed heterozygosity averaged over all subpopulations, and *H<sub>S</sub>* is the expected heterozygosity averaged over all subpopulations."

| Subpopulation                              | *H<sub>O</sub>* |
|--------------------------------------------|-----------------|
| 1-66                                       | 0               |
| 67                                         | 0.06            |
| 68                                         | 0.12            |
| 69                                         | 0.2             |
| 70                                         | 0.03            |
| 71                                         | 0.09            |
| 72                                         | 0.15            |
| 73                                         | 0.06            |
| ***H<sub>o</sub>* = average of *H<sub>O</sub>* over all subpopulations** | **0.08875**         |


| Subpopulation                            | *H<sub>e</sub>*       |
|------------------------------------------|---------|
| 1-66                                     | 0       |
| 67                                       | 0.2408  |
| 68                                       | 0.32    |
| 69                                       | 0.42    |
| 70                                       | 0.0768  |
| 71                                       | 0.0768  |
| 72                                       | 0.3942  |
| 73                                       | 0.1638  |
| ***H<sub>S</sub>* = *H<sub>e</sub>* averaged over all subpopulations**  | **0.21155** |

1. $F_{IS} = 1 − \frac{H_o}{H_S} = 1 - \frac{0.08875}{0.21155} = 0.58$

$F_{ST} = 1 − \frac{H_S}{H_T}$ "where HT is the expected HW heterozygosity if the entire base population were panmictic"

From above, *H<sub>S</sub>* = 0.21155. 

*H<sub>T</sub>* =  expected HW heterozygosity if the entire base population were panmictic

mean p = **0.865**, mean q = 1-p = 1- 0.865 = **0.135**, ***H<sub>T</sub>*** = 2pq = 2* 0.865 *0.135 = **0.23355**

2. $F_{ST} = 1 − \frac{H_S}{H_T} =  1 − \frac{0.21155}{0.23355} = 0.094$

$F_{IT} = 1 − \frac{H_o}{H_T}$

From above, *H<sub>o</sub>* =  0.08875
From above, *H<sub>T</sub>* =  0.23355

3. $F_{IT} = 1 − \frac{H_o}{H_T} = 1 − \frac{0.08875}{0.23355} = 0.62$

* **Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be?**

"Equation 9.12 can be rearranged to allow estimation of the average number of migrants (mN) from FST, under the island model, as follows: $\hat{mN} \approx \frac{1 − F_{ST}}{4F_{ST}}$ (eqn 9.17)"

$F_{ST} = 0.094$

$\hat{mN} \approx \frac{1 − 0.094}{4*0.094} \approx 2.4$

mN = 2.4 is approximately the number of migrants per generation. With a migration rate of 0.1, this means that *N<sub>e</sub>* = 2.4/0.1 = 24

* **Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still 0.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 generations? What biological principle is illustrated by these results?**

| Subpopulation | *p* | *q* = 1-*p* | *H<sub>e</sub>* = 2*pq* | *H<sub>O</sub>* |
|---------------|-----|-------------|-------------------------|-----------------|
| 68            | 0.8 | 0.2         | 0.32                    | 0.12            |
| 69            | 0.7 | 0.3         | 0.42                    | 0.2             |

A = 68, B = 69
qA' = (1 − m)qA + mqB
qB' = mqA + (1 − m)qB

| Generation | Subpopulation | Allele Frequency |
|------------|---------------|------------------|
| 1          | 68            | ex : qA' = (1 − 0.1)0.8 + 0.1*0.7 = 0.79             |
| 1          | 69            | ex : qB' = 0.1*0.8 + (1-0.1)0.7 = 0.71             |
| 2          | 68            | ex : qA' = (1 − 0.1)0.79 + 0.1*0.71 = 0.78             |
| 2          | 69            | ex : qB' = 0.1*0.79 + (1-0.1)0.71 = 0.72             |
| 3          | 68            | 0.78             |
| 3          | 69            | 0.72             |
| 4          | 68            | 0.77             |
| 4          | 69            | 0.73             |
| 5          | 68            | 0.77             |
| 5          | 69            | 0.73             |
| 6          | 68            | 0.76             |
| 6          | 69            | 0.74             |
| 7          | 68            | 0.76             |
| 7          | 69            | 0.74             |
| 8          | 68            | 0.76             |
| 8          | 69            | 0.74             |
| 9          | 68            | 0.76             |
| 9          | 69            | 0.74             |
| 10         | 68            | 0.76             |
| 10         | 69            | 0.74             |

I continued these calculations to 25 generations and the allele frquencies stabilited with both subpopulations having an allele frequency of 0.75.

This demonstrates that gene flow will result in equilibrium being reached between the subpopulations.

**3.  In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal to 0.168. Calculate the expected frequency in the next generation, assuming.**

| Genotype | Zygote frequency | Relative Fitness | Frequency after selection |
|----------|------------------|------------------|---------------------------|
| Cy/Cy    | p^2              | w11              | (p^2 * w11)/w ̄           |
| Cy/+     | 2pq              | w12              | (2pq * w12)/w ̄           |
| +/+      | q^2              | w22              | (q^2 * w22)/w ̄           |

- p = 0.168 
- q = 1 - p = 1 - 0.168 = 0.832

* **The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1.**

| Genotype | Zygote frequency | Relative Fitness |
|----------|------------------|------------------|
| Cy/Cy    | $p^2 = 0.168^2 = 0.028$         | 0 |
| Cy/+     | $2pq = 2*0.168*0.832 = 0.280$   | 1 |
| +/+      | $q^2 = 0.832^2 = 0.692 $        | 1 |

$\bar{w} = p^2 * w_{11} + 2pq * w_{12} + q^2 * w_{22}$

$\bar{w} = 0.028 * 0 + 0.280 * 1 + 0.692 * 1 = 0.972$

| Genotype | Zygote frequency | Relative Fitness | Frequency after selection | Normalized by w- |
|----------|------------------|------------------|---------------------------|------------------|
| Cy/Cy    | 0.028 | 0 | $(p^2 * w_{11}) = (0.028*0) = 0$   | $0/0.972 = 0$ |
| Cy/+     | 0.280 | 1 | $(2pq*w_{12}) = (0.280*1) = 0.280$ | $0.280/0.972 = 0.288$          |
| +/+      | 0.692 | 1 | $(q^2*w_{22}) = (0.692*1) = 0.692$ |$0.692/0.972 = 0.712 $        |

* **The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5.**

| Genotype | Zygote frequency | Relative Fitness   |
|----------|------------------|--------------------|
| Cy/Cy    | $p^2 = 0.168^2 = 0.028$         | 0   |
| Cy/+     | $2pq = 2*0.168*0.832 = 0.280$   | 0.5 |
| +/+      | $q^2 = 0.832^2 = 0.692 $        | 1   |

$\bar{w} = p^2 * w_{11} + 2pq * w_{12} + q^2 * w_{22}$

$\bar{w} = 0.028 * 0 + 0.280 * 0.5 + 0.692 * 1 = 0.832$

| Genotype | Zygote frequency | Relative Fitness | Frequency after selection | Normalized by w- |
|----------|------------------|------------------|---------------------------|------------------|
| Cy/Cy    | 0.028            | 0         | $(p^2 * w_{11}) = (0.028*0) = 0$ | $0/0.832 = 0$    |
| Cy/+     | 0.280            | 0.5 | $(2pq*w_{12}) = (0.280*0.5) = 0.140$ | $0.140/0.832 = 0.168$ |
| +/+      | 0.692            | 1   | $(q^2*w_{22}) = (0.692*1) = 0.692$  | $0.692/0.832 = 0.832 $ |

**4. If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?**

| Genotype | A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub> | 
|----------|-----|-----|-----|
| Fitness  | 1.5 | 1.1 | 1.0 | 

A<sub>1</sub>A<sub>1</sub> >  A<sub>1</sub>A<sub>2</sub> > A<sub>2</sub>A<sub>2</sub>, intermediate directional selection

| Genotype             | A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub> | 
|----------------------|-----|-----|-----|
| Relative Fitness, w  | 1.5/1.5 = 1 | 1.1/1.5 = 0.73  | 1.0/1.5 = 0.67 | 
| s = 1 - w            | 0           | 0.27            | 0.33           |

heterozygous effect: w<sub>A<sub>1</sub>A<sub>2</sub></sub> = 1-hs

w<sub>A<sub>1</sub>A<sub>2</sub></sub> = 1-hs

h = (1- w<sub>A<sub>1</sub>A<sub>2</sub></sub>)/s = (1-0.27)/0.27 = 0.73/0.27 = 2.7

**5. Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtration. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956).**

* **Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous.**

2pq + p^2 = 0.87

q^2 = 0.13

q = sqrt(0.13) = 0.36

p = 1 - q = 0.64

Ho = 2pq = 0.4608

Proportion of melanics that are heterozygous = 0.4608 / 0.87 = 0.53

**In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year.**

* **Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.**

1848 -> 1898 = 50 generations

First, I am going to calculate p for 1848 in the same way as above:

2pq + p^2 = 0.01

q^2 = 0.99

q = sqrt(0.99) = 0.995

p = 1 - q = 0.005

Change in allele frequency over 50 generations: 0.64 - 0.005 = 0.635

**Selection coefficient against q^2 (non-melanic genotype): 0.169**

I used the following excel worksheet from HHMI to estimate the selection: [https://www.biointeractive.org/sites/default/files/Selection%2520Coefficient.xls]

![Pic1](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week05/ZoeDellaert_Week5_images/Pic1.png)

![Pic2](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week05/ZoeDellaert_Week5_images/Pic2.png)

* **How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics**

If the allele is recessive, then 0.87 = p^2 and p = sqrt(0.87) = 0.93

1848 -> 1898 = 50 generations

First, I am going to calculate p for 1848 in the same way as above:

p^2 = 0.01

p = sqrt(0.01) = 0.1 (so frequency of the dominant allele, q, is 0.9)

Using the same selection coefficient against q^2 (non-melanic genotype) calculated above, 0.169, it took 121 years for the simulation to reach an allele frequency of 0.93 for p. 

I used the following excel worksheet from HHMI to estimate the selection: [https://www.biointeractive.org/sites/default/files/Selection%2520Coefficient.xls]

![Pic3.png](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week05/ZoeDellaert_Week5_images/Pic3.png)

**6. Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968). One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were Standard (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele." What equilibrium frequency of ST is predicted?**

Since there is heterozygote dominance, the predicted equilibrium frequency is 

$p* = \frac{w_{12} - w_{22}}{2w_{12} - w_{11} - w_{22}}$

$p* = \frac{1 - 0.62}{2 - 0.47 - 0.62} = \frac{0.38}{0.91} = 0.42$


$q* = \frac{w_{12} - w_{11}}{2w_{12} - w_{11} - w_{22}}$

$q* = \frac{1 - 0.47}{2 - 0.47 - 0.62} = \frac{0.53}{0.91} = 0.58$

**What equilibrium value of $\bar{w}$ is predicted?**

$\bar{w} = p^2 * w_{11} + 2pq * w_{12} + q^2 * w_{22}$

$\bar{w} = (0.42^2 * 0.47) + (2 * 0.42 * 0.58 * 1.0) + (0.58^2 * 0.62) = 0.78$ 
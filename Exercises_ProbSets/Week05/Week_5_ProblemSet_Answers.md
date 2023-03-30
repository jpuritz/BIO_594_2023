# Problem Set 3
## Due 3/1/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week5_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document


## Problems

>1.  The fly *Eurosta solidaginis* forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop.  A studoy of allozyme frequencies in 21 subpopulations of *E. solidaginis* on two different speices of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of *F<sub>ST</sub>*:
>
>|Locus | *F<sub>ST</sub>* |
>|------|------------------|
>| *GAP-1*| 0.10|
>| *TPI-1*| 0.11|
>| *IDH-1*| 0.02|
>| *HBDH-1*| 0.62|
>| *GPD-1*| 0.11|
>| *PGM-1*| 0.14|

>* Calculate the expected number of migrants per generation for each locus.  What is your interpretation of these data?  Do you think the differentiation at these loci is caused soley by a balance between migration and drift?  Why or why not?

>* Most of the differentiation at *HBDH-1* show in the data occurs btween the two species of host plants; nine of the subpopulations occured on *Solidago altissima* and the other 12 subpops were on *S. gigantean*.  The frequency of one of the two *HBDH* alleles is 0.84 on *S. altissima* and 0.13 on *S. gigantea*.  How does this affect your interpretation of the results?

### Answer
Our answer today comes from Keegan:

|Locus | *F<sub>ST</sub>* |mN|
|------|------------------|----|
| *GAP-1*| 0.10|$\frac{1-.1}{4(.1)}= 2.25$|
| *TPI-1*| 0.11|$\frac{1-.11}{4(.11)}= 2.02$|
| *IDH-1*| 0.02|$\frac{1-.02}{4(.02)}= 12.25$|
| *HBDH-1*| 0.62|$\frac{1-.62}{4(.62)}= 0.153$|
| *GPD-1*| 0.11|$\frac{1-.11}{4(.11)}= 2.02$|
| *PGM-1*| 0.14|$\frac{1-0.14}{4(.14)}= 1.54$|

**From Jon** It appears that the structure is likely to be due to a balance between migration and drift at all loci except *IDH-1* and *HBDH-1*. The other loci appear to be selectively neutral, and all agree on about 2 migrants per generation. The *F<sub>ST</sub>* data suggest the possibility of selection for local adaptation at *HBDH-1* and homogenizing selection at *IDH-1*, but this would need to be confirmed by further study. 

Part two from Megan:
> **The *S. altissima* allele is under positive directional selection. (local adaptation?)**

From Jon: 
> This is further evidence for selection for local adaptation at *HBDH-1* or a locus linked with it, with the selection generated by differences between the two species of host plant.



>2.  Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations,66 were fixed for the a allele, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):
>
>|Subpopulation |*p* |*H<sub>O</sub>* |
>|--------------|----|----------------|
>|1-66|1|0|
>|67|0.86|0.06|
>|68|0.80|0.12|
>|69|0.70|0.20|
>|70|0.96|0.03|
>|71|0.96|0.09|
>|72|0.73|0.15|
>|73|0.91|0.06|
>
>* Calculate the three F-statistics for these data and check to make sure they have the correct mathematical relationship. Do these comparisons fit your expectations based on the mating systems of this species? Why or why not? If not, do you have a possible explanation for the lack of fit?

### Answer 
From Seraphina with modification from Jon to keep significant digits consistent:

$$H_I=\frac{(66*0)+0.06+0.12+0.20+0.03+0.09+0.15+0.06}{73}=0.0097$$
$$H_S=\frac{(66*0)+0.24+0.32+0.42+0.08+0.08+0.4+0.16}{73}=0.0232$$
$$H_T=2\overline{p}{q}=2(0.985)(0.015)=0.0296$$
$$F_{IS}=1-\frac{H_I}{H_S}=1-\frac{0.0097}{0.023}=-0.582$$
$$F_{ST}=1-\frac{H_S}{H_T}=1-\frac{0.023}{0.03}=0.216$$
$$F_{IT}=1-\frac{H_I}{H_T}=1-\frac{0.0097}{0.03}=0.672$$

#### From Jon
The *F<sub>IS</sub>* is large for a nonselfing species. It could be explained partly by “bi-parental” inbreeding, that is mating with close relatives, but the *F<sub>IS</sub>* value is probably too big to be explained entirely by inbreeding. Another good possiblity is the **Wahlund effect**, which is the appearance of inbreeding from inadvertently lumping several differentiated subpopulations together. If some of these subpopulations are actually made up of more than one, then drift would cause an excess of homozygotes when the cryptic subpopulations are combined. 


>* Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be?

### Answer 
From Zoe with alteration from Jon:

"Equation 9.12 can be rearranged to allow estimation of the average number of migrants (mN) from FST, under the island model, as follows: $\hat{mN} \approx \frac{1 − F_{ST}}{4F_{ST}}$ (eqn 9.17)"

$F_{ST} = 0.216$

$\hat{mN} \approx \frac{1 − 0.216}{4*0.216} \approx 0.91$

mN = 0.91 is approximately the number of migrants per generation. With a migration rate of 0.1, this means that *N<sub>e</sub>* = 0.91/0.1 = 9.1


> * Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still O.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 gener-ations? What biological principle is illustrated by these results?

### Answer 
From Jon:

We can use this equation to answer our question: $p_{t} = \bar{p} + (p_{0} - \bar{p})(1 - m)^t$.  Here $m = 0.1$, $\bar{p} = 0.985$, $p_{0} = 0.8$  for subpopulation 68 and $p_{0} = 0.7$ for subpopulation 69. 

| Subpopulation | 10 generations | 25 generations|
|------------|-----------|-------|
|Subpopulation 68| $p_{10} = 0.985 + (0.8 - 0.985)(1 - 0.1)^{10} = 0.92$ | $p_{25} = 0.985 + (0.8 - 0.985)(1 - 0.1)^{25} = 0.97$ | 
|Subpopulation 68| $p_{10} = 0.985 + (0.7 - 0.985)(1 - 0.1)^{10} = 0.88$ | $p_{25} = 0.985 + (0.7 - 0.985)(1 - 0.1)^{25} = 0.96$ | 

This illustrates migration reducing differentiation, as both subpopulations are converging on the average allele frequency in the metapopulation. 



>3.  In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal >to 0.168. Calculate the expected frequency in the next generation, assuming.
>      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1.
>      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5.

### Answer
From Jon:

A lot of you went through some complicated equations about relative fitness, but leathality makes this simple:

Let the relative fitnesses of C<sub>*y*</sub>/C<sub>*y*</sub>, C<sub>*y*</sub>/+, and +/+ be denoted $w_{11}$, $w_{12}$, and $w_{22}$, respectively, where $w_{22} = 1$ and $w_{11} = 0$ is implied by the lethality of C<sub>*y*</sub>/C<sub>*y*</sub>. The initial frequency of the C<sub>*y*</sub> allele, $p = 0.168$, is given. The frequency of the C<sub>*y*</sub> allele in the next generation is given by this equation $p^\prime= \frac {p^2w_{AA} + pqw_{Aa}}{p^2w_{AA}+2pqw_{Aa} + q^2w_{aa}}$

   A. Here, $w_{12} = 1$ and   $p^\prime = \frac {0.168^2 * 0 + (0.168)(1-0.168)*1  }{0.168^2*0 +2*0.168*(1-0.168)*1 + (1-0.168)^2*1} = 0.1438$
   B. Here, $w_{12} = 0.5$ and $p^\prime = \frac {0.168^2 * 0 + (0.168)(1-0.168)*0.5}{0.168^2*0 +2*0.168*(1-0.168)*0.5 + (1-0.168)^2*1} = 0.0840$


>4. If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?

### Answer
From Zoe with modification from Jon:

| Genotype | A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub> | 
|----------|-----|-----|-----|
| Fitness  | 1.5 | 1.1 | 1.0 | 

A<sub>1</sub>A<sub>1</sub> >  A<sub>1</sub>A<sub>2</sub> > A<sub>2</sub>A<sub>2</sub>, intermediate directional selection

| Genotype             | A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub> | 
|----------------------|-----|-----|-----|
| Relative Fitness, w  | 1.5/1.5 = 1 | 1.1/1.5 = 0.73  | 1.0/1.5 = 0.67 | 
| s = 1 - w            | NA           | NA         | 0.33           |

heterozygous effect: w<sub>A<sub>1</sub>A<sub>2</sub></sub> = 1-hs

w<sub>A<sub>1</sub>A<sub>2</sub></sub> = 1-hs

hs = 1-w<sub>A<sub>1</sub>A<sub>2</sub></sub>

hs = 1- 0.733 = 0.266

h =  0.2666/0.3333 = 0.8


>5. Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtra-tion. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956). 
>
>      * Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous.
### Answer
From Zoe:

2pq + p^2 = 0.87

q^2 = 0.13

q = sqrt(0.13) = 0.36

p = 1 - q = 0.64

Ho = 2pq = 0.4608

Proportion of melanics that are heterozygous = 0.4608 / 0.87 = 0.53
 
>      * In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year.
>         * Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.
### Answer from Jon

Melanic moths result from a dominant allele. Therefore, with HWE, the frequency of the recessive allele can be estimated as the square root of the proportion of nonmelanics. The data given are that $t = 50$ generations (1898–1850), $q_{0} = \sqrt{1-0.95} = 0.9950$, and $q_{50} = \sqrt{1-0.95} = 0.2236$.

The change in frequency for a favored dominant allele is given by the equation: 
$st = \ln{\frac{p_{t}}{q_{t}}} + \frac{1}{q_{t}} - \ln{\frac{p_{0}}{q_{0}}} - \frac{1}{q_{0}}   =  ln{\frac{0.7764}{0.2236}} + \frac{1}{0.2236} – ln{\frac{0.9950}{0.0050}} – ln{\frac{1}{0.0050}} = 10.0027 $

$s = \frac{10.0027}{50} = 0.2$


>         * How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics

### Answer from Jon

If the melanic allele were recessive, we would have $p_{0} = \sqrt{0.01} = 0.1$, and $p_{50} = \sqrt{0.95} = 0.0.9747$.  $s = 0.2$, same as the previous example.  The
change in frequency of a favored recessive allele is given by this equation:

$st = \ln{\frac{p_{t}}{q_{t}}} + \frac{1}{p_{t}} - \ln{\frac{p_{0}}{q_{0}}} - \frac{1}{p_{0}} = ln{\frac{0.9747}{0.0253}} + \frac{1}{0.9747} – ln{\frac{0.1}{0.9}} – ln{\frac{1}{0.1}} = 14.8217 $

$t = \frac{14.8217}{0.2} = 74.109 $ generations

>6. Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968). One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were *Standard* (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele " What equilibrium frequency of ST is predicted? What equilibrium value of $\bar{w}$ is predicted?

### Answer
From Keegan:

$$w_{11} = 0.47, w_{12}=1,w_{22}=0.62$$
$$p* = \frac{w_{12} - w_{22}}{2w_{12} - w_{11}-w{22}}$$
$$p*=\frac{1-0.62}{2(1)-0.47-0.62}=\frac{0.38}{0.91}=0.42$$
$$q* = 1- 0.42 = 0.58$$
$$\bar{w}=p^2w_{11}+2pqw_{12}+q^2w_{22}$$
$$\bar{w}=(0.42)^2(0.47)+2(0.42)(0.58)(1)+(0.58)^2(0.62)= 0.083+0.49+0.2=0.78$$
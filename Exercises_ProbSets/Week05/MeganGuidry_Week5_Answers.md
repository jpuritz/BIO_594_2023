# Problem Set 3
## Due 3/8/2023

## Problems

1.  The fly *Eurosta solidaginis* forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop.  A study of allozyme frequencies in 21 subpopulations of *E. solidaginis* on two different speices of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of *F<sub>ST</sub>* (see table below).

* Calculate the expected number of migrants per generation for each locus.  What is your interpretation of these data?  Do you think the differentiation at these loci is caused soley by a balance between migration and drift?  Why or why not?

**Use Eqn 9.17 on page 194 in the tb**

|Locus | *F<sub>ST</sub>* | **# of migrants (mN)** |
|------|------------------|--------------------|
| *GAP-1*| 0.10| **2.3** |
| *TPI-1*| 0.11| **2.0** |
| *IDH-1*| 0.02| **12.3** |
| *HBDH-1*| 0.62| **0.2**|
| *GPD-1*| 0.11| **2.0** |
| *PGM-1*| 0.14| **1.5** |

**This pattern indicates that the populations are not in a migration-drift balance because of the variance between the number of migrants. For instance, loci *IDH-1* has an estimated 12.3 migrants and loci *HBDH-1* has an estimated 0.2 migrants. I would expect to see similar numbers of migrants (at least the same magnitude) across the loci if they are in migration-drift balance. So does this mean that those loci are under selection?**

* Most of the differentiation at *HBDH-1* show in the data occurs between the two species of host plants; nine of the subpopulations occured on *Solidago altissima* and the other 12 subpops were on *S. gigantean*.  The frequency of one of the two *HBDH* alleles is 0.84 on *S. altissima* and 0.13 on *S. gigantea*.  How does this affect your interpretation of the results?

**The *S. altissima* allele is under positive directional selection. (local adaptation?)**


2.  Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations,66 were fixed for the a allele, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):

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

* Calculate the three F-statistics for these data and check to make sure they have the correct mathematical relationship. Do these comparisons fit your expectations based on the mating systems of this species? Why or why not? If not, do you have a possible explanation for the lack of fit?

**F statistic equations are equations 9.2, 9.3, and 9.4 in the textbook.**

First solved for *q* and *H<sub>E</sub>*.

|Subpopulation |*p* |*q* |*H<sub>O</sub>* |*H<sub>E</sub>* |
|--------------|----|----|----------------|----------------|
|1-66|1|0|0|0|
|67|0.86|0.14|0.06|0.24|
|68|0.80|0.2|0.12|0.32|
|69|0.70|0.3|0.20|0.42|
|70|0.96|0.04|0.03|0.08|
|71|0.96|0.04|0.09|0.08|
|72|0.73|0.27|0.15|0.39|
|73|0.91|0.09|0.06|0.16|

Then solved for the average of *H<sub>O</sub>* across the subpopulations and *H<sub>S</sub>* which is the average of *H<sub>E</sub>* across the subpopulations.

avg. *H<sub>O</sub>* = 0.089

avg. *H<sub>E</sub>* = 0.21

Lastly, solve for the F-statistics. 

*F<sub>IS</sub>* = 1- (*H<sub>O</sub>* / *H<sub>S</sub>*) = **0.58**

*F<sub>ST</sub>* = 1- (*H<sub>S</sub>* / *H<sub>T</sub>*) = **0.094**

> where *H<sub>T</sub>* is the expected heterozygosity if the whole population where panmictic therefore you use *2pq* to find that value where *p* and *q* are the means of those allele frequencies in the population

*F<sub>IT</sub>* = 1- (*H<sub>O</sub>* / *H<sub>T</sub>*) = **0.62**

* Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be?


**Use equation 9.17 again to find the number of migrants (mN) with given Fst from previous step**

mN = 2.4

With a migration rate (m) equal to 0.1, *N<sub>e</sub>* =  ???

* Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still O.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 gener-ations? What biological principle is illustrated by these results?



3.  In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal to 0.168. Calculate the expected frequency in the next generation, assuming.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5.

4. If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?

5. Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtra-tion. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956). 

      * Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous.
      * In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year.
         * Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.
         * How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics

6. Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968).
One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were *Standard* (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele." What equilibrium frequency of ST is predicted? What equilibrium value of $\bar{w}$ is predicted?

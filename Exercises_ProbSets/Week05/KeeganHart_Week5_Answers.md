# Keegan Hart Problem Set 3

## Problems

1.  The fly *Eurosta solidaginis* forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop.  A study of allozyme frequencies in 21 subpopulations of *E. solidaginis* on two different species of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of *F<sub>ST</sub>*:

|Locus | *F<sub>ST</sub>* |
|------|------------------|
| *GAP-1*| 0.10|
| *TPI-1*| 0.11|
| *IDH-1*| 0.02|
| *HBDH-1*| 0.62|
| *GPD-1*| 0.11|
| *PGM-1*| 0.14|

* Calculate the expected number of migrants per generation for each locus.  What is your interpretation of these data?  Do you think the differentiation at these loci is caused soley by a balance between migration and drift?  Why or why not?
>$$mN= \frac{1-F_{ST}}{4F_{ST}}$$

>|Locus | *F<sub>ST</sub>* |mN|
>|------|------------------|----|
>| *GAP-1*| 0.10|$\frac{1-.1}{4(.1)}= 2.25$|
>| *TPI-1*| 0.11|$\frac{1-.11}{4(.11)}= 2.02$|
>| *IDH-1*| 0.02|$\frac{1-.02}{4(.02)}= 12.25$|
>| *HBDH-1*| 0.62|$\frac{1-.62}{4(.62)}= 0.153$|
>| *GPD-1*| 0.11|$\frac{1-.11}{4(.11)}= 2.02$|
>| *PGM-1*| 0.14|$\frac{1-0.14}{4(.14)}= 1.54$|

>I do not think that the differentiation at these loci is caused solely by a balance between migration and drift because no real life populations are at a balance between migration and drift. 

* Most of the differentiation at *HBDH-1* shown in the data occurs between the two species of host plants; nine of the subpopulations occured on *Solidago altissima* and the other 12 subpops were on *S. gigantean*.  The frequency of one of the two *HBDH* alleles is 0.84 on *S. altissima* and 0.13 on *S. gigantea*.  How does this affect your interpretation of the results?
>  This information confirms why Fst is so high for that locus because the allele frequencies between the two subpopulations differ so much and Fst is a measure of genetic divergence among subpopulations. Due to the Fst of this locus being large it likely has a more accurate estimation of mN than the other loci. 

2.  Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations, **66 were fixed for the a allele**, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):

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

**Answer Set 2**

* Calculate the three F-statistics for these data and check to make sure they have the correct mathematical relationship. Do these comparisons fit your expectations based on the mating systems of this species? Why or why not? If not, do you have a possible explanation for the lack of fit?
>Necessary equations:
>$$F_{ST} = 1 - \frac{H_S}{H_T}$$
>$$F_{IS} = 1 - \frac{H_I}{H_S}$$
>$$F_{IT} = 1 - \frac{H_I}{H_T}$$
>H<sub>I</sub> = average observed heterozygosity across subpops\
>H<sub>S</sub> = average expected heterozygosity across subpops\
>H<sub>T</sub> = average expected heterozygosities for overall total population

>|Subpopulation |*p*|*q*|*H<sub>E</sub>(2pq)*|*H<sub>O</sub>* |
>|--------------|----|-------|---------|---|
>|1-66|1|0|0|0|
>|67|0.86|0.14|0.24|0.06|
>|68|0.80|0.2|0.32|0.12|
>|69|0.70|0.3|0.42|0.20|
>|70|0.96|0.04|0.08|0.03|
>|71|0.96|0.04|0.08|0.09|
>|72|0.73|0.27|0.39|0.15|
>|73|0.91|0.09|0.16|0.06|

>|Subpopulation|*$$\bar{p}$$*|*$$\bar{q}$$*|*$$H_T$$*|
>|---|---|---|---|
>|all|0.985|0.015|0.03|

>$$H_I=\frac{(66*0) +0.06 + 0.12 + 0.20 + 0.03 + 0.09 + 0.15 + 0.06}{73}= 0.0097$$
>$$H_S=\frac{(66*0)+0.24+0.32+0.42+0.08+0.08+0.39+0.16}{73}=0.023$$
>$$H_T=2\bar{p}\bar{q} = 2(0.985)(0.015)=0.03$$

>$$F_{IS} = 1 - \frac{H_I}{H_S}=1-\frac{0.0097}{0.023}=.58$$
>$$F_{ST} = 1 - \frac{H_S}{H_T} = 1-\frac{0.023}{0.03}=0.23$$
>$$F_{IT}= -\frac{H_I}{H_T}=1-\frac{0.0097}{0.03}=-0.68$$

* Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be?
> $$N_em = \frac{1-F_{ST}}{4F_{ST}} =\frac{1-0.23}{4(0.23)} = 0.84$$
>$$N_e = \frac{0.84}{.1}=8.4$$
* Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still 0.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 generations? What biological principle is illustrated by these results?
>We would need to use the following equations:
>$$q^,_A=(1-m)q_A +mq_B$$
>$$q^,_B=(1-m)q_B+mq_A$$

>|Subpopulation |*p*|*q*|*H<sub>E</sub>(2pq)*|*H<sub>O</sub>* |
>|--------------|----|-------|---------|---|
>|68|0.80|0.2|0.32|0.12|
>|69|0.70|0.3|0.42|0.20|

> 10 generations:
>|Generation|q'<sub>68</sub>|q'<sub>68</sub>|
>|----------|---------------|---------------|
>|$$0$$|$$0.2$$|$$0.3$$|
>|1|$$(1-0.1)0.2 + 0.1(0.3)=0.21$$|$$(1-0.1)0.3 + 0.1(0.2)=0.29$$|
>|2|$$(0.9)0.21 + 0.1(0.29)=0.218$$|$$(0.9)0.29 + 0.1(0.21)=0.282$$|
>|3|$$(0.9)0.218 + 0.1(0.282)=0.224$$|$$(0.9)0.282 + 0.1(0.218)=0.276$$|
>|4|$$(0.9)0.224 + 0.1(0.276)=0.229$$|$$(0.9)0.276 + 0.1(0.224)=0.271$$|
>|5|$$(0.9)0.229 + 0.1(0.271)=0.233$$|$$(0.9)0.271 + 0.1(0.229)=0.267$$|
>|6|$$(0.9)0.233 + 0.1(0.267)=0.236$$|$$(0.9)0.267 + 0.1(0.233)=0.264$$|
>|7|$$(0.9)0.236 + 0.1(0.264)=0.239$$|$$(0.9)0.264 + 0.1(0.236)=0.261$$|
>|8|$$(0.9)0.239 + 0.1(0.261)=0.241$$|$$(0.9)0.261 + 0.1(0.239)=0.259$$|
>|9|$$(0.9)0.241 + 0.1(0.259)=0.243$$|$$(0.9)0.259 + 0.1(0.241)=0.257$$|
>|10|$$(0.9)0.243 + 0.1(0.257)=0.244$$|$$(0.9)0.257 + 0.1(0.243)=0.255$$|

>after 25 generations:
>the frequency of the a allele in both subpopulations after 25 generations will be ~0.25 for both as the alleles are going towards equilibrium

3.  In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal to 0.168. Calculate the expected frequency in the next generation, assuming.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5.
      

>$$p^2 = 0.168$$
>$$p = \sqrt{0.168} = 0.41$$
>$$q = 0.59$$

> Calculate the expected frequency of C<sub>y</sub> if the relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1
>|Genotype|Zygote frequency|relative fitness|frequency after selection|
>|---|----|---|---|
>|C<sub>y</sub>/C<sub>y</sub>|$$p^2=0$$|0|0|
>|C<sub>y</sub>/+|$$2pq= 2(0.41)(0.59) =0.48$$|1| $$\frac{0.48}{0.83}=0.58$$
>|+/+|$$q^2=0.59^2= 0.35$$|1|$$\frac{0.35}{0.83}=0.42$$
>$$w^- = p^2w_{11} + 2pqw_{12} + q^2w_{22}$$
>$$w^- =0 + 0.48(1)+0.35(1)=0.83$$

> Calculate the expected frequency of C<sub>y</sub> if the relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5:
>|Genotype|Zygote frequency|relative fitness|frequency after selection|
>|---|----|---|---|
>|C<sub>y</sub>/C<sub>y</sub>|$$p^2=0$$|0|0|
>|C<sub>y</sub>/+|$$2pq= 2(0.41)(0.59) =0.48$$|0.5| $$\frac{0.48}{0.59}=0.81$$
>|+/+|$$q^2=0.59^2= 0.35$$|1|$$\frac{0.35}{0.59}=0.59$$
>$$w^- = p^2w_{11} + 2pqw_{12} + q^2w_{22}$$
>$$w^-= 0 + 0.48(0.5) + 0.35(1)=0.59$$

4. If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?
>|Genotype|Absolute Fitness| Relative Fitness|Selection Coefficient| Dominance Coefficient|
>|--------|--------|--------|--------|----|
>|A<sub>1</SUB>A<sub>1|1.5|$$1$$|
>|A<sub>1</SUB>A<sub>2|1.1|$$0.73 = 1-hs$$||$$h=\frac{0.27}{0.34}=0.79$$
>|A<sub>2</SUB>A<sub>2|1.0|$$0.66 = 1-s$$|$$s = 1-0.66 = 0.34$$


>heterozygous effect: measures the deviation in fitness of the heterozygous genotype from the average fitness of the two homozygous genotypes.
$$h =\frac{1.5 + 1 - (2*1.1)}{2(1.5+1-2(1.1))}=-0.125$$

5. Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtration. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956). 

      * Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous.
      > $$p^2 +2pq = 0.87$$
      >$$q^2 = 0.13$$
      >$$q=\sqrt{0.13}=0.36$$
      >$$p=1-0.36=0.64$$
      >$$2pq = 2(0.36)(0.64)=0.46$$
      * In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year.
         * Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.
         > in 50 years frequency of dominant allele goes from .01 -> .95
         * How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics

6. Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968).
One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were *Standard* (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele." What equilibrium frequency of ST is predicted? What equilibrium value of $\bar{w}$ is predicted?
     
$$w_{11} = 0.47, w_{12}=1,w_{22}=0.62$$
$$p* = \frac{w_{12} - w_{22}}{2w_{12} - w_{11}-w{22}}$$
$$p*=\frac{1-0.62}{2(1)-0.47-0.62}=\frac{0.38}{0.91}=0.42$$
$$q* = 1- 0.42 = 0.58$$
$$\bar{w}=p^2w_{11}+2pqw_{12}+q^2w_{22}$$
$$\bar{w}=(0.42)^2(0.47)+2(0.42)(0.58)(1)+(0.58)^2(0.62)= 0.083+0.49+0.2=0.78$$

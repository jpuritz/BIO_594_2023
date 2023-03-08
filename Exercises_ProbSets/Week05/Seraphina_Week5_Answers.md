# Seraphina's Problem Set 3
## Due 3/1/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week5_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document


## Problems

1.  The fly *Eurosta solidaginis* forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop.  A studoy of allozyme frequencies in 21 subpopulations of *E. solidaginis* on two different speices of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of *F<sub>ST</sub>*:

|Locus | *F<sub>ST</sub>* |
|------|------------------|
| *GAP-1*| 0.10|
| *TPI-1*| 0.11|
| *IDH-1*| 0.02|
| *HBDH-1*| 0.62|
| *GPD-1*| 0.11|
| *PGM-1*| 0.14|

* Calculate the expected number of migrants per generation for each locus.  What is your interpretation of these data?  Do you think the differentiation at these loci is caused soley by a balance between migration and drift?  Why or why not?
$$Mn=\frac{1-F_ST}{4(F_ST_)}$$

|Locus|*mN*|
|-----|--|
|*GAP-1*|$$mN=\frac{1-0.10}{4(0.10)}=2.25$$|
|*TPI-1*|$$mN=\frac{1-0.11}{4(0.11)}=2.02$$|
|*IDH-1*|$$mN=\frac{1-0.02}{4(0.02)}=12.25$$|
| *HBDH-1*|$$mN=\frac{1-0.62}{4(0.62)}=0.15$$|
| *GPD-1*|$$mN=\frac{1-0.11}{4(0.11)}=2.02$$|
| *PGM-1*|$$mN=\frac{1-0.14}{4(0.14)}=1.53$$|

* Most of the differentiation at *HBDH-1* show in the data occurs between the two species of host plants; nine of the subpopulations occured on *Solidago altissima* and the other 12 subpops were on *S. gigantean*.  The frequency of one of the two *HBDH* alleles is 0.84 on *S. altissima* and 0.13 on *S. gigantea*.  How does this affect your interpretation of the results?

2.  Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations,66 were fixed for the a allele, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):

|Subpopulation |*p* |*H<sub>o</sub>* |
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

|Subpopulation |$p$ |$q$|*H<sub>E</sub>* *(2pq)*|*H<sub>o</sub>* |
|--------------|----|---|---|----------------|
|1-66|1|0|0|0|
|67|0.86|0.14|0.24|0.06|
|68|0.80|0.2|0.32|0.12|
|69|0.70|0.3|0.42|0.20|
|70|0.96|0.04|0.08|0.03|
|71|0.96|0.04|0.08|0.09|
|72|0.73|0.27|0.4|0.15|
|73|0.91|0.09|0.16|0.06|
#
|Totals|$\bar{p}$|$\bar{q}$|H<sub>T</sub>|
|-|-|-|-|
| |0.985|0.015|0.03|
#
$$H_I=\frac{(66*0)+0.06+0.12+0.20+0.03+0.09+0.15+0.06}{73}=0.0097$$
$$H_S=\frac{(66*0)+0.24+0.32+0.42+0.08+0.08+0.4+0.16}{73}=0.023$$
$$H_T=2\overline{p}{q}=2(0.985)(0.015)=0.03$$
$$F_{IS}=1-\frac{H_I}{H_S}=1-\frac{0.0097}{0.023}=-0.58$$
$$F_{ST}=1-\frac{H_S}{H_T}=1-\frac{0.023}{0.03}=0.2\bar{3}$$
$$F_{IT}=1-\frac{H_I}{H_T}=1-\frac{0.0097}{0.03}=0.67$$
* Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be? 
$$N_em=\frac{1-F_{ST}}{4F_{ST}}$$
$$N_em=\frac{1-0.53}{4(0.53)}=0.22$$
$$N_e=\frac{0.22}{0.1}=2.2$$
* Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still O.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 generations? What biological principle is illustrated by these results?

3.  In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal to 0.168. Calculate the expected frequency in the next generation, assuming.

**The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1**
$$p^2=0.168$$
$$p=\sqrt{0.168}=0.41$$
$$q=1-0.41=0.59$$
|Genotype|Zygote freq|Relative Fitness|$$\overline{w}=p^2w_{11}+2pqw_{12}+q^2w_{22}$$|Fitness after Selection|
|------|-------|-------|--|-------|
|C<sub>y</sub>/C<sub>y</sub>|$p^2=0$|0|0|0|
|C<sub>y</sub>/+|$2pq=2(0.41)(0.59)=0.48$|1|$$=0+0.48(1)+0.35(1)=0.83$$|$$\frac{0.48}{0.83}=0.58$$
|+/+|$q^2=0.59^2=0.35$|1|$$=0+0.48(1)+0.35(1)=0.83$$|$$\frac{0.35}{0.83}=0.42$$
#
**The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5**
|Genotype|Zygote freq|Relative Fitness|$$\overline{w}=p^2w_{11}+2pqw_{12}+q^2w_{22}$$|Fitness after Selection|
|------|-------|-------|--|-------|
|C<sub>y</sub>/C<sub>y</sub>|$p^2=0$|0|0|0|
|C<sub>y</sub>/+|$2pq=2(0.41)(0.59)=0.48$|0.5|$$=0+0.48(0.5)+0.35(1)=0.59$$|$$\frac{0.48}{0.59}=0.81$$
|+/+|$q^2=0.59^2=0.35$|1|$$=0+0.48(0.5)+0.35(1)=0.59$$|$$\frac{0.35}{0.59}=0.59$$
#
4. If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?

|Genotypes|s|
|-|-|
|A<sub>1</sub>A<sub>1|$1-1.5=-0.5$|
|A<sub>1</sub>A<sub>2|$1-1.1=-0.1$|
|A<sub>2</sub>A<sub>2|$1-1.0=0$|
#
$$s=1-W$$
$$h=\frac{(wA_1A_1+wA_2A_2-2(A_1A_2)}{(2(A_1A_1+wA_2A_2-2(A_1A_2))}$$
$$\frac{(1.5+1.0-2(1.1)}{(2(1.5+1.0-2(1.1))}=0.5$$
#
5. Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtra-tion. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956). 

      * Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous

$$p^2+2pq=0.87$$
$$q^2=1-0.87=0.13$$
$$q=\sqrt{q^2}=\sqrt{0.13}=0.36$$
$$p=1-q=1-0.36=0.64$$
$$2pq=2(0.36)(0.64)=0.46$$
#
 *   In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year.

         * Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.
$$\Delta{p}=sp(1-p)$$
$$\Delta{p}=0.95-0.01=0.94$$
$$s=\frac{\Delta{p}}{p(1-p)}$$
$$s=\frac{0.94}{(0.01*0.99)}$$
$$s\approx{9.49}$$
#
         * How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics
$$q^2+2pq\Delta{t}$$
$$=(0.01)^2+2(0.01)(0.99)(1-e^{-2\Delta{t}})$$
$$t=193$$
#
6. Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968).
One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were *Standard* (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele." What equilibrium frequency of ST is predicted? What equilibrium value of $\bar{w}$ is predicted?

|"Allele"|Freq|
|---|---|
|*ST*/*ST*|0.47 --> w<sub>11</sub>|
|*ST*/*AR*|1.0 --> w<sub>12</sub>|
|*AR*/*AR*|0.62 --> w<sub>22</sub>|
#
$$p^*=\frac{w_{12}-w_{22}}{2w_{12}-w_{11}-w_{22}}$$
$$p^*=\frac{1.0-0.62}{2(1.0)-0.47-0.62}$$
$$p^*=0.42$$
$$q^*=\frac{w_{12}-w_{11}}{2w_{12}-w_{11}-w_{22}}$$
$$q^*=\frac{1.0-0.47}{2(1.0)-0.47-0.62}$$
$$q^*=0.58$$
#
$$\bar{w}=p^2w_{11}+2pqw_{12}+q^2w_{22}$$
$$\bar{w}=(0.42)^2(0.47)+2(0.42)(0.58)(1.0)+(0.58)^2(0.62)$$
$$\bar{w}=0.78$$
#

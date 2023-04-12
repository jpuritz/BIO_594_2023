# Keegan Hart Problem Set 4
## Due 3/29/2023

### Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week6_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document


## Problems


1. Cross and Birley (1986) studied restriction site variation in the region of alccohol dehydrogenase (*Adh*)gene of *D. melanogaster* in a  population descended from flies trapped at a Dutch fruit market in Groningen.  The following data was collected:

| *Adh* Allele | *Eco*RI Allele| Individuals|G|
|-------------|----------------|------------|---|
*Adh<sup>F</sup>*| *Eco*RI<sup>+</sup> | 22|$\frac{22}{34}=0.647$
*Adh<sup>S</sup>*| *Eco*RI<sup>+</sup> | 4|$\frac{4}{34}=0.118$
*Adh<sup>F</sup>*| *Eco*RI<sup>-</sup> | 3|$\frac{3}{34}=0.088$
*Adh<sup>S</sup>*| *Eco*RI<sup>-</sup> | 5|$\frac{5}{34}=0.147$

Where *Adh<sup>F</sup>* and *Adh<sup>S</sup>* are the allozyme alleles of *Adh* and *Eco*RI<sup>+</sup> and *Eco*RI<sup>-</sup> indicate the presence or absence of an *Eco*RI restriction site 3.5 kb downstream
   * Test for the presence of linkage disequilibrium
   * If significant, express *D* relative to its theoretical maximum or minimum.

>$$D = G_1G_4 - G_2G_3$$
>$$D = (0.647)(0.147)-(0.118)(0.088)=0.095-0.010 = 0.085$$
>There is no presence of linkage disequilibrium
2. Three linked loci in a random mating population have the gametic frequencies shown in the table below. Calculate the linkage disequilibrium *D*/*D<sub>max</sub>* between each pair of genes. Explain why the results seem paradoxical.

|Genotype | Frequency|
|---------|------|
| *ABC*| 0.25|
| *ABc*| 0|
| *AbC*| 0.25|
|*Abc*| 0|
|*aBC* | 0|
|*aBc* | 0.25|
|*abC* | 0|
|*abc*|0.25|

>From looking at the table it is clear to me that there is complete linkage between the a and c loci and no clear linkage between b and a or b and c 

>|Allele|Frequency|
>|-----|----------|
>|A|0.5|
>|a|0.5|
>|B|0.5|
>|b|0.5|
>|C|0.5|
>|c|0.5|

>|Genotype|Frequency|
>|--------|-------|
>|AB| G = (0.5)(0.5)=0.25|
>|Ab| G = (0.5)(0.5)=0.25|
>|aB| G = (0.5)(0.5)=0.25|
>|ab| G = (0.5)(0.5)=0.25|
>|AC| G = (0.5)(0.5)=0.25|
>|Ac| G = (0.5)(0.5)=0.25|
>|aC| G = (0.5)(0.5)=0.25|
>|ac| G = (0.5)(0.5)=0.25|
>|BC| G = (0.5)(0.5)=0.25|
>|Bc| G = (0.5)(0.5)=0.25|
>|Bc| G = (0.5)(0.5)=0.25|
>|bc| G = (0.5)(0.5)=0.25|

>If I were to calculate all of the D values for each pair of loci they would all be 0
>\
>D max would be 0 as well. 
>\
>This is paradoxical because the a and b loci seem to be linked

3. Two populations are examined for the same pair of loci with the following results in terms of two-locus gamete numbers:

|Population|Gamete| Count|G|
|----------|------|-------|---|
| Pop 1| AB | 720|G1 = 0.72|
| Pop 1| Ab | 180|G2 = 0.18|
| Pop 1| aB | 80|G3 = 0.08|
| Pop 1| ab | 20|G4 = 0.02|
| Pop 2| AB | 300|G1 = 0.03|
| Pop 2| Ab | 2700|G2 = 0.27|
| Pop 2| aB | 700|G3 = 0.07|
| Pop 2| ab | 6300|G4 = 0.63|


These two populations are now combined to form a third:

|Population|Gamete| Count|G|
|----------|------|-------|---|
| Pop 3| AB | 1020|G1 = 0.093|
| Pop 3| Ab | 2880|G2 = 0.262|
| Pop 3| aB | 780|G3 = 0.071|
| Pop 3| ab | 6320|G4 = 0.575|

   * Calculate the two-locus gamete frequencies for each population and the gameticphase imbalance (linkage disequilibrium). Is any population out of linkage equilibrium?
> Pop 1:$$ D = G_1G_4 - G_2G_3 = (0.72)(0.02)-(0.18)(0.08)$$
>$$D = 0.0144 - 0.0144$$
>$$D = 0$$

> Pop 2:$$ D = G_1G_4 - G_2G_3 = (0.03)(0.63)-(0.27)(0.07)$$
>$$D = 0.0189 - 0.0189$$
>$$D = 0$$

>Both populations are out of linkage equilibrium 
   * What is the effect of pooling of the two populations on linkage equilibrium?
> Pop 3:$$ D = G_1G_4 - G_2G_3 = (0.093)(0.262)-(0.071)(0.575)$$
>$$D = 0.053 - 0.0186$$
>$$D = 0.034$$
   * Suppose that the recombination rate between loci A/a and B/b is 0.1. What is the expected disequibrium in the offspring of population 3 (the parental gene pool), assuming random mating? In the second generation?
   >1. Disequilibrium in offspring of parental gene pool:
   >$$D'=D(1-r)$$
   >$$D'=0.034(0.9)=0.036$$
   >2. Disequilibrium in second generation: 
   >$$D_t=D_0(1-r)^t$$
   >$$D_t=0.034(0.9)^2=0.028$$

   * Can this single episode of admixture be detected in the population established from population 3 after two generations of random mating? Can it be detected in the genotype frequencies at the A/a locus after two generations of random mating? Can it be detected in the genotype frequencies at the B/b locus after two generations of random mating?
   >The episode of admixture can be detected from the second generation due ot the fact that the population is still in disequilibrium 

4. A continuous trait is distributed approximately according to a normal distribution with mean 100 and standard deviation of 15.  What proportion of the population is expected to have a phenotypic value above 130?  Below 85?  Above 85?
>1. 2.28% of the population is expected to have a phenotypic value above 130
>2. 15.87% of the population is expected to have a phenotypipic value below 85
>3. 84.13% of the population is expected to have a phenotypipic value above 85

5. A genetically heterogeneous population of wheat has a variance in the number A days to maturation of 40, whereas two inbred populations derived from it have a variance in the number of days to maturation of 10.  
   * What is the genotypic variance (V<sub>G</sub> or $\sigma_{g}^2$), the environmental variance (V<sub>E</sub> or $\sigma_{e}^2$), and the broad sense heritablilty *H*<sup>2</sup>, of days to maturation in this population?
      > * phenotypic variance: 40 
      > * environmental variance: 10 
      > * genotypic variance = 40- 10 = 30
      > * broad sense heritability: 30/40 = 0.75
   * If the inbred lines were crossed, what would be the predicted variance in days to maturation of the F<sub>1</sub> generation?
      > * the predicted variance in days to maturation of the F<sub>1</sub> would be 10 because the F<sub>1</sub> would have no genetic variance 

6. In comparing a quantitative trait in the F<sub>1</sub> and F<sub>2</sub> generations obtained by crossing two highly inbred strains: 
   * Which set of progeny provides an estimate of the environmental variance?
      >The F1 generation provides a better estimate of the environmental variance because each inbred line has essentially no genotypic variance so when crossed there are little genetic differences between offspring
   * What determines the variance of the other set of progeny?
      >the variance of the F2 generation is determined by the genotypic and environmental variance
7. In a cross between two cultivated inbred varieties of tobacco, the variance in leaf number per plant in the F<sub>1</sub> generation is 1.46 and in the F<sub>2</sub> generation it is
5.97. What are the genotypic and environmental variances? What is the broad-sense heritability in leaf number?
   > * F1 genotypic variance: 0 (offspring are all ~ genetically identical)
   > * F1 environmental variance: 1.46
   > * F2 genotypic variance: 4.51
   > * F2 environmental variance: 0 (environment is same as F1)
   > * Broad sense hertitability: $\frac{4.51}{5.97}=0.755$


















# Problem Set 4
## Due 3/29/2023








1. Cross and Birley (1986) studied restriction site variation in the region of alcohol dehydrogenase (*Adh*)gene of *D. melanogaster* ina  population descended from flies trapped at a Dutch fruit market in Groningen.  The following data was collected:

| *Adh* Allele | *Eco*RI Allele| Individuals|
|-------------|----------------|------------|
*Adh<sup>F</sup>*| *Eco*RI<sup>+</sup> | 22|
*Adh<sup>S</sup>*| *Eco*RI<sup>+</sup> | 4|
*Adh<sup>F</sup>*| *Eco*RI<sup>-</sup> | 3|
*Adh<sup>S</sup>*| *Eco*RI<sup>-</sup> | 5|

Where *Adh<sup>F</sup>* and *Adh<sup>S</sup>* are the allozyme alleles of *Adh* and *Eco*RI<sup>+</sup> and *Eco*RI<sup>-</sup> indicate the presence or absence of an *Eco*RI restriction site 3.5 kb downstream
   * Test for the presence of linkage disequilibrium
     * **Total # of individuals = 22 + 4 + 3 + 5 = 34**
     * G1 = 22/34 = 0.65
     * G2 =  4/34 = 0.12
     * G3 = 3/34 = 0.09
     * G4 = 5/34 = 0.14
     * **D = G1G4 - G2G3 = 0.65* 0.14 - 0.12* 0.09 = 0.091 - 0.0108 = 0.0802**
     * **D > 0, so this indicates that the two loci are not associated at random with respect to each other, and the population is said to be in gametic disequilibrium.**
   * If significant, express *D* relative to its theoretical maximum or minimum.
     * **The theoretical maximum of D is 0.25, which would occur if G1 and G4 = 0.5 and G2 and G3 = 0. The smallest value possible is -0.25, which would occur if G2 and G3 = 0.5 and G1 and G4 = 0.**
     * **Since Dmax = 0.25, D/Dmax = 0.0802/0.25 = 0.3208.**

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

AB: D = G1G4 - G2G3 = AB* ab - Ab * aB = 0.25* 0.25 - 0.25* 0.25 = 0

BC: D = G1G4 - G2G3 = BC* bc - Bc * bC = 0.25* 0.25 - 0.25* 0.25 = 0

AC: D = G1G4 - G2G3 = AC* ac - Ac * aC = 0.5* 0.5 - 0* 0 = 0.25

While the pairs AB and BC are not in gametic disequilibrium, A and C are in gametic disequilibrium. This seems paradoxical because if A and C are linked it would suggest that they would also be linked with B.

3. Two populations are examined for the same pair of loci with the following results in terms of two-locus gamete numbers:

|Population|Gamete| Count|
|----------|------|-------|
| Pop 1| AB | 720|
| Pop 1| Ab | 180|
| Pop 1| aB | 80|
| Pop 1| ab | 20|
| Pop 2| AB | 300|
| Pop 2| Ab | 2700|
| Pop 2| aB | 700|
| Pop 2| ab | 6300|

These two populations are now combined to form a third:

|Population|Gamete| Count|
|----------|------|-------|
| Pop 3| AB | 1020|
| Pop 3| Ab | 2880|
| Pop 3| aB | 780|
| Pop 3| ab | 6320|

   * Calculate the two-locus gamete frequencies for each population and the gametic phase imbalance (linkage disequilibrium). Is any population out of linkage equilibrium?

| Population | Gamete | Count | Population Total | Gamete Frequencies | G1*G4  | G2*G3  | D = G1*G4 - G2*G3 |
|------------|--------|-------|------------------|--------------------|--------|--------|-------------------|
| Pop 1      | AB     | 720   | 1000             | 0.72               | 0.0144 | 0.0144 | 0.0000            |
| Pop 1      | Ab     | 180   | 1000             | 0.18               |        |        |                   |
| Pop 1      | aB     | 80    | 1000             | 0.08               |        |        |                   |
| Pop 1      | ab     | 20    | 1000             | 0.02               |        |        |                   |
| Pop 2      | AB     | 300   | 10000            | 0.03               | 0.0189 | 0.0189 | 0.0000            |
| Pop 2      | Ab     | 2700  | 10000            | 0.27               |        |        |                   |
| Pop 2      | aB     | 700   | 10000            | 0.07               |        |        |                   |
| Pop 2      | ab     | 6300  | 10000            | 0.63               |        |        |                   |
| Pop 3      | AB     | 1020  | 11000            | 0.09               | 0.0533 | 0.0186 | 0.0347            |
| Pop 3      | Ab     | 2880  | 11000            | 0.26               |        |        |                   |
| Pop 3      | aB     | 780   | 11000            | 0.07               |        |        |                   |
| Pop 3      | ab     | 6320  | 11000            | 0.57               |        |        |                   |

**Population 3 has a D = 0.0347, so it is out of linkage equilibrium**

   * What is the effect of pooling of the two populations on linkage equilibrium?

**It causes the linkage equilibrium of both populations to go out of linkage equilibrium.**

   * Suppose that the recombination rate between loci A/a and B/b is 0.1. What is the expected disequibrium in the offspring of population 3 (the parental gene pool), assuming random mating? In the second generation?

**F1 : D = D(1−r) = 0.0347(1-0.1) = 0.0312**

**F2 : D = D(1−r) = 0.0312(1-0.1) = 0.0281**

   * Can this single episode of admixture be detected in the population established from population 3 after two generations of random mating? Can it be detected in the genotype frequencies at the A/a locus after two generations of random mating? Can it be detected in the genotype frequencies at the B/b locus after two generations of random mating?

**No, the population is still in gametic disequilibrium after one and after two generations.**

4. A continuous trait is distributed approximately according to a normal distribution with mean 100 and standard deviation of 15.  What proportion of the population is expected to have a phenotypic value above 130?  Below 85?  Above 85?

**2.28 % of the population will have a phenotypic value above 130, which is 2 SDs above the mean. 15.87% of the population will have a phenotypic value below 85, which is 1 SD below the mean. 84.13% (or 100-15.87) of the population will have a phenotypic value above 85, which is 1 SD below the mean.**

5. A genetically heterogeneous population of wheat has a variance in the number A days to maturation of 40, whereas two inbred populations derived from it have a variance in the number of days to maturation of 10.  
   * What is the genotypic variance (V<sub>G</sub> or $\sigma_{g}^2$), the environmental variance (V<sub>E</sub> or $\sigma_{e}^2$), and the broad sense heritablilty *H*<sup>2</sup>, of days to maturation in this population?

**Since the variance of the two inbred lines is 10, this is the Environmental Variance, VE.**

**VP =VE+VG**

**40 = 10+VG**

**VG = 30**

**H^2, or HB = 30/40 = 0.75**

   * If the inbred lines were crossed, what would be the predicted variance in days to maturation of the F<sub>1</sub> generation?

**Since the lines are already genetically uniform, the variance of the offspring would be the same as the parents, 10.**

6. In comparing a quantitative trait in the F<sub>1</sub> and F<sub>2</sub> generations obtained by crossing two highly inbred strains: 
   * Which set of progeny provides an estimate of the environmental variance?

**The first generation of offsping, or F1, gives us an estimate of VE.**

   * What determines the variance of the other set of progeny?

**The second generation of offsping, or F2, has variance determined by VG and VE.**

7. In a cross between two cultivated inbred varieties of tobacco, the variance in leaf number per plant in the F<sub>1</sub> generation is 1.46 and in the F<sub>2</sub> generation it is
5.97. What are the genotypic and environmental variances? What is the broad-sense heritability in leaf number?

**F1: 1.46 = VE**

**F2: VP = 5.97 = VE + VG**

**F2: VG = 5.97 - 1.46 = 4.51**

**Broad sense heritability, H^2, or HB = VG/VP = 4.51/5.97 = 0.755**

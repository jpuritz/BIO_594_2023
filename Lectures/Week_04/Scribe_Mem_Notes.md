# BIO_594 Week 4
#BIO_594 #Genomics #Grad_class

Scribe: Zoe Dellaert

## Chapter 6: Small populations and genetic drift
presentation link: https://docs.google.com/presentation/d/1VjbhuSvSpGeKPJf_iPcYrwq88rgEzG0EuVIMs9g84Ag/edit?usp=sharing

### Genetic Drift
 * Genetic drift is the predominant evolutionary force causing allele frequency change.
   * fragmentation
   * isolation
   * habitat loss
   * in critically small populations, drift can cause rapid chnages in allele frequencies form one generation to the next
   * = random change in allele frequencies from generation to generation b/c of a sampling error
   * --> finite number of genes transmitted to progeny will be an imperfect sample of the allele frequencies in the previous generation
 * Simulating the Wright-Fisher model
   * https://stephens999.github.io/fiveMinuteStats/wright_fisher_model.html
   * understanding the effects of allele frequency, mutation rate, and population size
 * key takeaways
   * allele frequencies will change
   * genetic variation will typically be lost

### Equations
 * binomial sampling variance
   * change in allele frequencies from one generation to the next bc of genetic drift is a problem in sampling
   * 
   
### Inbreeding
 * inbreeding effect of small populations
   * occurs when related individuals mate with one another
   * consequence of small population size
   * mating between relatives will cause an increase in homozygosity
     * allele frequency changes

### Inbreeding coefficient equation derivation
 * inbreeding coefficient - increase in homozygosity due to genetic drift
 * Autozygosity or fixation index
   * expected increase in homozygosity at generation t
 * Transform the inbreeding coefficient to calculate heterozygosity (h)
 * Expected decline in h per generation
 * After one generation
 * Expand to t generations

### Example 6.1 bottleneck in the Maritius kestrel
 * Known population size across the bottleneck; records from Mauritius naturalists (black bars) and the Mauritius Wildlife Foundation (red bars); data calculated at 4-year intervals.
 * b, Hexanucleotide microsatellite genotypes of Mauritius kestrel museum skins (top) include a mixture of alleles unique to the ancestral population (arrows) and those found in the restored population (bottom).
 * c, The relationship between estimates of effective population size and species range. The 95% confidence limits are shown for the linear regression through all species, excluding the restored Mauritius (red) and Seychelles (white) population. Points show modal ΔNe values estimated using the likelihood function for the k-alleles model; error bars show the 95% credible interval.
 * 10 microsatellite loci
 * Compared living bird to museum loci
 * Heterozygosity of restored 0.099
 * Heterozygosity of ancestral 0.231
 * Retained 43 % heterozygosity
 * Use equations 6.6 and 6.7 to estimate bottleneck effects
   * We can use Equation 6.7 to see that the amount of heterozygosity in the restored population of Mauritius kestrels is approximately the same as we would expect after a bottleneck of two individuals for three generations:
     * The actual bottleneck in Mauritius kestrels was almost certainly longer than three generations with more birds than two birds each generation. However, the equations in this chapter all assume discrete generations and cannot be applied directly to species such as the Mauritius kestrels that have overlapping generations. 
   * One generation bottleneck
   * Three generation bottleneck

### Loss of Allelic diversity
 * rapid loss of allelic diversity after one generation
   * The probability of an allele being lost during a bottleneck of size N is (equation). where p is the frequency of the allele. This is the probability of sampling all of the gametes to create the next generation (2N) without selecting at least one copy of the allele in question.
 * probability of retention of different alleles
Founder effects
 * founding a new population by a small # of individuals will cause abrupt chaneges in allele frequency and loss of genetic variation
 * Where N = 2, only 25% of heterozygosity is lost in one generation
   * Two individuals retain 75% of homozygosity
 * expected heterozygosities in three subpopulations of guppies going through a bottleneck of 2 individuals and growing with diff. rates
   * N(t) = k/ (1 + b_e^{-rt})

### Genotypic proportions in small populations
 * 1/(8N_m) =1/(8N_f)
 * excess of heterozygotes in small pops of animals and plants w/ separate sexes

### Distribution of Fis values in channel island foxes
 * Santa catalina vs san nicolas islands
   * Very different results were found in an examination of the same loci in 46 foxes from nearby San Nicolas Island. There is a substantial deficit of homozygotes in this sample (FIS = −0.386; Figure 6.12). This almost certainly results from the small population size of foxes on this island. An estimate of the genetically effective population size (Chapter 7) of foxes on this island is approximately two. Supporting this observation, only 131 of these SNP loci were polymorphic compared with 3,940 loci in the Santa Catalina sample.
   * Santa Catalina --> heterozygote deficit
   * San Nicolas --> homozygote deficit
 * Population bottlenecks and decreased hatching success in endangered birds
   * Effect of bottleneck size (smallest number of individuals recorded in the population) and percent hatching failure in threatened birds. Hatching failure is plotted on a linear scale and bottleneck size is plotted on a logarithmic scale, although both were log transformed in analyses.

### Effects of Genetic drift
 * Changes in allele frequency
   * harmful deleterious allele propagation
   * dog breeds
 * loss of allelic diversity
   * MHC of vertebrates
   * resistance genes (R-genes)
 * inbreeding depression
   * Darwin and deer in park losing vigor
   * Zoo pedigrees

### Detecting Bottlenecks
 * cockatoo example
 * see discussion notes below!

## Discussion

### Discussion Questions from Megan:
 * “Genetic drift is the primary force bringing about allele frequency changes throughout the genome over time” - p. 111
   * this is a fact
   * drift is not a force, it is a product of other things
     * can be from population size changes, population structuring
       * these end up affecting the entire genome, almost all the loci
   * drift happens no matter what, all the time
     * an inherent part of evolutionary trajectories and affects the entire genome
   * the effects of selection could potentially be erased in a single bottleneck event

 * Under what conditions is genetic drift more apparent?
   * small population sizes
   * new mutations, even in a large population
   * populations (or locus) where you don't have strong natural selection

 * Is there a population size or growth rate where drift becomes less of a concern? What about in species with high dispersal?
   * Jacob says: high dispersal species could still be at risk because they could be easily cut off from the larger population and then founder effects could result
   * Evolving Seas RCN (research coordinating network)
     * local adaptation reading group in marine organisms
       * https://rcn-ecs.github.io/2020_readings/

 * How do you look for a previous population bottleneck and founder effects?
   * cockatoo example
   * what are the signatures of population bottlenecks?
     * if you know the history of a population and if there was some kind of founder effect
     * look at the population and see if a phenotype is off
       * non-genetic phenotypes to examine
   * statistics to use to examine if a population is undergoing a bottleneck
     * channel island foxes example
       * F = inbreeding coefficient
       * F_is is the partitioning of F variance between the individual and the subpopulation
         * an index or relative measure of inbreeding
       * heterozygote deficit is happening at positive values of Fis
         * this is an indicator of a bottleneck, especially if you see it across multiple loci
     * mitochondrial DNA haplotype networks
       * use structure of the network to ID if you are in a phase of growth or retraction (bottleneck)
         * high levels of growth --> star-shaped network
           * one giant super common haplotype with lots of smaller ones around it
             * one group was successful and there is one dominant haplotype
         * retraction (bottleneck) --> sparse networks between haplotypes
           * alleles that are very phylogenetically distant from each other
           * population decline or bottleneck
     * Tajima's D

 * How do you detect inbreeding depression (with purifying selection)? p. 131
   * 
     
### Extra Discussion Notes
 * How to estimate previous allelic frequency
   * Rarefaction
     * take multiple samples and try to estimate what the total amt of allelic diversity might have been
       * you can get an estimate of what it used to be
       * randomize different samples and stratify at different levels and build a curve to make an educated guess for what the total number of alleles might have been
   * Coaelscene
     * looking backward through evolutionary time
     * look at phylogenetic relationships between alleles to guess at ancestral alleles
     * to try to determine historical allele frequency and possibly population size

## Chapter 7: effective population size

presentation link: https://docs.google.com/presentation/d/1jMJ4S0sx7I52tchdF7cVJL2BaQS-nv72QOitDN-1sTk/edit?usp=sharing

 * Ne = # of contributing breeders to the next generation of offspring within a population
 * N - The raw census of the actual population you are looking at
 * Ideal population assumptions
   * this chapter focuses on violating each of these assumptions to understand what effects that will have on genetic drift and heterozygosity and effective population size (Ne)
     1. Equal number of males and females 
     2. All individuals have an equal probability of contributing an offspring to the next generation
     3. Constant population size
     4. Non-overlapping generations
 * Unequal sex ratio
   * no matter the ratio, M &F contribute the same amt of autosomal genes to the next generation
   * rarer sex will have a larger effect on genetic drift
     * pop size typically not greater than 2x the amt of the rarer sex
   * Ne/N ratios are not largely affected unless there is an excess amount of one sex over the other (rarer sex is less than 15% of the total population)
     * Ne = 4 Nf Nm / Nf+ Nm
       * Reduced to Ne = N when equal number of males and females
 * Nonequal contribution
   * Ne reduced when Vk (gametes) increases
     * ~12% of all individuals will not contribute anything to the population on average in real populations
   * Ne will be larger than the actual population size if Vk < 2
     * This is because the more variation of contributing breeder success = the higher number of breeders contributing which is Ne
 * Varying population size
   * Severe bottlenecks through generations will result in an increased loss of heterozygosity
     * Generations with a smaller N have the greatest effect on genetic variation 
   * Able to calculate the loss of heterozygosity over multiple generations
     * Ne can be calculated at each generation by using the mean of the reciprocal of ideal population size (N)
 * Overlapping generations
   * Severe bottlenecks through generations will result in an increased loss of heterozygosity
     * Generations with a smaller N have the greatest effect on genetic variation 
   * Able to calculate the loss of heterozygosity over multiple generations
     * Ne can be calculated at each generation by using the mean of the reciprocal of ideal population size (N)
       * just focus on the specific population cycle

## Discussion

### Videos:

[Effective Population Size](https://youtu.be/ysV8-8bmXgw)

 * effective population size
   * we know that small populations have higher extinction risk due to inbreeding and genetci drift
   * totoal population size (Nc) is often not a good indicator of extinction risk
     * the real number that matters is Ne, the effective population size
       * on average about 1/10 of the census population size (Nc)
 * why is Ne < N?
   * nonbreeders are too old, too young, too sick, too unattractive (etc) to breed
   * unequal sex ratios
     * if a few males mate with all the females
       * fewer of the total genes get passed on bc the male contribution is not equally represented
   * unequal production of offspring
   * population fluctuations
 * example of unequal sex ratios and Ne
   * Northern Elephant seals
     * polygamous
     * only dominant males breed
       * they love to fight!!
     * one male can mate with 500 females.
       * all of the offspring only have genes from one male, even if the 500 females have a very genetically diverse makeup
   * how does Ne relate to Nc with unequal sex ratios?
     * graph with ratio of breeding males:females on x axis and effective pop size (Ne) on the Y axis
 * how small of a population is OK?
   * 50/500 rule
     * estimate pop size needed to maintain genetic variation in isolated animal populations
       * based on breeding of domestic animals
     * Ne = 50 needed to avoid short-term inbreeding depression
     * Ne = 500 needed to avoid effects of genetic drift over the long term
       * mutation-drift balance: alleles are lost via drift at the same rate at which new alleles originate via mutation
   * species that are long-lived and are good dispersers can persist for a long time with small population size
     * for vertebrates, MVP in range of 500-5000 is common
   * for short-lived dispersal limited species a higher number is needed
     * small, annual plant - closer to 10,000
   * dispersal (gene flow) affects Ne and population structure

[Effective population size_2](https://youtu.be/TWa6i3mn148)

## Questions:
 1. Does effective population size represent the number of breeders contributing to the next generation? (Vs Nb which is number of breeders per year?)
    1. Jon says: the Ne is just an idealized #, it is something that does not exist
       1. we cannot take Nc or # of breeders and effectively calculate Ne
          1. Ne is averaged over time
       2. Ne is a theoretical constrict, but we can actually calculate the # of breeders
 2. Is it true that if Nc = 100 and Ne = 16 that means that census population has genetic diversity equivalent to that of a population of 16 individuals (8 females and 8 males)
    1. Jacob says: No, bc Ne is idealized,
       1. individuals that are too young can move in to become breeders, and the genetic diversity will change over generations
       2. jacob is assuming overlapping generations, but we are reminded that non-overlapping generations is an assumption of the calculation of Ne
    2. Jon says it does!!!
       1. Megan says: even though you have 100 individuals, genetic drift is working as if the population size is actually 16, given the postulates/assumptions:
          1. Equal number of males and females 
          2. All individuals have an equal probability of contributing an offspring to the next generation
          3. Constant population size
          4. Non-overlapping generations
 3. Does the ⅀(ki - k)2 have biological meaning/definition?
    1. Tables 7.1 and 7.2 on p 138
    2. think of broadcast spawning marine species
       1. there can be a wide variance in the number of gametes available
          1. how much of these actually contribute to the next generation
          2. huge variance in this per individual
    3. this is variance of gametes and is being translated to the variance of reproductive success
       1. only accounting for the fact that you can't have two of your own gametes contributing to the offspring
 4. What is the definition of overlapping generations
    1. Parents having offspring while their earlier offspring having offspring
       1. or, more strictly (maybe too strict): parent and offspring living at the same time
       2. is there a chance of an individual having multiple generations of offspring
    2. non-overlapping generations
       1. as soon as the parent dies the offspring comes
       2. squid,salmon
    3. generation = output of a single reproductive cycle
 5. What is definition of a reproductive cycle?
    1. reproductive cycle: time between when an individual can have children
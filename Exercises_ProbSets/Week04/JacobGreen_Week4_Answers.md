# Problem Set 2

## Due 2/22/2023

## Instructions

* Please answer all questions using a Mardown or RMarkdown, showing all work.
* Please place your files in this same directory in the format of `YourName_Week4_Answers.md`
* Problem sets can be worked on collaboratively, but please note who you worked with in your answer document

## Problems

1- What is the probability that a particular allele has at least one copy in the next generation?  The surprising answer quickly becomes independent of population size as *N* becomes larger.  (Hint: Use one minus the probability that the allele has no copies in the next generation and this equation: $\lim\limits_{\varepsilon \to \infty}(1+\varepsilon*x)^\frac{1}{\varepsilon} = e^x$)

   > The probability that this allele doesn’t get chosen to reproduce at a
   given timestep is $1- \frac{1}{2N}$. Since each timestep is independent, the
   probability of this happening for a whole generation is $(1- \frac{1}{2N})^{2N}$.
   >
   >Using the hint given, we can see that for a theoretically infinite
   population, this value, the probability of extinction, becomes $\frac{1}{e}$. So,
   the probability of non-extinction is $1 – \frac{1}{e}$.

2- A highly isolation colony of the month *Panaxia dominula* near Oxford, England has been instenstively studied by Ford and collaborators over the period of 1928-1968 (Ford and Sheppard 1969).  This species has one generation per year, and estimates of the population size were carried out yearly beginning in 1941. For the years 1950-1961, inclusive, estimates of the population size were:

|Year| Individuals|
|------|----------|
| 1950 | 4100 |
| 1951 | 2250 |
| 1952 | 6000 |
| 1953 | 8000 |
| 1954 | 11000 |
| 1955 | 2000 |
| 1956 | 11000 |
| 1957 | 16000 |
| 1958 | 15000 |
| 1959 | 7000 |
| 1960 | 2500 |
| 1961 | 1400 |

Assuming that the actual size of the population in any year equals the effective population size in that year, estimate the average effective number over the entire 12-year period.

   > In Equation 7.9, we can estimate the effective population size over these 12 generations by using the mean of the reciprocal of population size $\frac{1}{N}$ in successive generations, rather than the mean of N itself. This is known as the harmonic mean.
   >
   > $\frac{1}{N_e} = \frac{1}{t}(\frac{1}{N_1}+\frac{1}{N_2}+\frac{1}{N_3} ........+ \frac{1}{N_t})$
   >
   > $N_e = \frac{12}{(\frac{1}{4100}+\frac{1}{2250}+\frac{1}{6000}+\frac{1}{8000}+\frac{1}{11000}+\frac{1}{2000}+\frac{1}{11000}+\frac{1}{16000}+\frac{1}{15000}+\frac{1}{7000}+\frac{1}{2500}+\frac{1}{1400})}$
   >
   > $N_e = \frac{12}{0.003}$
   >
   > $N_e = 3,995$

3- A dairy farmer has a herd consisting of 200 cows and 2 bulls.  What is the effective population size?

> In the case of unequal sex ratios we use the following Equation 7.2
>
> $N_e = \frac{4 N_f N_M}{N_f + N_M}$
>
> $N_e = \frac{4 * 200 * 2}{ 200 + 2}$
>
> $N_e = \frac{1600}{202}$
>
> $N_e = 7.92$

4- A rare triggerplant from Australia (*Stylidium coroniforme*) has only five known populations (Coates 1992). One of these populations has been monitored for several years, and over five years in the early 1980s: 2, 3, 25, 32, and 86 plants were recoreded. Assuming $N_e = N_c$ in that year, estimate $N_e$ as well as the average $N_c$ over this period.  What biological principle is illustrated by this example?

Using the harmonic mean for overlapping generations
> $\frac{1}{N_e} = \frac{1}{t}(\frac{1}{N_1}+\frac{1}{N_2}+\frac{1}{N_3} ........+ \frac{1}{N_t})$
>
> $N_e = \frac{5}{(\frac{1}{2}+\frac{1}{3}+\frac{1}{25}+\frac{1}{32}+\frac{1}{86})}$
> $N_e = \frac{5}{0.916}$
>
> $N_e = 5.46$
>

If we consider non-overlapping generations where Nc1 and Nc2 are the census population sizes of two non-overlapping generations.

> $Ne = (4Nc1 * Nc2) / (Nc1 + Nc2)$
>
>$Ne_{year 1-2} = \frac{4 * 2 * 3}{2 + 3} = 2.4$
>
>$Ne_{year 2-3} = \frac{4 * 3 * 25}{3 + 25} = 3.41$
>
>$Ne_{year 3-4} = \frac{4 * 25 * 32}{25 + 32} = 22.43$
>
>$Ne_{year 4-5} = \frac{4 * 32 * 86}{32 + 86} = 32.78$
>
To estimate the average Ne over the five-year period, we can take the geometric mean of these values:
>
> Average Ne = (2.4 * 3.41 * 22.43 * 32.78)^(1/4) = 8.56
> $N_c = \frac{2+3+25+32+86}{5}$
>
> $N_c = \frac{148}{5}$
>
> $N_c = 29.6$

5- You genotype a species of grasshopper along a transect in the European Alsp.  Near Munich, Germany, you sample 120 individuals; near Inssbruck, Austria, you sample 122 individuals;  near Verona, Italy you sample 118 individuals.  You find the following genotypes:

| Locality| $A_1A_1$ | $A_1A_2$ | $A_2A_2$|
|---------|--------------|---------|---------|
|Munich| 6|33|81|
|Innsbruck| 20|59|43|
|Verona|65|39|14|

* Calculate the frequencies of the two alleles in each population

| Locality| $q$ | $p$ |
|---------|--------------|---------|
|Munich| 0.188|0.812|
|Innsbruck| 0.406|0.594|
|Verona|0.716|0.284|

Genotype frequencies Munich

> $A_1A_1 = (6/120) = 0.05$
> 
> $A_1A_2- = (33/120) = 0.275$
> 
> $A_2A_2 = (81/120) = 0.675$

Allele Frequecies Munich
> $q = A_1 = \frac{2*A_1A_1 + A_1A_2}{2N}$
>
> $q = \frac{2*6 + 33}{2*120}$
>
> $q= \frac{12 + 33}{240}$
>
> $q = 0.1875$
>
> $p = A_2 = \frac{2*A_2A_2 + A_1A_2}{2N}$
>
> $p = \frac{2*81 + 33}{2*120}$
>
> $p= \frac{162 + 33}{240}$
>
> $p = 0.8125$

Genotype frequencies Innbruck
> $A_1A_1 = (20/122) = 0.164$
>
> $A_1A_2- = (59/122) = 0.484$
>
> $A_2A_2 = (43/122) = 0.352$

Allele Frequecies Innsbruck
> $q = A_1 = \frac{2*A_1A_1 + A_1A_2}{2N}$
>
> $q = \frac{2*20 + 59}{2*122}$
>
> $q= \frac{40 + 59}{244}$
>
> $q = 0.406$
>
> $p = A_2 = \frac{2*A_2A_2 + A_1A_2}{2N}$
>
> $p = \frac{2*43 + 59}{2*122}$
>
> $p= \frac{86 + 59}{244}$
>
> $p = 0.594$

Genotype frequencies Verona
> $A_1A_1 = (65/118) = 0.551$
>
> $A_1A_2- = (39/118) = 0.331$
>
> $A_2A_2 = (14/118) = 0.118$

Allele Frequecies Verona
> $q = A_1 = \frac{2*A_1A_1 + A_1A_2}{2N}$
>
> $q = \frac{2*65 + 39}{2*118}$
>
> $q= \frac{130 + 39}{236}$
>
> $q = 0.716$
>
> $p = A_2 = \frac{2*A_2A_2 + A_1A_2}{2N}$
>
> $p = \frac{2*14 + 39}{2*118}$
>
> $p= \frac{28 + 39}{236}$
>
> $p = 0.284$

 Calculate observed heterozygosity (based on heterozygous genotypes )
> $H_{obs}Munich = \frac{33}{120} = 0.275$
>
> $H_{obs}Innsbruck = \frac{59}{122} = 0.484$
>
> $H_{obs}Verona = \frac{39}{118} = 0.331$

Calculate expected heterozygosity ($2pq$)
> $H_{exp}Munich = 2*0.118*0.812 = 0.192$
>
> >[Observed > Expected] ($0.275 > 0.192$)
>
> $H_{obs}Innsbruck = 2*0.406*0.594 = 0.482$
>
> >[Observed = Expected] ($0.484 \approx 0.482$)
>
> $H_{obs}Verona = 2*0.716*0.284 = 0.406$
>
> >[Observed < Expected] ($0.331 < 0.406$)
>

* Do any populations have excess heterozygotes?
  > Yes, Munich
* Do any populations have a deficit of heterozygotes?
  > Yes, Verona
* Calculate $F_{is}$ for each of the populations and how does this related to B and C?
  * Hint: this the equation $F_{is} = \frac{H_S - H_I}{H_S}$
  * I suggest looking it up, but you can likely figure it out from context

The population inbreeding coefficient $F = \frac{H_{exp} - H_{obs}}{H{exp}}$ is essentially the $F_{is}$ equivalent for single populations
>
> $F_{munich} = \frac{0.192-0.275}{0.192}$
>
> $F_{munich} = -0.432$
> 
> $F_{Innsbruck} = \frac{0.482-0.484}{0.482}$
>
> $F_{Innsbruck} = -0.00415$
> 
> $F_{Verona} = \frac{0.406-0.331}{0.406}$
>
> $F_{Verona} = 0.185$

We will calculate $H_I$ and $H_S$ for the total population

$H_I$ based on observed heterozygosities in populations
> $H_I$ = $\frac{H_{obs1}*N1+H_{obs2}*N2+H_{obs3}*N3+}{N_{total}} = \frac{(0.275 * 120) + (0.484 * 122) + (0.331 * 118)}{360} = 0.3642$
>

$H_S$ based on expected heterozygosities in populations
> $H_S$ =  $\frac{H_{exp1}*N1+H_{exp2}*N2+H_{exp3}*N3+}{N_{total}} = \frac{(0.192 * 120) + (0.482 * 122) + (0.406 * 118)}{360} = 0.3604$

> $F_{is} = \frac{H_S - H_I}{H_S} = \frac{0.3604 - 0.3642}{0.3604} = -0.0105$

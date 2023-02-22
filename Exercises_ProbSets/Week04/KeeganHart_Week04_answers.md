# Keegan Hart Problem Set 2

## Problems

1.  What is the probability that a particular allele has at least one copy in the next generation?  The surprising answer quickly becomes independent of population size as *N* becomes larger.  (Hint: Use one minus the probability that the allele has no copies in the next generation and this equation: $\lim\limits_{\varepsilon \to \infty}(1+\varepsilon*x)^\frac{1}{\varepsilon} = e^x$)

**Answer Set 1**
\
> The probability that an allele will not make it to the next generation is:$$1-p^{2N}$$

>So therefore the probability that an allele has at least one copy in the next generation is:$$1-(1-p^{2N})$$ 

>I am not entirely sure how the limit equation fits in other than the fact that p can only range from 0-1 (because p represents the frequency of an allele) and as N grows in size p<sup>2n</sup> will decrease (in total the equation approaches zero).


2.  A highly isolation colony of the month *Panaxia dominula* near Oxford, England has been instenstively studied by Ford and collaborators over the period of 1928-1968 (Ford and Sheppard 1969).  This speices has one generation per year, and estimates of the population size were caried out yearly begnining in 1941.  For the years 1950-1961, inclusive, estimates of the population size were: 

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
   * Assuming that the actual size of the population in any year equals the effective population size in that year, estimate the average effective number over the entire 12-year period.

**Answer Set 2**
$$N_e = \frac{t}{\sum (\frac{1}{N_i})}$$
$$N_e = \frac{12}{\frac{1}{4100}+\frac{1}{2250}+\frac{1}{6000}+\frac{1}{8000}+\frac{1}{11000}+\frac{1}{2000}+\frac{1}{11000}+\frac{1}{16000}+\frac{1}{15000}+\frac{1}{7000}+\frac{1}{2500}+\frac{1}{1400}}$$
$$N_e = 3936$$

3.  A dairy farmer has a herd consisting of 200 cows and 2 bulls.  What is the effective population size?

**Answer Set 3**
$$N_e = \frac {4N_fN_m}{N_f + N_m}$$
$$N_e = \frac{4 * 200 * 2}{200 + 2} = \frac{1600}{202}=7.92$$

4.  A rare triggerplant from Australia (*Stylidium coroniforme*) has only five known populations (Coates 1992).  One of these populations has been monitored for several years, and over five years in the early 1980s: 2, 3, 25, 32, and 86 plants were recoreded.  Assuming *N<sub>e</sub>* = *N<sub>c</sub>* in that year, estimate *N<sub>e</sub>* as well as the average *N<sub>c</sub>* over this period.  What biological principle is illustrated by this example?

**Answer Set 4**

$$N_c = \frac{2 + 3 + 25 + 32 + 86}{5} = 29.6$$
$$N_e = \frac{5}{\frac{1}{2}+\frac{1}{3}+\frac{1}{25}+\frac{1}{32}=\frac{1}{86}} = 5.46$$

>The biological principle exhibited by this example is the bottleneck effect which shows that "a rapid expansion in numbers does not affect the previous loss of genetic varation; it merely reduces the current rate of loss" pg 139 in book

5.  You genotyep a species of grasshopper along a transect in the European Alsp.  Near Munich, Germany, you sample 120 individuals; near Inssbruck, Austria, you sample 122 individuals;  near Verona, Italy you sample 118 individuals.  You find the following genotypes:

| Locality| A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub>|
|---------|--------------|---------|---------|
|Munich| 6|33|81|
|Innsbruck| 20|59|43|
|Verona|65|39|14|

* Calculate the frequencies of the two alleles in each population

| Locality| p | q |H<sub>obs|H<sub>exp|
|---------|--------------|---------|---------|-------------|
|Munich|$$\frac{2(6)+33}{120(2)} = .188$$|$$\frac{2(81)+33}{120(2)} = .812$$|$$\frac{33}{120}= 0.275$$|$$2(.188)(.812)=.305$$|
|Innsbruck|$$\frac{2(20)+59}{122(2)} = .41$$|$$\frac{2(43)+59}{122(2)} = .59$$|$$\frac{59}{122}= 0.48$$|$$2(.41)(.59)=.48$$|
|Verona|$$\frac{2(65)+39}{118(2)} = .72$$|$$\frac{2(14)+39}{118(2)} = .28$$|$$\frac{39}{118}= 0.33$$|$$2(.72)(.28)=.40$$|

* Do any populations have excess heterozygotes?

> no populations have excess heterozygotes as no populations have a H<sub>obs</sub> > H<sub>exp

* Do any populations have a deficit of heterozygotes?
> Munich and Verona have a deficit of heterozygotes because in both cases H<sub>obs</sub> < H<sub>exp

* Calculate *F<sub>IS</sub>* for each of the populations and how does this related to B and C?
   * Hint: this the equation $F_{IS} = \frac{H_S - H_I}{H_S}$
   * I suggest looking it up, but you can likely figure it out from context
   
$$F_{IS} = 1- \frac{H_o}{H_e}$$ 

Locality|N|F<sub>IS|
|-------|-------|------|
|Munich|120|$$1-\frac{0.275}{0.305} = 0.098$$|
|Innsbruck|122|$$1-\frac{0.48}{0.48} = 0$$|
|Verona|118|$$1-\frac{0.33}{0.40} = 0.175$$|

> F<sub>IS</sub> relates to B and C because Munich and Verona both have both have excess heterozygosity which means that they must have positive F<sub>IS</sub> values. Innsbruck has a F<sub>IS</sub> value of 0 meaning it does not have excess heterozygotes or homozygotes. If any of the localities had negative F<sub>IS</sub> it would show they had heterozygote deficit.
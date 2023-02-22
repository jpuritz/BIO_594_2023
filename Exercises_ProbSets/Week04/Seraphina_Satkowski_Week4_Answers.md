## Seraphina's Problem Set 2
#
## Due 2/22/2023
#

## Problems

1.  What is the probability that a particular allele has at least one copy in the next generation?  The surprising answer quickly becomes independent of population size as *N* becomes larger.  (Hint: Use one minus the probability that the allele has no copies in the next generation and this equation: $\lim\limits_{\varepsilon \to \infty}(1+\varepsilon*x)^\frac{1}{\varepsilon} = e^x$)

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
$$N1+N2+N3+N4+N5+N6+N7+N8+N9+N10+N11+N12=$$
$$4100+2250+6000+8000+11000+2000+11000+16000+15000+7000+2500+1400= 86250$$
$$Ne=\frac{t}{\sum(\frac{1}{Ni})}$$
$$Ne=\frac{12}{(\frac{1}{4100}+\frac{1}{2250}+\frac{1}{6000}+\frac{1}{8000}+\frac{1}{11000}+\frac{1}{2000}+\frac{1}{11000}+\frac{1}{11000}+\frac{1}{16000}+\frac{1}{15000}+\frac{1}{7000}+\frac{1}{2500}+\frac{1}{1400})}=3936$$
**Average effective number over the next 12 years is $$Ne=3936$$** 
#
3.  A dairy farmer has a herd consisting of 200 cows and 2 bulls.  What is the effective population size?
$$Ne=\frac{4NfNm}{Nf+Nm}$$
$$Ne=\frac{4(200)(2)}{200+2}=7.9$$
$$Ne=7.9$$
#
4.  A rare triggerplant from Australia (*Stylidium coroniforme*) has only five known populations (Coates 1992).  One of these populations has been monitored for several years, and over five years in the early 1980s: 2, 3, 25, 32, and 86 plants were recoreded.  Assuming *N<sub>e</sub>* = *N<sub>c</sub>* in that year, estimate *N<sub>e</sub>* as well as the average *N<sub>c</sub>* over this period.  What biological principle is illustrated by this example?
$$Nc=2+3+25+32+86=148$$
$$Nc=148/5$$
$$Nc=29.6$$
$$Ne=\frac{5}{\frac{1}{2}+\frac{1}{3}+\frac{1}{25}+\frac{1}{32}+\frac{1}{86}}$$
$$Ne=\frac{5}{.912}=5.48$$
$$Ne=5.48$$
The biological principle that is illustrated here is fluctuating population size
#
5.  You genotype a species of grasshopper along a transect in the European Alsp.  Near Munich, Germany, you sample 120 individuals; near Inssbruck, Austria, you sample 122 individuals;  near Verona, Italy you sample 118 individuals.  You find the following genotypes:

| Locality| A<sub>1</sub>A<sub>1</sub> | A<sub>1</sub>A<sub>2</sub> | A<sub>2</sub>A<sub>2</sub>|
|---------|--------------|---------|---------|
|Munich| 6|33|81|
|Innsbruck| 20|59|43|
|Verona|65|39|14|

* Calculate the frequencies of the two alleles in each population

**Munich**
$$p=freq(A1)=\frac{(2(6)+33)}{2(120)}=.1875$$
$$q=freq(A2)=\frac{33+2(81)}{2(120)}=.8125$$
**Innsbruck**
$$p=freq(A1)=\frac{(2(20)+59)}{2(122)}=.405$$
$$q=freq(A2)=\frac{59+2(43)}{2(122)}=.594$$
**Verona**
$$p=freq(A1)=\frac{(2(65)+39)}{2(118)}=.716$$
$$q=freq(A2)=\frac{39+2(14)}{2(118)}=.284$$

**Munich** 

|H<sub>obs|H<sub>exp|
|-|-|
|$$\frac{33}{120}=.275$$|$$2(.1875)(.8125)=.305$$|

**Innsbruck**
|H<sub>obs|H<sub>exp|
|-|-|
|$$\frac{59}{122}=.48$$|$$2(.405)(.594)=.481$$|

**Verona**
|H<sub>obs|H<sub>exp|
|-|-|
|$$\frac{39}{118}=.331$$|$$2(.716)(.284)=.407$$|

* Do any populations have excess heterozygotes?

    **No, no population has H<sub>obs</sub> > H<sub>exp</sub>**
* Do any populations have a deficit of heterozygotes?

    **Yes, Munich and Verona, their H<sub>obs</sub> < H<sub>exp</sub>**

    
* Calculate *F<sub>IS</sub>* for each of the populations and how does this related to B and C?
   * Hint: this the equation $F_{IS} = \frac{H_S - H_I}{H_S}$
   * I suggest looking it up, but you can likely figure it out from context

$$F_{IS} = 1-\frac{H_o - H_e}{H_e}$$
|Munich|Innsbruck|Verona|
|-|-|-|
|$$F_{IS}=1-\frac{.275}{.305}=.098$$|$$F_{IS}=1-\frac{.48}{.481}=0$$|$$F_{IS}=1-\frac{.331}{.407}=.187$$|

**F<sub>IS</sub> relates to B and C in the way that both Munich and Verona have a deficit of heterozygotes and therefore their respective F<sub>IS</sub> are positive. Additionally, Innsbruck had H<sub>obs</sub>=H<sub>exp</sub> and F<sub>IS</sub>=0 which means there was no excess of heterozygotes or homozygotes**
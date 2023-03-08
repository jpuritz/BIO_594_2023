#Marissa's Week 5 Answers

## Question 1
The fly Eurosta solidaginis forms galls (enlarged areas) on goldenrod plants within which the fly larvae feed and develop. A studoy of allozyme frequencies in 21 subpopulations of E. solidaginis on two different speices of goldenrod distributed from Minnesota to Maine (Waring et al. 1990) produced the following estimates of FST:

|Locus | *F<sub>ST</sub>* |
|------|------------------|
| *GAP-1*| 0.10|
| *TPI-1*| 0.11|
| *IDH-1*| 0.02|
| *HBDH-1*| 0.62|
| *GPD-1*| 0.11|
| *PGM-1*| 0.14|

### Answer
Under the island model, the number of migrants can be estimated using the following formula: mN=(1-F<sub>ST</sub>)/4*F<sub>ST</sub>

```{r}
(1-0.1)/(4*0.1)
[1] 2.25

(1-0.11)/(4*0.11)
[1] 2.022727

(1-0.02)/(4*0.02)
[1] 12.25

(1-0.62)/(4*0.62)
[1] 0.1532258

(1-0.11)/(4*0.11)
[1] 2.022727

(1-0.14)/(4*0.14)
[1] 1.535714
```

|Locus | *F<sub>ST</sub>* | mN |
|------|------------------|----|
| *GAP-1*| 0.10| 2.25|
| *TPI-1*| 0.11| 2.023|
| *IDH-1*| 0.02| 12.25|
| *HBDH-1*| 0.62| 0.153|
| *GPD-1*| 0.11| 2.023|
| *PGM-1*| 0.14| 1.536|

What is your interpretation of these data? Do you think the differentiation at these loci is caused soley by a balance between migration and drift? Why or why not?

* Because a few of the locus have vastly different values than the others (for example, IDH-1 being at 12.25 and HBDH-1 being 0.153) these loci are not being acted upon at the same rate, meaning that they are not at equilibrium. 
  
Most of the differentiation at HBDH-1 show in the data occurs between the two species of host plants; nine of the subpopulations occured on Solidago altissima and the other 12 subpops were on S. gigantean. The frequency of one of the two HBDH alleles is 0.84 on S. altissima and 0.13 on S. gigantea. How does this affect your interpretation of the results?

* It seems that the HBDH allele on S. altissima is being selected for while the allele on S. gigantica is being selected against. Perhaps this allele gives some fitness advantage to S. altissima, or conversely is harmful to S. gigantica.

## Question 2
Levin (1978) studied allele frequencies at the 6-*pgd* allozyme locus in 73 sub-populations of the self-incompatible species *Phlox drummondi*. Of these 73 subpopulations,66 were fixed for the a allele, with allele frequencies and observed heterozygosities at the other loci given below (Levin's original subpopulation numbering altered for simplicity):


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

Calculate the three F-statistics for these data and check to make sure they have the correct mathematical relationship. Do these comparisons fit your expectations based on the mating systems of this species? Why or why not? If not, do you have a possible explanation for the lack of fit?

$F_{IS} = \frac{H_E - H_O}{H_E}$
So, to calculate F<sub>IS</sub>, we first need to calculate H<sub>E</sub>

H<sub>E</sub> = 2pq 
Table showing p and q values below calculations

```{r}
2*1*0
[1] 0

2*0.86*0.14
[1] 0.2408

2*0.8*0.2
[1] 0.32

2*0.7*0.3
[1] 0.42

2*0.96*0.04
[1] 0.0768

2*0.73*0.27
[1] 0.3942

2*0.91*0.09
[1] 0.1638
```

|Subpopulation |*p* |*H<sub>O</sub>* | *q* (1-p)| H<sub>E</sub> (2pq)
|--------------|----|----------------|----------|--------------|
|1-66|1|0| 0|0|
|67|0.86|0.06|0.14|0.2408|
|68|0.80|0.12|0.2|0.32|
|69|0.70|0.20|0.3|0.42|
|70|0.96|0.03|0.04|0.0768|
|71|0.96|0.09|0.04|0.0768|
|72|0.73|0.15|0.27|0.3942|
|73|0.91|0.06|0.09|0.1638|

```{r}
> (0+0.06+0.12+0.2+0.03+0.09+0.15+0.06)/8
[1] 0.08875
> (0+.2408+.32+.42+.0768+.0768+.3942+.1634)/8
[1] 0.2115
```

Average H<sub>O</sub>=0.08875
Average H<sub>E</sub>=0.2115
$F_{IS} = 1-\frac{H_O}{H_E}$

```{r}
> 1-(0.08875/0.2115)
[1] 0.5803783
```
F<sub>IS</sub>=0.58
Positive means there is a defecit of heterozygotes

$F_{ST} = 1-\frac{H_E}{H_T}$
HT is the expected HW heterozygosity if the entire base population were panmictic

```{r}
> (1+0.86+0.8+0.7+0.96+0.96+0.73+0.91)/8
[1] 0.865
> (0+.14+.2+.3+.04+.04+.27+.09)/8
[1] 0.135
> 2*0.865*0.135
[1] 0.23355
```
Average p=0.865
Average q=0.135
2pq(H<sub>T</sub>)=0.23355

```{r}
> 1-(0.2115/0.23355)
[1] 0.09441233
```
F<sub>ST</sub>=0.094
F<sub>ST</sub> is close to 0, which means subpopulations have close to no difference in allele frequencies


$F_{IT} = 1-\frac{H_O}{H_T}$

```{r}
> 1-(0.08875/0.23355)
[1] 0.6199957
```
F<sub>IT</sub>=0.62
This is how much the population has departed from HW proportions.

Overall I would say these F values do fit what I would expect because one value says there is a defecit of heterozygotes, and the other says that there is a deviation from HW, which corroborate each other. 

Calculate *N<sub>e</sub>m* from these data.  If the migration rate *m* was found to be 0.1, what would the estimate of *N<sub>e</sub>* be?
$m_N=\frac{(1-F_ST)}{4*F_ST}$
m<sub>N</sub>=2.41

```{r}
> (1-0.094)/(4*0.094)
[1] 2.409574
```

**Not sure if I did that right, and not sure what to do with the migration rate**
If m=0.1, then 10% of the individuals migrated, and if 2.4 is that 10% then there would be an N<sub>e</sub> of about 24



Now assume that *N<sub>e</sub>* is very large, 6-*pgd* is neutral in these subpopulations, and the migration rate is still O.1. What would the frequencies of the *a* allele in subpopulations 68 and 69 after 10 generations be? After 25 gener-ations? What biological principle is illustrated by these results?

$q'A = (1−m)qA + m*qB$
and
$q'B = m*qA + (1 − m)qB$

q'A = subpop 68
q'B = subpop 69
m=0.1
qA=0.8
qB=0.7
Plug values into both equations
```{r}
> ((1-0.1)*0.8)+(0.1*0.7)
[1] 0.79
> (0.1*0.8)+((1-0.1)*0.7)
[1] 0.71
```
Repeated for all generations, results shown in table below

|Generation|Subpop 68 frequency |Subpop 69 frequency|
|----------|--------------------|--------------------|
|1|0.79 |0.71 |
|2| 0.782|0.718 |
|3|0.7756 |0.7244 |
|4|0.77 |0.73 |
|5|0.766 |0.733 |
|6|0.763 |0.747 |
|7|0.76 |0.74 |
|8|0.76 |0.74 |
|9|0.76 |0.74 |
|10|0.76 |0.74 |
|25| 0.75| 0.75|

Once I went past the 10th generation, the values stabalized around 0.75, showing that when there is migration, eventually the allele frequency will reach an equilibrium between the values originally started at.

## Question 3
In *D. melanogaster*, curly wings is due to a dominant allele C<sub>*y*</sub> that is lethal when homozygous. A population is established with an initial frequency of C<sub>*y*</sub> equal to 0.168. Calculate the expected frequency in the next generation, assuming.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:1.
      * The relative fitness of +/+ : C<sub>*y*</sub>/+ is 1:0.5.
      
C<sub>*y*</sub> is dominant
p=0.168
q=0.832
```{r}
> 1-0.168
[1] 0.832
> 0.168^2
[1] 0.028224
> 2*0.168*0.832
[1] 0.279552
> 0.832^2
[1] 0.692224
```
In order to get the adjusted fitness, we have to calculate w, which is all the relative fitnessess added together, then divide the relative fitness by w.
```{r}
w=0+0.279552+0.692224
[1] 0.971776
> 0.279552/.971776
[1] 0.2876712
> 0.692224/.971776
[1] 0.7123288
```
|Genotype|Frequency|Fitness|Calculated Frequency|Relative fitness|Adjusted Fitness|
|--------|---------|-------|--------------------|----------------|----------------|
|Cy/Cy|p^2|0 (death)|0.028224|0*0.028=0|0|
|Cy/+|2pq|1|0.279552|1*0.279552=0.279552|0.2876712|
|+/+|q^2|1|0.692224|1*0.692224=0.692224|0.7123288|

Now the same thing but with 1:0.5 ratio

```{r}
> 0.5*0.279552
[1] 0.139776
> 0+0.138776+0.692224
[1] 0.831
> 0.138776/0.831
[1] 0.1669988
> 0.692224/0.831
[1] 0.8330012
```

w=0.831

|Genotype|Frequency|Fitness|Calculated Frequency|Relative fitness|Adjusted Fitness|
|--------|---------|-------|--------------------|----------------|----------------|
|Cy/Cy|p^2|0 (death)|0.028224|0*0.028=0|0|
|Cy/+|2pq|1|0.279552|0.5*0.279552=0.139776|0.1669988|
|+/+|q^2|0.5|0.692224|1*0.692224=0.692224|0.833|


## Question 4
If the fitnesses of the genotypes A<sub>1</sub>A<sub>1</sub>, A<sub>1</sub>A<sub>2</sub>, and A<sub>2</sub>A<sub>2</sub> are 1.5, 1.1, and 1.0, respectively, what are the values of the selection coefficient and the heterozygous effect?
**Not positive how to do this, my attempt is below**

We have intermediate directional selection(three different fitnesses).
Selection coeffecient = s
We can rescale the fitness values based on the largest one, googled for clarity and resource is http://web.mit.edu/course/6/6.877/www/lecture/lecture2-07.pdf

 A<sub>1</sub>A<sub>1</sub> = 1.5/1.5 = 1.0
 A<sub>1</sub>A<sub>2</sub> = 1.1/1.5 = 0.73
 A<sub>2</sub>A<sub>2</sub> = 1.0/1.5= 0.67
 

 Taken from google: Calculate the selection coefficient (s) by subtracting each fitness value from 1.0 (that is, s = 1-w)
 A<sub>1</sub>A<sub>1</sub> = 1-1=-0 = 1
 A<sub>1</sub>A<sub>2</sub> = 1-0.73 = 0.27 = 1-hs
 A<sub>2</sub>A<sub>2</sub> = 1-0.67= 0.33 = 1-s

 
 “The parameter h is called the heterozygous effect. It is a measure of the fitness of the heterozygote relative to the selective difference between the two homozygotes. As such it is really a measure of dominance, as shown in the following table:"
 |Value|Interpretation|
 |-----|--------------|
 |h=0|A1 dominant, A2 recessive|
 |h=1|A2 dominant, A1 recessive|
|0 < h < 1 |incomplete dominance|
|h < 0|overdominance|
|h > 1|underdominance|
 **Quote and chart taken from the above website**
 
  wA<sub>1</sub>A<sub>2</sub> = 1-hs
  
wA<sub>1</sub>A<sub>2</sub>-1=-hs

(wA<sub>1</sub>A<sub>2</sub>-1)/s=-h

-((wA<sub>1</sub>A<sub>2</sub>-1)/s)=h

h=(-wA<sub>1</sub>A<sub>2</sub>+1/-s)

h=(1-wA<sub>1</sub>A<sub>2</sub>)/-s)


h=(1-0.73)/-0.27
h=-1
This means there is overdominance.
 
 ## Question 5
 Industrial melanism refers to the dark pigmentation that evolved in some insects, giving them protective coloration on vegetation darkened by soot in heavily industrialized areas prior to the requirement for smokestack filtration. In one heavily polluted area near Birmingham, England in 1956, 87% of moths of the species *Biston betularia* had black bodies due to the presence of a dominant gene for melanism (Kettlewell 1956). 

* Estimate the frequency of the dominant allele in this population and the frequency of melanics that are heterozygous.

Dominance =0.87
p^2 + 2pq = 0.87
P^2 + 2pq + q^2 = 1
q^2 = 1-0.87=0.13

```{r}
> sqrt(0.13)
[1] 0.3605551
> 1-0.3605551
[1] 0.6394449
```
q=0.361
p=0.639
Frequency of dominant allele = 0.639

Frequency of heterozygous:
```{r}
> 2*0.361*0.639
[1] 0.461358
```
2pq=2 * 0.361 * 0.639=0.461


* In this species, the frequency of melanic moths increased from a value of 1% in 1848 to a value of 95% in 1898.  The species has one generation per year. Estimate the approximate value of the selection coeffecient *s* against non-melanics that would be necessary to account for the change in the frequency of the melanic forms.

**1848**
2pq + p^2 = 0.01
q^2 = 0.99

```{r}
> sqrt(0.99)
[1] 0.9949874
```

q = sqrt(0.99) = 0.995
p = 1 - q = 0.005

**1898**
2pq + p^2 = 0..95
q^2 = 0.05

```{r}
> sqrt(0.05)
[1] 0.2236068
> 1-0.2236068
[1] 0.7763932
```

q = sqrt(0.05) = 0.224
p = 1 - q = 0.776


"The parameter s is simply the ratio (1-w2)/w1" (from same link)
(1-0.005)/0.776
```{r}
> (1-0.005)/0.776
[1] 1.282216
```

**I dont think this is right because I thought it wasn't supposed to be this hight but not sure how to do this**


* How many generations would be required for the same change in frequency of melanic forms in a hypothetical case in which the allele for melanism is recessive, assuming the same value of *s* against nonmelanics

**1848**
q^2 = 0.01
p^2+2pq = 0.99

```{r}
> sqrt(0.01)
[1] 0.1
```

q = 0.1
p = 1 - q = 0.9

**1898**
q^2 = 0.95
p^2+2pq=0.05

```{r}
> sqrt(0.95)
[1] 0.9746794
> 1-0.9746794
[1] 0.0253206
```
q=0.975
p=0.025

**Not sure where to go from here**


## Question 6
Experimental populations of *Drosophila pseudoobscura* were established and periodically treated with weak doses of the insecticide DDT (Anderson et al. 1968).
One population was initially polymorphic for five different inversions in the third chromosome, in approximately equal frequencies. After 13 generations, three of the inversions had disappeared from the population. The two that remained were *Standard* (*ST*) and Arrowhead (*AR*). Changes in frequencv of each inversion were monitored, and from the values for the first nine generations the relative fitnesses of *ST*/*ST*, *ST*/*AR*, and *AR*/*AR* genotypes were estimated as 0.47, 1.0, and 0.62, respectively. Because the inversions yield almost no recombinant gametes, each type can be considered as an "allele." What equilibrium frequency of ST is predicted? What equilibrium value of $\bar{w}$ is predicted?
|*ST*/*ST*|*ST*/*AR*|*AR*/*AR*|
|---------|---------|---------|
|0.47|1|0.62|

*ST*/*AR* is the highest so there is heterozygosity dominance.

$p* = \frac{w_ST/AR-w_AR/AR}{2 * w_ST/AR - w_ST/ST - w_AR/AR}$

```{r}
> (1-0.62)/(2*1-0.47-0.62)
[1] 0.4175824
```

p*=0.418


In order to get the adjusted fitness (w with the line), we have to calculate w, which is all the relative fitnessess added together, then divide the relative fitness by w.
```{r}
w=0.47+1+0.62
[1] 2.09
> 0.47/2.09
[1] 0.2248804
> 1/2.09
[1] 0.4784689
> 0.62/2.09
[1] 0.2966507
```
|*ST*/*ST*|*ST*/*AR*|*AR*/*AR*|
|---------|---------|---------|
|0.47|1|0.62|
|0.225|0.478|0.297|

$p* = \frac{w_ST/AR-w_AR/AR}{2 * w_ST/AR - w_ST/ST - w_AR/AR}$
```{r}
> (0.478-0.297)/(2*0.478-0.225-0.297)
[1] 0.4170507
```

p*=0.417
Both values are almost identical.

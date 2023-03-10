
# Marissa's Week 4 Answers 


## Question 1

```{r}
#What is the probability that a particular allele has at least one copy in the next generation? 
#The surprising answer quickly becomes independent of population size as N becomes larger.

#"If a population is reduced to N individuals for one generation then the 
#expected number of alleles (A') remaining is:"
#E(A')=A-AΣj=1 (1-pj)^2N
#A is initial number of alleles and pj is the frequency of the jth allele

#"The probability of an allele being lost during a bottleneck of size N is"
#(1-p)^2N

#E(A")=A-(1-p)^2N-(1-p)^2N...

#So for a really small population, lets say N=2, and equal probability of the alleles
#being retained, the expected loss would be

N=2
p=0.5

2-((1-0.5)^4)-((1-0.5)^4)
[1] 1.875

#Meaning ~12.5% of the time one of the alleles is being lost
#But as the population size increases, (N=100) that changes

N=100
p=0.5

2-((1-0.5)^200)-((1-0.5)^200)
[1] 2

#This is saying that the alleles will not be lost (or are lost such a small fraction of 
#the time that it is insignificant) when the population size gets large enough.
#I am a bit confused as to how the hint equation works into this (and the problem in general)
```

## Question 2

```{r}
#A highly isolation colony of the month Panaxia dominula near Oxford, England has been 
#instenstively studied by Ford and collaborators over the period of 1928-1968 (Ford and 
#Sheppard 1969). This speices has one generation per year, and estimates of the population 
#size were caried out yearly begnining in 1941. For the years 1950-1961, inclusive, estimates 
#of the population size were:
  
#  Year	Individuals
#1950	    4100
#1951	    2250
#1952	    6000
#1953	    8000
#1954	    11000
#1955	    2000
#1956	    11000
#1957	    16000
#1958	    15000
#1959	    7000
#1960	    2500
#1961	    1400
#Assuming that the actual size of the population in any year equals the effective population
#size in that year, estimate the average effective number over the entire 12-year period.


#To calculate the effective population in successive generations:
#Ne = t / Σ (1/Ni)
#t=12 years
Ni <- (1/4100)+(1/2250)+(1/6000)+(1/8000)+(1/11000)+(1/2000)+(1/11000)+(1/16000)+(1/15000)+(1/7000)+(1/2500)+(1/1400)
12/Ni
[1] 3936.825
#The average effective number is ~3937
```

## Question 3

```{r}
#A dairy farmer has a herd consisting of 200 cows and 2 bulls. What is the effective population size?
#Ne=(4Nf*Nm)/Nf + Nm
#Nf=200
#Nm=2

(4*200*2)/(200+2)
[1] 7.920792

#The effective population size is ~ 8 individuals.
```

## Question 4

```{r}
#A rare triggerplant from Australia (Stylidium coroniforme) has only five known populations (Coates 1992).
#One of these populations has been monitored for several years, and over five years in the early 1980s: 
#2, 3, 25, 32, and 86 plants were recoreded. Assuming Ne = Nc in that year, estimate Ne as well as the 
#average Nc over this period. What biological principle is illustrated by this example?

#To calculate the effective population in successive generations:
#Ne = t / Σ (1/Ni)
#t=5

Ni <- (1/2)+(1/3)+(1/25)+(1/32)+(1/86)
5/Ni
[1] 5.457257
#Ne is ~5.5

#Nc would just be arithmatic mean
(2+3+25+32+86)/5
[1] 29.6
#Nc is 29.6
#This shows that not all adults in each generation are reproducing.
```

## Question 5

```{r}
#You genotyep a species of grasshopper along a transect in the European Alsp. Near Munich, Germany, you 
#sample 120 individuals; near Inssbruck, Austria, you sample 122 individuals; near Verona, Italy you 
#sample 118 individuals. You find the following genotypes:
  
#  Locality	A1A1	A1A2	A2A2
#Munich     	6	    33	  81
#Innsbruck	  20	  59	  43
#Verona	      65	  39	  14


#Calculate the frequencies of the two alleles in each population
#Munich 
MunPop<-6+33+81
#A1
(6+(33/2))/MunPop
[1] 0.1875
#A2
((33/2)+81)/MunPop
[1] 0.8125

#Innsbruck
InnPop<-20+59+43
#A1
(20+(59/2))/InnPop
[1] 0.4057377

#A2
((59/2)+43)/InnPop
[1] 0.5942623

#Verona
VerPop<-65+39+14
#A1
(65+(39/2))/VerPop
[1] 0.7161017

#A2
((39/2)+14)/VerPop
[1] 0.2838983


#Do any populations have excess heterozygotes?
#Expected heterozygosity = 2pq
Munp<-0.1875
Munq<-0.8125
Innp<-0.4057377
Innq<-0.5942623
Verp<-0.7161017
Verq<-0.2838983

#Munich expected heterozygosity=36.5625
2*Munp*Munq
[1] 0.3046875
2*Munp*Munq*MunPop
[1] 36.5625

#Innsbruck expected heterozygosity=58.83197
2*Innp*Innq
[1] 0.4822292
2*Innp*Innq*InnPop
[1] 58.83197

#Verona expected heterozygosity=47.97881
2*Verp*Verq
[1] 0.4066001
2*Verp*Verq*VerPop
[1] 47.97881

#No, no locations had more observed than expected.


#  Do any populations have a deficit of heterozygotes?
#Yes, both Munich and Verona have less observed than expected

#  Calculate FIS for each of the populations and how does this related to B and C?
#Fis=(Hexp-Hobs)/Hexp: taken from hint and then googled for clarity
#OBSERVED
#Locality		A1A2	
#Munich      33	  
#Innsbruck	 59	 
#Verona	     39	 

#EXPECTED
#Locality		A1A2	
#Munich      36.5624	  
#Innsbruck	 58.83197
#Verona	     47.97881	 

#Munich Fis:
(36.5624-33)/36.5624
[1] 0.09743343

#Innsbruck Fis:
(58.83197-59)/58.83197
[1] -0.0028561

#Verona Fis:
(47.97881-39)/47.97881
[1] 0.1871412

#This relates to B and C because both Munich and Verona have positive Fis values, 
#indicating they have excess heterozygosity, while Innsbruck is slightly negative, though
#essentially zero, meaning it does not have excess heterozygosity and is almost exactly
#what would be expected
```

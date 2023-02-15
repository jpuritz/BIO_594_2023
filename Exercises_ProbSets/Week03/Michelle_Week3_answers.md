1. 

Conditional probability P(A|G)

Set 1.
AAATG
AAATG
AAATG

Probability of getting these sequence reads
P = .5*.5*.5 = 0.125

Set 2.
AAATG
AAATG
AAATG
AAATG
AAATG
P = .5 * .5 * .5 *.5 * .5 = 0.03125

Set 3.
AAATG
AAGTG
AAATG
AAATG
AAATG

-	Has 1 AAGTG, so still 0.03125. Expanded out more:
	P(k out of N) = 	N!/(k!(N-k)!) *	(p^k)(q^(N-k)) 

Where N = # of times event could occur
k = the number of times that event x occurs or is stipulated to occur
p = prob that event x will occur on any particular occasion
q = prob that event x will not occur on any particular occasion

((5!/(1!(5-1)!))*.5^1*(.5^(5-1)) = 0.15625
+
((5!/(4!(5-4)!))*.5^4*(.5^5-4)) = 0.15625

0.15625+0.15625=0.03125



2.

SS
N11=11

SS-
N12=55

S-S-
N22=61

N= 11+55+61 = 127

2 observed alleles

Observed genotype frequencies:
SS = 11/127 = 0.0866
SS- = 55/127 = 0.433
S-S- = 61/127 = 0.480

phat = (2NSS + NSS-)/2N = ((2*11)+55)/(2*(11+55+61))=0.303
qhat = (NSS- + 2NS-S-)/2N = (55+2*61)/(2*(11+55+61))= 0.697

Assuming HW:

Expected SS
Observed = 11
Expected = 0.303^2*127 = 11.66

Expected SS-
Observed = 55
Expected = 2phatqhatN = 2 * 0.303 * 0.697 * 127 = 53.64

Expected S-S-
Observed = 61
Expected = qhat^2N = .697^2 * 127 = 61.70

Agreement between expected and observed genotypic proportions is good. No indication that it is not in HW proportions.

Chi-squared provides stat test to determine if deviation between observed and expected HW proportions is greater than we expect by chance alone.

Calc chi-squared value for each genotype and sum them

X2 = ∑ (OBSERVED − EXPECTED) ^ 2 /EXPECTED 
X^2 = ((11-11.6)^2/11.66) + ((55-53.64)^2/53.64) + ((61-61.70)^2/61.70)= 0.07 is the chi squared.

DOF = # possible genotypes - # possible alleles = 3-2 = 1
If chi squared is <0.05, dif between observed and expected is significant. 
Chi squared for DOF=1 and alpha = 0.05 is 3.84, since 0.07 < 3.84 our observed and expected genotype frequnecies are not significantly different and agree with HW expectations.

Observed heterozygosities:
SS = 11/127 = 0.866
SS- = 55/126 = 0.433
S-S- = 61/127 = 0.480

Expected heterozygosity:
HE = 2pq = 2 * 0.303 * 0.697 = 0.422

3A. Observed genotype and allele frequencies:
A/A = 0/10=0
A/G = 10/10 = 1
GG = 0/10=0
N = 10

phat = A = ((2NAA + NAG)/2N) = 2*0+10/(2*10) = 0.5
qhat = G = ((2NGG + NAG)/2N) = 2*0 + 10/(2*10) = 0.5

3B. 
(p+q)^2 = p^2 + 2pq + q^2
p=A
q=G
(.5+.5)^2 = .5^2 + 2(.5)(.5) + .5^2
1 = .25 + .5 + 0.25

expected frequencies:

SS = qhat^2 * N = 0.5^2 * 10 = 0.25 * 10 = 2.5
SS- = 2phatqhatN = 2(.5)(.5) * 10 = 0.5 * 10 = 5
S-S- = qhat^2 * N = (.5)^2 * 10 = 0.25 * 10 = 2.5

Chi-squared: ∑ (OBSERVED − EXPECTED) ^ 2 /EXPECTED 
= ((0-2.5)^2)/2.5 + ((10-5)^2)/5 + ((0-25)^2)/2.5 = 10
DOF = 3 - 2 = 1
10 > 3.84, observed and expected genotype frequencies are significantly different and do not agree with HW.

3C.

Genotype | Count
A/A      | 1
A/G      | 6
G/G      | 3

Genotype Frequencies where N = 10
A/A = 1/10 = 0.1
A/G = 6/10 = 0.6
G/G = 3/10 = 0.3

Allele frequencies:
phat = A = 2NAA + NAG/2N = (2*1+6)/(2*10) = 0.4
qhat = G = (NAG + 2GG)/2N = (6+2*3) / (2*10) = 0.6

(p+q)^2 = phat^2 + 2phatqhat + qhat^2
p=A
q=G
(.4+.6)^2 = .4^2 + 2(.4)(.6) + .6^2
1 = .16 + .48 + 0.36

Genotype | Expected Frequency | Expected Count

AA | .16 | .16*10 =1.6
AG | .48 | .48*10 = 4.8
GG | .36 | .36*10 = 3.6

Chi-squared = 
((1-1.6)^2 / 1.6) + ((6-4.8)^2/4.8) + ((3-3.6)^2)/3.6) = 0.625
DOF = 1
0.625 < 3.84, so expected and observed are not significantly different and agree with HW.


4A. 
Gell C:
Genotypes:
N/L = 6
U/N = 101
U/L = 39
N/N = 14

N = 6+101+39+14

Genotype frequency:

N/L = 6/160 = 0.0375
U/L = 101/160 = 0.631
N/L = 39/160 = 0.243
N/N = 14/160 = 0.087

Frequency of null alleles = square root of 0.0875 = 0.296. 

4B.
... ran out of time!

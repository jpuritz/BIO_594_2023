# Week 10 assignment
Megan Guidry

### How many loci are there?
Number of loci: ***1235***

This file will walk through the process of finding out how many loci are in the data provided in the /home/BIO594/DATA/Week5/ directory. This walk-through will follow the [Reference Asssembly Tutorial](http://www.ddocent.com/assembly/) from the dDocent website.

We can use a conda environment to install dDocent and activate that environment.
```
conda create -n ddocent_env ddocent
conda activate ddocent_env
```

This data is already demultiplexed, so the first thing we need to do is copy the data from the 
original directory to this a spot in this directory.
```
cp /home/BIO594/DATA/Week5/*fq.gz .
ll
```

The next step is to create a set of unique reads with counts of those reads for each individual. The first few lines are setting up variables, creating a set of forward reads for each individual and extracting the quality scores. This is repeated for the reverse reads. The last line concatonates the forward and reverse together and finds the unique reads within that individual and counts the how many times those unique reads appear. 
```
ls *.F.fq.gz > namelist
sed -i'' -e 's/.F.fq.gz//g' namelist
AWK1='BEGIN{P=1}{if(P==1||P==2){gsub(/^[@]/,">");print}; if(P==4)P=0; P++}'
AWK2='!/>/'
AWK3='!/NNN/'
PERLT='while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}'
cat namelist | parallel --no-notice -j 8 "zcat {}.F.fq.gz | mawk '$AWK1' | mawk '$AWK2' > {}.forward"
cat namelist | parallel --no-notice -j 8 "zcat {}.R.fq.gz | mawk '$AWK1' | mawk '$AWK2' > {}.reverse"
cat namelist | parallel --no-notice -j 8 "paste -d '-' {}.forward {}.reverse | mawk '$AWK3' | sed 's/-/NNNNNNNNNN/' | perl -e '$PERLT' > {}.uniq.seqs"
```

Next, we can eliminate reads with low copy numbers. These could be sequencing errors or areas of really low coverage. 
First, we'll sum up the instances of within individual coverage level of unique reads with the following code. This code uses 'mwak' to search the first column and select the data with copy numbers between 2-20. 
```
cat *.uniq.seqs > uniq.seqs
for i in {2..20};
do 
echo $i >> pfile
done
cat pfile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniq.seqs | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.data
rm pfile
```

We can look at the uniqseq.data file we just created. This will show us the number of unique sequences that have a copy number of 2, 3, 4, 5,...20.
```
more uniqseq.data
```

We can also print that data to the screen with the code below.
```
gnuplot << \EOF 
set terminal dumb size 120, 30
set autoscale
set xrange [2:20] 
unset label
set title "Number of Unique Sequences with More than X Coverage (Counted within individuals)"
set xlabel "Coverage"
set ylabel "Number of Unique Sequences"
plot 'uniqseq.data' with lines notitle
pause -1
EOF
```

```
Number of Unique Sequences with More than X Coverage (Counted within individuals)               
     130000 +-------------------------------------------------------------------------------------------------------+   
            |           +          +           +          +           +          +           +          +           |   
     125000 |**                                                                                                   +-|   
            |  ******                                                                                               |   
            |        ******                                                                                         |   
     120000 |-+            *****                                                                                  +-|   
            |                   ******                                                                              |   
     115000 |-+                       ******                                                                      +-|   
            |                               ******                                                                  |   
     110000 |-+                                   *****                                                           +-|   
            |                                          ******                                                       |   
     105000 |-+                                              ******                                               +-|   
            |                                                      ******                                           |   
            |                                                            ******                                     |   
     100000 |-+                                                                ****                               +-|   
            |                                                                      ***                              |   
      95000 |-+                                                                       ****                        +-|   
            |                                                                             ******                    |   
      90000 |-+                                                                                 *****             +-|   
            |                                                                                        **             |   
            |                                                                                          ****         |   
      85000 |-+                                                                                            *****  +-|   
            |           +          +           +          +           +          +           +          +       *** |   
      80000 +-------------------------------------------------------------------------------------------------------+   
            2           4          6           8          10          12         14          16         18          20  
                                                            Coverage                                      

```

Now that we have this info about the number of reads with low copy numbers, we have to choose a cutoff value for what we want to keep. Choosing this cutoff is a balance between maintaining as much diversity as possible while reducign the amount of sequences that are likely errors. 
We can start with a cut off value of 4.

```
parallel --no-notice -j 8 mawk -v x=4 \''$1 >= x'\' ::: *.uniq.seqs | cut -f2 | perl -e 'while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}' > uniqCperindv
wc -l uniqCperindv
```

This reduced the data down to **12699** sequences. Now we'll want to restrict the number of different individuals a sequence appears within. First we have to look at that data before deciding a cut off.
```
for ((i = 2; i <= 10; i++));
do
echo $i >> ufile
done

cat ufile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniqCperindv | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.peri.data
rm ufile
```

We can plot the unique sequences present in more than X individuals.
```
gnuplot << \EOF 
set terminal dumb size 120, 30
set autoscale 
unset label
set title "Number of Unique Sequences present in more than X Individuals"
set xlabel "Number of Individuals"
set ylabel "Number of Unique Sequences"
plot 'uniqseq.peri.data' with lines notitle
pause -1
EOF
```

```

                                                                                                                        
                                                                                                                        
                                 Number of Unique Sequences present in more than X Individuals                          
     11000 +--------------------------------------------------------------------------------------------------------+   
           |            +            +            +             +            +            +            +            |   
           |                                                                                                        |   
           |*                                                                                                       |   
     10000 |-**                                                                                                   +-|   
           |   ***                                                                                                  |   
           |      ***                                                                                               |   
           |         **                                                                                             |   
      9000 |-+         ***                                                                                        +-|   
           |              ***                                                                                       |   
           |                 ****                                                                                   |   
      8000 |-+                   ***                                                                              +-|   
           |                        *****                                                                           |   
           |                             ******                                                                     |   
           |                                   *******                                                              |   
      7000 |-+                                        *******                                                     +-|   
           |                                                 *******                                                |   
           |                                                        ******                                          |   
           |                                                              *******                                   |   
      6000 |-+                                                                   ******                           +-|   
           |                                                                           **********                   |   
           |                                                                                     **********         |   
           |            +            +            +             +            +            +            +   ******   |   
      5000 +--------------------------------------------------------------------------------------------------------+   
           2            3            4            5             6            7            8            9            10  
                                                     Number of Individuals                                              
                                                                                                 
```

Let's try 4 again as the cutoff value (*but this time it means a sequence has to appear in 4 or more individuals to be kept?*)
```
mawk -v x=4 '$1 >= x' uniqCperindv > uniq.k.4.c.4.seqs
wc -l uniq.k.4.c.4.seqs
```

Now we are left with **7989** sequences! We'll convert these back to fasta format to move along in the pipeline:
```
cut -f2 uniq.k.4.c.4.seqs > totaluniqseq
mawk '{c= c + 1; print ">Contig_" c "\n" $1}' totaluniqseq > uniq.fasta
```

Here, dDocent would typically check for adapters, but we can skip this as this data is simulated. 

We can move on to assembling reference contigs. First, we extract the forward reads from those fasta files we just made.

```
sed -e 's/NNNNNNNNNN/\t/g' uniq.fasta | cut -f1 > uniq.F.fasta
```

Now we can move on the the RAD assembly. We can cluster by alignment with 'cd-hit' by 80% similarity. 
```
cd-hit-est -i uniq.F.fasta -o xxx -c 0.8 -T 0 -M 0 -g 1
```

```
 ================================================================
                            Output                              
----------------------------------------------------------------
total number of CPUs in the system is 80
Actual number of CPUs to be used: 80

total seq: 7989
longest and shortest : 116 and 116
Total letters: 926724
Sequences have been sorted

Approximated minimal memory consumption:
Sequence        : 1M
Buffer          : 80 X 12M = 972M
Table           : 2 X 16M = 33M
Miscellaneous   : 4M
Total           : 1013M

Table limit with the given memory limit:
Max number of representatives: 248606
Max number of word counting entries: 6715988

# comparing sequences from          0  to       7238
.......---------- new table with     1233 representatives
# comparing sequences from       7238  to       7989
....................---------- new table with        1 representatives

     7989  finished       1234  clusters
    
```

We need to convert the output of cd-hit to match the first phase of rainbow using the following code
```
mawk '{if ($1 ~ /Cl/) clus = clus + 1; else  print $3 "\t" clus}' xxx.clstr | sed 's/[>Contig_,...]//g' | sort -g -k1 > sort.contig.cluster.ids
paste sort.contig.cluster.ids totaluniqseq > contig.cluster.totaluniqseq
sort -k2,2 -g contig.cluster.totaluniqseq | sed -e 's/NNNNNNNNNN/\t/g' > rcluster
```

Use the code below to see how many clusters are in the rcluster file
```
cut -f2 rcluster | uniq | wc -l 
```

**1234 clusters!**

Now we'll use 'rainbow' to isolate clusters into smaller clusters that represent significant variants. The '-f' flag designates the minimum frequency of an allele needed to classify it as it's own cluster. The default is 0.2, and you'll want to pay more attention to this with real data.
```
rainbow div -i rcluster -o rbdiv.out
rainbow div -i rcluster -o rbdiv.out -f 0.5 -K 10
```

Use the PE reads to merge  divided clusters. This helps double check the clustering (which was all based on the forward reads). Adding the '-r' flag indicates the minimum number of reads to assemble. Default is 5, however, with a reduced data set 2 is more appropriate.
```
rainbow merge -o rbasm.out -a -i rbdiv.out
rainbow merge -o rbasm.out -a -i rbdiv.out -r 2
```

The rbasm output file lists both optimal and suboptimal contigs. The code below will isolate the optimal contigs. 
```
cat rbasm.out <(echo "E") |sed 's/[0-9]*:[0-9]*://g' | mawk ' {
if (NR == 1) e=$2;
else if ($1 ~/E/ && lenp > len1) {c=c+1; print ">dDocent_Contig_" e "\n" seq2 "NNNNNNNNNN" seq1; seq1=0; seq2=0;lenp=0;e=$2;fclus=0;len1=0;freqp=0;lenf=0}
else if ($1 ~/E/ && lenp <= len1) {c=c+1; print ">dDocent_Contig_" e "\n" seq1; seq1=0; seq2=0;lenp=0;e=$2;fclus=0;len1=0;freqp=0;lenf=0}
else if ($1 ~/C/) clus=$2;
else if ($1 ~/L/) len=$2;
else if ($1 ~/S/) seq=$2;
else if ($1 ~/N/) freq=$2;
else if ($1 ~/R/ && $0 ~/0/ && $0 !~/1/ && len > lenf) {seq1 = seq; fclus=clus;lenf=len}
else if ($1 ~/R/ && $0 ~/0/ && $0 ~/1/) {seq1 = seq; fclus=clus; len1=len}
else if ($1 ~/R/ && $0 ~!/0/ && freq > freqp && len >= lenp || $1 ~/R/ && $0 ~!/0/ && freq == freqp && len > lenp) {seq2 = seq; lenp = len; freqp=freq}
}' > rainbow.fasta
```

*Here, dDocent typically checks for substantial overlap between F and PE reads in the contigs. This is a double check of rainbow's assembly. We will skip this for the simulated data.*

Because rainbow isn't perfect, we have to align and cluster contigs output by rainbow with cd-hit
```
cd-hit-est -i rainbow.fasta -o referenceRC.fasta -M 0 -T 0 -c 0.9
```

The '-M' and '-T' flags refer to the memory usage and number of threads. Setting them to 0 uses all available. 
The '-c' flag sets the percentage of sequence similarity to group contigs by.

```
================================================================
Program: CD-HIT, V4.8.1 (+OpenMP), Feb 22 2022, 21:26:56
Command: cd-hit-est -i rainbow.fasta -o referenceRC.fasta -M 0
         -T 0 -c 0.9

Started: Wed Mar  2 10:19:24 2022
================================================================
                            Output                              
----------------------------------------------------------------
total number of CPUs in the system is 80
Actual number of CPUs to be used: 80

total seq: 1235
longest and shortest : 370 and 230
Total letters: 310737
Sequences have been sorted

Approximated minimal memory consumption:
Sequence        : 0M
Buffer          : 80 X 12M = 970M
Table           : 2 X 16M = 33M
Miscellaneous   : 4M
Total           : 1009M

Table limit with the given memory limit:
Max number of representatives: 248606
Max number of word counting entries: 10919121

# comparing sequences from          0  to         15
---------- new table with       15 representatives
# comparing sequences from         15  to         29
..............---------- new table with       14 representatives
# comparing sequences from         29  to         43
..............---------- new table with       14 representatives
# comparing sequences from         43  to         57
..............---------- new table with       14 representatives
# comparing sequences from         57  to         71
..............---------- new table with       14 representatives
# comparing sequences from         71  to         85
..............---------- new table with       14 representatives
# comparing sequences from         85  to         99
..............---------- new table with       14 representatives
# comparing sequences from         99  to        112
.............---------- new table with       13 representatives
# comparing sequences from        112  to        125
.............---------- new table with       13 representatives
# comparing sequences from        125  to        138
.............---------- new table with       13 representatives
# comparing sequences from        138  to        151
.............---------- new table with       13 representatives
# comparing sequences from        151  to        164
.............---------- new table with       13 representatives
# comparing sequences from        164  to        177
.............---------- new table with       13 representatives
# comparing sequences from        177  to        189
............---------- new table with       12 representatives
# comparing sequences from        189  to        201
............---------- new table with       12 representatives
# comparing sequences from        201  to        213
............---------- new table with       12 representatives
# comparing sequences from        213  to        225
............---------- new table with       12 representatives
# comparing sequences from        225  to        237
............---------- new table with       12 representatives
# comparing sequences from        237  to       1235
.....................---------- new table with      998 representatives

     1235  finished       1235  clusters

Approximated maximum memory consumption: 1010M
writing new database
writing clustering information
program completed !

Total CPU time 13.21
(ddocent_env) [mguidry@KITT MGuidry]$ rainbow div -i rcluster -o rbdiv.out
(ddocent_env) [mguidry@KITT MGuidry]$ rainbow div -i rcluster -o rbdiv.out -f 0.5 -K 10
(ddocent_env) [mguidry@KITT MGuidry]$ rainbow merge -o rbasm.out -a -i rbdiv.out
(ddocent_env) [mguidry@KITT MGuidry]$ head rbasm.out
E 1
C 0
L 116
S GGCAGAATTGGAATTAATCTAGCGCTATTCACCACTAACTCAGTGTAGCCCTAAATTGTGAGTTCCAAGCCTCGAACATGAGCCAAGCTCAGACCCGTTAGACGGGGGGGCGAATT
N 1
R 1:0:0
//
C 1
L 125
S CGGACGCTAGATCCGACTGATAGCCCCACGGCATTTAGAAACTGCGCATTATAGGTATGTCGGCATTCCCCGAGAGATATTTCATTTCTGGAAGCGGGATGGGGTGGTCCTTACCATAAAACCAT
(ddocent_env) [mguidry@KITT MGuidry]$ rainbow merge -o rbasm.out -a -i rbdiv.out -r 2
(ddocent_env) [mguidry@KITT MGuidry]$ cat rbasm.out <(echo "E") |sed 's/[0-9]*:[0-9]*://g' | mawk ' {
> if (NR == 1) e=$2;
> else if ($1 ~/E/ && lenp > len1) {c=c+1; print ">dDocent_Contig_" e "\n" seq2 "NNNNNNNNNN" seq1; seq1=0; seq2=0;lenp=0;e=$2;fclus=0;len1=0;freqp=0;lenf=0}
> else if ($1 ~/E/ && lenp <= len1) {c=c+1; print ">dDocent_Contig_" e "\n" seq1; seq1=0; seq2=0;lenp=0;e=$2;fclus=0;len1=0;freqp=0;lenf=0}
> else if ($1 ~/C/) clus=$2;
> else if ($1 ~/L/) len=$2;
> else if ($1 ~/S/) seq=$2;
> else if ($1 ~/N/) freq=$2;
> else if ($1 ~/R/ && $0 ~/0/ && $0 !~/1/ && len > lenf) {seq1 = seq; fclus=clus;lenf=len}
> else if ($1 ~/R/ && $0 ~/0/ && $0 ~/1/) {seq1 = seq; fclus=clus; len1=len}
> else if ($1 ~/R/ && $0 ~!/0/ && freq > freqp && len >= lenp || $1 ~/R/ && $0 ~!/0/ && freq == freqp && len > lenp) {seq2 = seq; lenp = len; freqp=freq}
> }' > rainbow.fasta
(ddocent_env) [mguidry@KITT MGuidry]$ cd-hit-est -i rainbow.fasta -o referenceRC.fasta -M 0 -T 0 -c 0.9
================================================================
Program: CD-HIT, V4.8.1 (+OpenMP), Feb 22 2022, 21:26:56
Command: cd-hit-est -i rainbow.fasta -o referenceRC.fasta -M 0
         -T 0 -c 0.9

Started: Wed Mar  2 10:21:52 2022
================================================================
                            Output                              
----------------------------------------------------------------
total number of CPUs in the system is 80
Actual number of CPUs to be used: 80

total seq: 1235
longest and shortest : 370 and 230
Total letters: 310737
Sequences have been sorted

Approximated minimal memory consumption:
Sequence        : 0M
Buffer          : 80 X 12M = 970M
Table           : 2 X 16M = 33M
Miscellaneous   : 4M
Total           : 1009M

Table limit with the given memory limit:
Max number of representatives: 248606
Max number of word counting entries: 10919121

# comparing sequences from          0  to         15
---------- new table with       15 representatives
# comparing sequences from         15  to         29
..............---------- new table with       14 representatives
# comparing sequences from         29  to         43
..............---------- new table with       14 representatives
# comparing sequences from         43  to         57
..............---------- new table with       14 representatives
# comparing sequences from         57  to         71
..............---------- new table with       14 representatives
# comparing sequences from         71  to         85
..............---------- new table with       14 representatives
# comparing sequences from         85  to         99
..............---------- new table with       14 representatives
# comparing sequences from         99  to        112
.............---------- new table with       13 representatives
# comparing sequences from        112  to        125
.............---------- new table with       13 representatives
# comparing sequences from        125  to        138
.............---------- new table with       13 representatives
# comparing sequences from        138  to        151
.............---------- new table with       13 representatives
# comparing sequences from        151  to        164
.............---------- new table with       13 representatives
# comparing sequences from        164  to        177
.............---------- new table with       13 representatives
# comparing sequences from        177  to        189
............---------- new table with       12 representatives
# comparing sequences from        189  to        201
............---------- new table with       12 representatives
# comparing sequences from        201  to        213
............---------- new table with       12 representatives
# comparing sequences from        213  to        225
............---------- new table with       12 representatives
# comparing sequences from        225  to        237
............---------- new table with       12 representatives
# comparing sequences from        237  to       1235
.....................---------- new table with      998 representatives

     1235  finished       1235  clusters

Approximated maximum memory consumption: 1010M
writing new database
writing clustering information
program completed !

Total CPU time 13.63
```

For real data, knowing the correct number of reference contigs is less obvious than with this example. To make the process of exploring the data easier, you can use the 'remake_reference.sh' script below. 
Download script.
```
curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/remake_reference.sh
```

Now we can use this script to remake the reference and quickly test out new parameters. 
```
bash remake_reference.sh 4 4 0.90 PE 2
```
Output:
```
dDocent remake_reference version 2.8.7

dDocent assembled 7989 sequences (after cutoffs) into 1235 contigs
```

Let's investigate our reference fasta file now.
```
head reference.fasta
```
output:
```
>dDocent_Contig_1
NAATTCATGGGATTCCCTGAGAGCACGAACGTCATTTACATCTAATACTCATTGGCACGTCATGCATTGGCAAAGACGAGTAGTTAGTGATAACGCCTAATCACCACGTCAACTGAANNNNNNNNNNGTGGGGTAGCGGGATAGTAAGCCCCCTGGATTGTCCTATTGACTGCGAAGACAAATAGCAGAGGTTCATACGCTCGGTCCTTTGCGCAGAGGACGGACGATTCGGACGCTATCCTAATTTTGCCGN
>dDocent_Contig_2
NAATTCGTTTGCCCACGGCTTCCACTAAAAGTTGCCCGCAGAACGGATCACTCCAGTATATGCTGCAGTTTGGATGTGAGAGCGGATAGTTTTGCTAATCATCCACGGGCCGTTAGTNNNNNNNNNNCGTAAGGCATCGGATTTACACGGTATACGTCCGATGCATTGCTTGTACCCACGTCCGAATTCATCGACGTGCGCACTCCTGATTATAACTTAACAATAGTCATAACGCCGGGCTCCCTGGTTCCGN
>dDocent_Contig_3
NAATTCACGGCTATCAACTAGGATGGTGGTTACTATTAGTGAGTGCTGTGTATTTCCGCTGCCGTCACTTGCAAGGCAGTAAACCCTTGGTGGCACGTGTAATCCAGCGTATGCAATNNNNNNNNNNCCTGGCCATAGTATTGCTCTAGCATAAAACAAGAGTTATGTATCTTGCCTTCCGGCTAGTCACCTATAGTGATTTGAGCTATTGAAAAGTCACGTTGACTGGAGGTAGAGAGTGGAATACTTCCGN
>dDocent_Contig_4
NAATTCAGCAACTCAAGTAATTCTGTGACTGCCACACCTTTCACCTGTAAGGCACTCGCGTACATCATTAGATCTTATTTGAAAGACCTGGCGTCGCCAATGTTGTCCGCAATAATCNNNNNNNNNNTGCGTACTCACGTTGTTATATAATGCAGCCGTCACACAATTTCGTGGATCGGCTACGGTGCGGGACTGAGACATACGTACGGTCAATAGGAGTAATAATCGCTTCATCATGATACTGGCTGTCCGN
>dDocent_Contig_5
NAATTCTCTGGCATTAATACCTTTATTTCTTTCCCGGAATTTGGTCCATACGCCAAAACCACATTAACTTTACACAGACCATGTCCTCGACGGTCGAATTTAGACAAATTTCTAGTGNNNNNNNNNNCCGTTATTGAACCGAACTATCCTGTTTGATTCGGGGCCTTGGATTTTGACTGGCGTAAGTGCACCGAATTTATAGTATACAATTTTTCACGGGGTAGACGAGTGCGATATCGATCGAGTGAACCGN
```

```
wc -l reference.fasta  #number of lines
mawk '/>/' reference.fasta | wc -l   #number of contigs
```
output:
```
2470 lines
1235 contigs
```

Check that the sequences follow the format we expect.
```
mawk '/^NAATT.*N*.*CCGN$/' reference.fasta | wc -l
grep '^NAATT.*N*.*CCGN$' reference.fasta | wc -l
```
output:
```
1235 contigs
1235 contigs
```

This looks normal, and there are **1235 loci** in the data set.


## Note
For future reference, the tutorial on the dDocent website makes note of the 'ReferenceOpt.sh' script. According to the documentation, "This script uses different loops to assemble references from an interval of cutoff values and c values from 0.8-0.98." 
This does take a while to run so I won't be doing it now due to time, but this is super cool to explore data!!



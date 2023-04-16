# Keegan Hart Week 10 Solution
## The goal of this markdown file is to show how I was able to determine how many loci there are in the demultiplexed files saved in `/home/BIO594/DATA/Week10/` directory. This document was created by following the Reference Assembly Tutorial designed by Jon Puritz on dDocent.com

### Copy files in `/home/BIO594/DATA/Week10/` directory to personal directory. Then enter the directory where you have copied the folder to and check that they are there.
```
cp -r  Week10/ ~/repo/
cd ~/repo/Week10
ls
```

### Because these files are already demultiplexed we can move on to creating a set of unique reads with counts for each individual. In general, this code creates a set of forward and PE reads for each individual by using mawk, concatentates the forward and PE reads together, and finds the unique reads within that individual and counts the occurences.
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
### Eliminate sequencing errors and sum the number of unique reads.
```
cat *.uniq.seqs > uniq.seqs
for i in {2..20};
do 
echo $i >> pfile
done
cat pfile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniq.seqs | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.data
rm pfile
```
### We can then look at the data and see how many unique sequences have copy numbers ranging from 1-20
```
more uniqseq.data
```

### We can also plot this data using the following code:
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

  130000 ++----------+-----------+-----------+-----------+----------+-----------+-----------+-----------+----------++
         +           +           +           +           +          +           +           +           +           +
  125000 ******                                                                                                    ++
         |     ******                                                                                               |
         |           ******                                                                                         |
  120000 ++                ******                                                                                  ++
         |                       ******                                                                             |
  115000 ++                            ******                                                                      ++
         |                                   ******                                                                 |
  110000 ++                                        ******                                                          ++
         |                                               ******                                                     |
  105000 ++                                                    *****                                               ++
         |                                                          ******                                          |
         |                                                                ******                                    |
  100000 ++                                                                     *****                              ++
         |                                                                           *                              |
   95000 ++                                                                           ******                       ++
         |                                                                                  ******                  |
   90000 ++                                                                                       *****            ++
         |                                                                                             *            |
         |                                                                                              ******      |
   85000 ++                                                                                                   *****++
         +           +           +           +           +          +           +           +           +          *+
   80000 ++----------+-----------+-----------+-----------+----------+-----------+-----------+-----------+----------+*
         2           4           6           8           10         12          14          16          18          20
                                                          Coverage
```
### Next we need to choose a cutoff value. In this case we will start with 4
```
parallel --no-notice -j 8 mawk -v x=4 \''$1 >= x'\' ::: *.uniq.seqs | cut -f2 | perl -e 'while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}' > uniqCperindv
wc -l uniqCperindv
```
### From the cutoff of 4 we get:
```
12699 uniqCperindv
```
### Let’s now restrict data by the number of different individuals a sequence appears within.
```
for ((i = 2; i <= 10; i++));
do
echo $i >> ufile
done

cat ufile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniqCperindv | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.peri.data
rm ufile
```
### And plot the data ...
```


                                Number of Unique Sequences present in more than X Individuals

  11000 ++------------+------------+-------------+------------+-------------+------------+-------------+-----------++
        +             +            +             +            +             +            +             +            +
        |                                                                                                           |
        *****                                                                                                       |
  10000 ++   **                                                                                                    ++
        |      ***                                                                                                  |
        |         ***                                                                                               |
        |            *                                                                                              |
   9000 ++            *****                                                                                        ++
        |                  ****                                                                                     |
        |                      ***                                                                                  |
   8000 ++                        *                                                                                ++
        |                          ***********                                                                      |
        |                                     ***                                                                   |
        |                                        **********                                                         |
   7000 ++                                                 ***                                                     ++
        |                                                     ***********                                           |
        |                                                                ***                                        |
        |                                                                   **********                              |
   6000 ++                                                                            ***                          ++
        |                                                                                **************             |
        |                                                                                              **********   |
        +             +            +             +            +             +            +             +         ***+
   5000 ++------------+------------+-------------+------------+-------------+------------+-------------+-----------+*
        2             3            4             5            6             7            8             9            10
                                                    Number of Individuals
```
### Again we choose a cutoff value of 4...
```
mawk -v x=4 '$1 >= x' uniqCperindv > uniq.k.4.c.4.seqs
wc -l uniq.k.4.c.4.seqs
```
### We are now down to 
```
7989 uniq.k.4.c.4.seqs
```
### Convert back to fasta format:
```
cut -f2 uniq.k.4.c.4.seqs > totaluniqseq
mawk '{c= c + 1; print ">Contig_" c "\n" $1}' totaluniqseq > uniq.fasta
```
### If this was not simulated data we would check for reads that have a substantial amount of Illumina adapter in them. 

### Now start assembling reference contigs:
### get forward reads:
```
sed -e 's/NNNNNNNNNN/\t/g' uniq.fasta | cut -f1 > uniq.F.fasta
```
### RAD Assembly:clusters all off the forward reads by 80% similarity
```
cd-hit-est -i uniq.F.fasta -o xxx -c 0.8 -T 0 -M 0 -g 1
```
```

Started: Sun Apr 16 15:04:12 2023
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
Total           : 1012M

Table limit with the given memory limit:
Max number of representatives: 248606
Max number of word counting entries: 6715988

# comparing sequences from          0  to       7238
.......---------- new table with     1234 representatives
# comparing sequences from       7238  to       7989
....................---------- new table with        0 representatives

     7989  finished       1234  clusters

Apprixmated maximum memory consumption: 1014M
writing new database
writing clustering information
program completed !

Total CPU time 4.62
```
### Convert the output of CD-hit to match the output of the first phase of rainbow.
```
mawk '{if ($1 ~ /Cl/) clus = clus + 1; else  print $3 "\t" clus}' xxx.clstr | sed 's/[>Contig_,...]//g' | sort -g -k1 > sort.contig.cluster.ids
paste sort.contig.cluster.ids totaluniqseq > contig.cluster.totaluniqseq
sort -k2,2 -g contig.cluster.totaluniqseq | sed -e 's/NNNNNNNNNN/\t/g' > rcluster
```
### How many clusters in rcluster?
```
cut -f2 rcluster | uniq | wc -l 
```
```
1234
```
### Split clusters formed in the first step into smaller clusters representing significant variants.
```
rainbow div -i rcluster -o rbdiv.out 
```
### The -f parameter in the following code represents the minimum frequency of an allele necessary to divide it into its own cluster. The standard is 0.2 but we want 0.5
```
rainbow div -i rcluster -o rbdiv.out -f 0.5 -K 10 
```
### Merge divided clusters
```
rainbow merge -o rbasm.out -a -i rbdiv.out
```
### We want to specify the -r parameter, which is the minimum number of reads to assemble. The data is from multiple individuals so we will use a cutoff of 2.
```
rainbow merge -o rbasm.out -a -i rbdiv.out -r 2
```
### The rbasm script produces lists of optimal and suboptimal contigs
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
### Check rainbow's assembly with cd-hit
```
cd-hit-est -i rainbow.fasta -o referenceRC.fasta -M 0 -T 0 -c 0.9
```
```
Started: Sun Apr 16 15:16:11 2023
================================================================
                            Output                              
----------------------------------------------------------------
total number of CPUs in the system is 80
Actual number of CPUs to be used: 80

total seq: 1235
longest and shortest : 370 and 230
Total letters: 310771
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

Apprixmated maximum memory consumption: 1010M
writing new database
writing clustering information
program completed !

Total CPU time 7.91
```
### Download script called remake_reference.sh
```
curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/remake_reference.sh
```
### Use script to remake reference and test parameters:
```
bash remake_reference.sh 4 4 0.90 PE 2
```
```

All required software is installed!

dDocent remake_reference version 2.8.7
sort: write failed: standard output: Broken pipe
sort: write error

dDocent assembled 7989 sequences (after cutoffs) into 1235 contigs  
```
### Look at reference: 
```
head reference.fasta
```
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
### How many lines are in the file?
```
wc -l reference.fasta
```
```
2470 reference.fasta
```

### How many sequences are there?
```
mawk '/>/' reference.fasta | wc -l 
```
```
1235
```
### Do sequences follow expected format?
```
mawk '/^NAATT.*N*.*CCGN$/' reference.fasta | wc -l
grep '^NAATT.*N*.*CCGN$' reference.fasta | wc -l
```
```
1235
1235
```


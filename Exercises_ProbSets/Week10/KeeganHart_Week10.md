# Keegan Hart Week 10 Solution
## The goal of this markdown file is to show how I was able to determine how many loci there are in the demultiplexed files saved in `/home/BIO594/DATA/Week10/` directory. This document was created by following the Reference Assembly Tutorial designed by Jon Puritz on dDocent.com

### Step 1: Copy files in `/home/BIO594/DATA/Week10/` directory to personal directory. Then enter the directory where you have copied the folder to and check that they are there.
```
cp -r  Week10/ ~/repo/
cd ~/repo/Week10
ls
```

### Step 2: Because these files are already demultiplexed we can move on to creating a set of unique reads with counts for each individual. In general, this code creates a set of forward and PE reads for each individual by using mawk, concatentates the forward and PE reads together, and finds the unique reads within that individual and counts the occurences.
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
### Step 3: eliminate sequencing errors and sum the number of unique reads.
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




##Exercise solutions
How many loci are there?

```
$ wc PopA_009.R.fq.gz 
   291   3522 273652 PopA_009.R.fq.gz
```
There are 291 loci in this fasta file.

Aligning a reference fasta file:

```
(base) [mmehlrose@KITT ~]$ mkdir Week10Practice
(base) [mmehlrose@KITT ~]$ cd Week10Practice/
(base) [mmehlrose@KITT Week10Practice]$ cp /home/BIO594/DATA/Week10/ .
cp: omitting directory ‘/home/BIO594/DATA/Week10/’
(base) [mmehlrose@KITT Week10Practice]$ ls
(base) [mmehlrose@KITT Week10Practice]$ rsync -a /home/BIO594/DATA/Week10/ ~/Week10Practice/
(base) [mmehlrose@KITT Week10Practice]$ ls
PopA_001.F.fq.gz  PopB_001.F.fq.gz  PopC_001.F.fq.gz  PopD_001.F.fq.gz
PopA_001.R.fq.gz  PopB_001.R.fq.gz  PopC_001.R.fq.gz  PopD_001.R.fq.gz
PopA_002.F.fq.gz  PopB_002.F.fq.gz  PopC_002.F.fq.gz  PopD_002.F.fq.gz
PopA_002.R.fq.gz  PopB_002.R.fq.gz  PopC_002.R.fq.gz  PopD_002.R.fq.gz
PopA_003.F.fq.gz  PopB_003.F.fq.gz  PopC_003.F.fq.gz  PopD_003.F.fq.gz
PopA_003.R.fq.gz  PopB_003.R.fq.gz  PopC_003.R.fq.gz  PopD_003.R.fq.gz
PopA_004.F.fq.gz  PopB_004.F.fq.gz  PopC_004.F.fq.gz  PopD_004.F.fq.gz
PopA_004.R.fq.gz  PopB_004.R.fq.gz  PopC_004.R.fq.gz  PopD_004.R.fq.gz
PopA_005.F.fq.gz  PopB_005.F.fq.gz  PopC_005.F.fq.gz  PopD_005.F.fq.gz
PopA_005.R.fq.gz  PopB_005.R.fq.gz  PopC_005.R.fq.gz  PopD_005.R.fq.gz
PopA_006.F.fq.gz  PopB_006.F.fq.gz  PopC_006.F.fq.gz  PopD_006.F.fq.gz
PopA_006.R.fq.gz  PopB_006.R.fq.gz  PopC_006.R.fq.gz  PopD_006.R.fq.gz
PopA_007.F.fq.gz  PopB_007.F.fq.gz  PopC_007.F.fq.gz  PopD_007.F.fq.gz
PopA_007.R.fq.gz  PopB_007.R.fq.gz  PopC_007.R.fq.gz  PopD_007.R.fq.gz
PopA_008.F.fq.gz  PopB_008.F.fq.gz  PopC_008.F.fq.gz  PopD_008.F.fq.gz
PopA_008.R.fq.gz  PopB_008.R.fq.gz  PopC_008.R.fq.gz  PopD_008.R.fq.gz
PopA_009.F.fq.gz  PopB_009.F.fq.gz  PopC_009.F.fq.gz  PopD_009.F.fq.gz
PopA_009.R.fq.gz  PopB_009.R.fq.gz  PopC_009.R.fq.gz  PopD_009.R.fq.gz
PopA_010.F.fq.gz  PopB_010.F.fq.gz  PopC_010.F.fq.gz  PopD_010.F.fq.gz
PopA_010.R.fq.gz  PopB_010.R.fq.gz  PopC_010.R.fq.gz  PopD_010.R.fq.gz
PopA_011.F.fq.gz  PopB_011.F.fq.gz  PopC_011.F.fq.gz  PopD_011.F.fq.gz
PopA_011.R.fq.gz  PopB_011.R.fq.gz  PopC_011.R.fq.gz  PopD_011.R.fq.gz
PopA_012.F.fq.gz  PopB_012.F.fq.gz  PopC_012.F.fq.gz  PopD_012.F.fq.gz
PopA_012.R.fq.gz  PopB_012.R.fq.gz  PopC_012.R.fq.gz  PopD_012.R.fq.gz
PopA_013.F.fq.gz  PopB_013.F.fq.gz  PopC_013.F.fq.gz  PopD_013.F.fq.gz
PopA_013.R.fq.gz  PopB_013.R.fq.gz  PopC_013.R.fq.gz  PopD_013.R.fq.gz
PopA_014.F.fq.gz  PopB_014.F.fq.gz  PopC_014.F.fq.gz  PopD_014.F.fq.gz
PopA_014.R.fq.gz  PopB_014.R.fq.gz  PopC_014.R.fq.gz  PopD_014.R.fq.gz
PopA_015.F.fq.gz  PopB_015.F.fq.gz  PopC_015.F.fq.gz  PopD_015.F.fq.gz
PopA_015.R.fq.gz  PopB_015.R.fq.gz  PopC_015.R.fq.gz  PopD_015.R.fq.gz
PopA_016.F.fq.gz  PopB_016.F.fq.gz  PopC_016.F.fq.gz  PopD_016.F.fq.gz
PopA_016.R.fq.gz  PopB_016.R.fq.gz  PopC_016.R.fq.gz  PopD_016.R.fq.gz
PopA_017.F.fq.gz  PopB_017.F.fq.gz  PopC_017.F.fq.gz  PopD_017.F.fq.gz
PopA_017.R.fq.gz  PopB_017.R.fq.gz  PopC_017.R.fq.gz  PopD_017.R.fq.gz
PopA_018.F.fq.gz  PopB_018.F.fq.gz  PopC_018.F.fq.gz  PopD_018.F.fq.gz
PopA_018.R.fq.gz  PopB_018.R.fq.gz  PopC_018.R.fq.gz  PopD_018.R.fq.gz
PopA_019.F.fq.gz  PopB_019.F.fq.gz  PopC_019.F.fq.gz  PopD_019.F.fq.gz
PopA_019.R.fq.gz  PopB_019.R.fq.gz  PopC_019.R.fq.gz  PopD_019.R.fq.gz
PopA_020.F.fq.gz  PopB_020.F.fq.gz  PopC_020.F.fq.gz  PopD_020.F.fq.gz
PopA_020.R.fq.gz  PopB_020.R.fq.gz  PopC_020.R.fq.gz  PopD_020.R.fq.gz
(base) [mmehlrose@KITT Week10Practice]$ ls *.F.fq.gz > namelist
(base) [mmehlrose@KITT Week10Practice]$ sed -i'' -e 's/.F.fq.gz//g' namelist
(base) [mmehlrose@KITT Week10Practice]$ AWK1='BEGIN{P=1}{if(P==1||P==2){gsub(/^[@]/,">");print}; if(P==4)P=0; P++}'
(base) [mmehlrose@KITT Week10Practice]$ AWK2='!/>/'
(base) [mmehlrose@KITT Week10Practice]$ AWK3='!/NNN/'
(base) [mmehlrose@KITT Week10Practice]$ PERLT='while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}'
(base) [mmehlrose@KITT Week10Practice]$ cat namelist | parallel --no-notice -j 8 "zcat {}.F.fq.gz | mawk '$AWK1' | mawk '$AWK2' > {}.forward"
(base) [mmehlrose@KITT Week10Practice]$ cat namelist | parallel --no-notice -j 8 "zcat {}.R.fq.gz | mawk '$AWK1' | mawk '$AWK2' > {}.reverse"
(base) [mmehlrose@KITT Week10Practice]$ cat namelist | parallel --no-notice -j 8 "paste -d '-' {}.forward {}.reverse | mawk '$AWK3' | sed 's/-/NNNNNNNNNN/' | perl -e '$PERLT' > {}.uniq.seqs"
(base) [mmehlrose@KITT Week10Practice]$ cat *.uniq.seqs > uniq.seqs
(base) [mmehlrose@KITT Week10Practice]$ for i in {2..20};
> do
> echo $i >> pfile
> done
(base) [mmehlrose@KITT Week10Practice]$ cat pfile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniq.seqs | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.data
(base) [mmehlrose@KITT Week10Practice]$ rm pfile
(base) [mmehlrose@KITT Week10Practice]$ gnuplot << \EOF 
> set terminal dumb size 120, 30
> set autoscale
> set xrange [2:20] 
> unset label
> set title "Number of Unique Sequences with More than X Coverage (Counted within individuals)"
> set xlabel "Coverage"
> set ylabel "Number of Unique Sequences"
> plot 'uniqseq.data' with lines notitle
> pause -1
> EOF


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

(base) [mmehlrose@KITT Week10Practice]$ parallel --no-notice -j 8 mawk -v x=4 \''$1 >= x'\' ::: *.uniq.seqs | cut -f2 | perl -e 'while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}' > uniqCperindv
(base) [mmehlrose@KITT Week10Practice]$  $wc -l uniqCperindv
bash: -l: command not found...
(base) [mmehlrose@KITT Week10Practice]$ 
(base) [mmehlrose@KITT Week10Practice]$ conda run mamba
usage: mamba [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

Options:

positional arguments:
  command
    clean             Remove unused packages and caches.
    compare           Compare packages between conda environments.
    config            Modify configuration values in .condarc. This is modeled
                      after the git config command. Writes to the user
                      .condarc file (/home/mmehlrose/.condarc) by default. Use
                      the --show-sources flag to display all identified
                      configuration locations on your computer.
    create            Create a new conda environment from a list of specified
                      packages.
    info              Display information about current conda install.
    init              Initialize conda for shell interaction.
    install           Installs a list of packages into a specified conda
                      environment.
    list              List installed packages in a conda environment.
    package           Low-level conda package utility. (EXPERIMENTAL)
    remove (uninstall)
                      Remove a list of packages from a specified conda
                      environment. Use `--all` flag to remove all packages and
                      the environment itself.
    rename            Renames an existing environment.
    run               Run an executable in a conda environment.
    search            Search for packages and display associated
                      information.The input is a MatchSpec, a query language
                      for conda packages. See examples below.
    update (upgrade)  Updates conda packages to the latest compatible version.
    notices           Retrieves latest channel notifications.
    repoquery         Query repositories using mamba.

optional arguments:
  -h, --help          Show this help message and exit.
  -V, --version       Show the conda version number and exit.

conda commands available from other packages (legacy):
  content-trust
  env

(base) [mmehlrose@KITT Week10Practice]$ parallel --no-notice -j 8 mawk -v x=4 \''$1 >= x'\' ::: *.uniq.seqs | cut -f2 | perl -e 'while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}' > uniqCperindv
(base) [mmehlrose@KITT Week10Practice]$  $wc -l uniqCperindv
bash: -l: command not found...
(base) [mmehlrose@KITT Week10Practice]$ 
(base) [mmehlrose@KITT Week10Practice]$ parallel --no-notice -j 8 mawk -v x=4 \''$1 >= x'\' ::: *.uniq.seqs | cut -f2 | perl -e 'while (<>) {chomp; $z{$_}++;} while(($k,$v) = each(%z)) {print "$v\t$k\n";}' > uniqCperindv
(base) [mmehlrose@KITT Week10Practice]$ ec -l uniqCperindv 
bash: ec: command not found...
(base) [mmehlrose@KITT Week10Practice]$ wc -l uniqCperindv 
12699 uniqCperindv
(base) [mmehlrose@KITT Week10Practice]$ for ((i = 2; i <= 10; i++));
> do
> echo $i >> ufile
> done
(base) [mmehlrose@KITT Week10Practice]$ cat ufile | parallel --no-notice "echo -n {}xxx && mawk -v x={} '\$1 >= x' uniqCperindv | wc -l" | mawk  '{gsub("xxx","\t",$0); print;}'| sort -g > uniqseq.peri.data
(base) [mmehlrose@KITT Week10Practice]$ rm ufile 
(base) [mmehlrose@KITT Week10Practice]$ mawk -v x=4 '$1 >= x' uniqCperindv > uniq.k.4.c.4.seqs
(base) [mmehlrose@KITT Week10Practice]$ wc -l uniq.k.4.c.4.seqs
7989 uniq.k.4.c.4.seqs
(base) [mmehlrose@KITT Week10Practice]$ curl -L -O https://github.com/jpuritz/dDocent/raw/master/scripts/remake_reference.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 17835  100 17835    0     0  52653      0 --:--:-- --:--:-- --:--:-- 17.0M
(base) [mmehlrose@KITT Week10Practice]$ bash remake_reference.sh 4 4 0.90 PE 2

All required software is installed!

dDocent remake_reference version 2.8.7

dDocent assembled 7989 sequences (after cutoffs) into 1235 contigs
(base) [mmehlrose@KITT Week10Practice]$ wc -l reference.fasta
2470 reference.fasta
```
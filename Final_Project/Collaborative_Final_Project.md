Final Project for BIO 594 2023
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

# Data setup

The data set is too large to evaluate on KITT, so I will run the initial
SNP calling on an HPC. The code below is a way to download data from the
SRA and rename for dDocent. First thing is to download the metadata for
all of the sequences we want using the BioProject for the paper. The
meta data comes from
<https://www.ncbi.nlm.nih.gov/bioproject/PRJNA504598/>. Click on SRA
experiments and then “Send to Run Selector and then download it. I have
placed in `BIO_594_2023/Final_Project/input`. The full file is
`SraRunTable.txt` but I made a much simpler csv file `SraRunTable.csv`
to work with

Next we need the SRA-toolkit, save the environment, and reload from the
file for reproducibility

``` bash
mamba create -n sra sra-tools
mamba activate sra
mkdir ./environ
conda list --explicit > ./environ/sra.txt
mamba deactivate
mamba create --name sra --file ./environ/sra.txt
```

Now we can download the files

``` bash
source activate sra
mkdir variant_calling
cd variant_calling
for i in `cut -f 1 -d "," ../input/SraRunTable.csv | grep -v Run`;
do
fasterq-dump $i -p -e 16 --qual-defline "+"
gzip ${i}_1.fastq
gzip ${i}_2.fastq
done
```

``` bash
NAMES=( `cut -f2  -d "," ../input/SraRunTable.csv | grep -v Library `)
NAMES2=( `cut -f1 -d "," ../input/SraRunTable.csv | grep -v Run`)
LEN=( `grep -v Run ../input/SraRunTable.csv | wc -l `)
LEN=$(($LEN - 1))

for ((i = 0; i <= $LEN; i++));
do
mv ${NAMES2[$i]}_1.fastq.gz ${NAMES[$i]}.F.fq.gz
mv ${NAMES2[$i]}_2.fastq.gz ${NAMES[$i]}.R.fq.gz
done
```

\#SNP Filtering

\#Kinship Analysis

\#Outlier Analysis

\#DAPC

\#PCA

\#FST
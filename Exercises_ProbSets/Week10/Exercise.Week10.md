# Take-home Exercise for Week 10

If you're getting an error with `conda`.  Please install miniconda with the following commands:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
bash Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
```

This will start an install script.  It will ask a few questions:

```
Welcome to Miniconda3 py39_23.1.0-1

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
```

Just press enter

You will then have to press spacebar to scroll through the user agreement.  Then you will encounter a second prompt:

```
Do you accept the license terms? [yes|no]
```

Type `yes` and press enter.

Another prompt:

```
Miniconda3 will now be installed into this location:
/home/maestro/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below
```

Press enter and you are good to go.  

Now log out and log back in.  The `conda` command should then work.

### Last Setup Part

```
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda install mamba
```


### How many loci are there?

I've placed some files in the `/home/BIO594/DATA/Week10/` directory.  They are ddRADseq files that have already been demultiplexed.  

Using your new RADSeq assembly skills:

* Post a markdown document to this directory showing your efforts to answer the question: 
	* How many loci are there in the data set?

* Post a `reference.fasta` file with your assembled reference

* You can use the material from class or anything else you might find at [dDocent.com](dDocent.com)

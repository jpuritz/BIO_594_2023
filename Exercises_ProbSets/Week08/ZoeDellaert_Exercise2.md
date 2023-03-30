Exercise 2- Answer these challenges with one line of code
 1. I have put a text file, named file, in the directory “sneaky” that’s within the directory “Exercises” that’s within the directory "BIO594" in the "home" directory.  Tell me what the contents of the file are.

cat ~/BIO594/Exercises/sneaky/file.txt

or

cat /home/BIO594/Exercises/sneaky/file.txt

 2. Print the first 5 lines of the third column of out.idepth in /home/BIO594/Exercises/Week_2

awk '{print $3}' /home/BIO594/Exercises/Week_2/out.idepth | head -n 5

or

head -5  /home/BIO594/Exercises/Week_2/out.idepth | cut -f3

3. Print only the 19th line of the second column of out.idepth

awk '{print $2}' /home/BIO594/Exercises/Week_2/out.idepth | sed -n '19p'

 4. Print how many individuals have a MEAN_DEPTH greater than 20.1

awk '$3 > 20.1 {print $3}' /home/BIO594/Exercises/Week_2/out.idepth | grep -c .

10

 5. Print how many individuals have a MEAN_DEPTH greater than 20.1 but less than 20.25

awk '$3 > 20.1 && $3 < 20.25 {print $3}' /home/BIO594/Exercises/Week_2/out.idepth | wc -l

 6. Print the average MEAN_DEPTH

awk 'NR > 1 {sum += $3; n++} END {if (n > 0) print sum / n}'  /home/BIO594/Exercises/Week_2/out.idepth

19.8581

or awk '{sum=sum+$3} END {print sum/NR}' out.idepth

, but this includes the header line

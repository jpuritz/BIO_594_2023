cat /home/alcarr/../BIO594/Exercises/sneaky/file
Oh me! Oh life! of the questions of these recurring,
Of the endless trains of the faithless, of cities fill’d with the foolish,
Of myself forever reproaching myself, (for who more foolish than I, and who more faithless?)
Of eyes that vainly crave the light, of the objects mean, of the struggle ever renew’d,
Of the poor results of all, of the plodding and sordid crowds I see around me,
Of the empty and useless years of the rest, with the rest me intertwined,
The question, O me! so sad, recurring—What good amid these, O me, O life?

                                       Answer.
That you are here—that life exists and identity,
That the powerful play goes on, and you may contribute a verse.

head -5 ../../BIO594/Exercises/Week_2/out.idepth
INDV    N_SITES MEAN_DEPTH
PopA_01 8343    19.7475
PopA_02 8481    19.8769
PopA_03 8453    20.2284
PopA_04 8591    19.4391
8428

awk '$3 > 20.1' ../../BIO594/Exercises/Week_2/out.idepth
INDV    N_SITES MEAN_DEPTH
PopA_03 8453    20.2284
PopA_05 8448    20.4425
PopA_08 8454    20.1047
PopA_09 8341    20.2223
PopA_13 8408    20.6407
PopA_20 8342    20.1082
PopB_07 8392    20.2092
PopB_08 8382    20.2733
PopB_09 8262    20.2642
PopB_14 8370    20.2419

awk '$3 > 20.1 && $3 < 20.25' ../../BIO594/Exercises/Week_2/out.idepth
PopA_03	8453	20.2284
PopA_08	8454	20.1047
PopA_09	8341	20.2223
PopA_20	8342	20.1082
PopB_07	8392	20.2092
PopB_14	8370	20.2419

awk '{sum=sum+$3} END {print sum/NR}' out.idepth
19.3738

# BIO 594-0001: Conservation and Population Genomics: theory and practice

## Instructor: Dr. Jon Puritz, Biological Sciences
#### Office: CBLS 183
#### Student hours: Wed, 3:30 PM to 4:30 PM, Thu 1:00 PM to 1:30 PM
Feel free to come by during this time without an appointment, otherwise schedule a time with me via email
#### Email: jpuritz@uri.edu  Phone: 401-874-9020
*I will do my best to respond promptly during business hours (M-F: 9-5)*

## Meeting Time and Location for Spring 2023
#### Wednesdays 1:00 PM to 3:00PM
#### Woodward Hall Room 115

## Masking Policy
Masks are **required at all times** within our classroom.  Students without masks will be asked to leave.  The masking policy will be revisited throughout the semester.  Thank you for your patience and compliance.

## Course Description
The advent of next-generation sequencing (NGS) has rapidly transcended population genetics to population genomics.  Sequencer outputs have expanded from kilobases to gigabases while becoming over 30,000 times less expensive.  This allows population levels studies to use thousands of genetic markers across the entire genome, and to survey both neutral and adaptive loci.  However, to properly harness these new datasets and technology, researchers must have a firm grasp on population genetics theory. 

In this class, we will cover the basics of Population Genetic Theory using chapters and problem sets.  While working on problem sets, we will develop core principles of open, reproducible genomic analysis utilizing RMarkdown and GitHub.  The second half of class will focus on learning the application of restriction-site associated sequencing (RADseq) data to analyze populations.  Topics will be focused on experimental design, technical limitations, and analytical objectives.  Computer-based “laboratory sessions” will immediately follow the lecture and cover bioinformatics and population genomic analyses using real and simulated data sets.  Students are encouraged to bring their own data sets to the class, and the final curriculum will be tailored to class interests.  

## Course Goals and Student Learning Outcomes
After completing this course, students should be able to:
* Understand the basic theoretical principles of population genomics
* Effectively work in a command-line Linux environment
* Knowledgeably filter data sets for statistical and bioinformatic artifacts
* Determine loci potentially under selection and estimate population genetic parameters with both neutral and putatively adaptive loci
* Produce a completely open and repeatable documentation of a complete population genomic analysis utilizing RMarkDown within RStudio Server.

## Readings

### Part I- Theory
For the first half of class, readings will be from the Allendorf et al. textbook, [Conservation and the Genomics of Populations](https://doi-org.uri.idm.oclc.org/10.1093/oso/9780198856566.001.0001).  We will be using the [Perusall platform](https://www.perusall.com/) to allow for collaborative note-taking and discussion.  Please use course code PURITZ-ZLXT7 to join the class.  Readings during this part of class will be paired with students fullfilling different roles in class.  Please see [Reading Discussions](#Reading-Discussions) below for more details. 

### Part II- Practice
Readings will be selected from web based tutorials, package vignettes, software documentation, and the primary literature.  Readings will be assigned on a week by week basis.  

## Reading Discussions

For each chapter discussed in **Part I** of class, three students will be assigned speciic roles to facilitate discussion:

**[SignUp Sheet](Readings/SignUp.md)**

| Role| | Responsibilities|
|------|:--:|--------------|
| Lecturer |<img src="https://media.tenor.com/xR1r8YpN8CsAAAAC/himym-how-i-met-your-mother.gif"  width="200" />| The Lecturer must compile a 10-20 min presentation that summarizes and highlights the main topics presented in the chapter.  Every student must be a lecturer for at least one book chapter.|
| Discussion Leader |<img src="https://gifdb.com/images/high/michael-scott-ship-is-hidden-in-leadership-p0zkim2xc9dbkdbs.webp"   width="200" /> | The Discussion Leader must come up with 5 ideas, concepts, or questions to be discussed beforehand.  Discussion questions/topics need to be posted one day before class. Every student must be a lecturer for at least one book chapter.|
| Scribe |<img src="https://media.tenor.com/gdKIOTXpda8AAAAC/jonathan-scribe-nod.gif"   height="120" /> | The scribe is responsible for taking notes during our class room discussion and posting them on the class Repo before the next class. Every student must be a lecturer for at least one book chapter.|
| Modeler **Optional Role** |<img src="https://thumbs.gfycat.com/IdealPartialAustralianfreshwatercrocodile-size_restricted.gif" width="200"  /> |The Modeler must find a model or visualization that captures at least one of the topics discussed in the chapter.  Bonus points if the model is coded in a reproducible RMarkDown document|

## Required Equipment
Students must bring their own laptop (Mac, Windows, or Linux) with the capability of SSHing into a linux server.  Please contact the instructor if you do not have a laptop available to use and/or requiring one is not a financial possibility.
We will be doing the majority of our problem sets and code documentation in RMarkDown on GitHub via RStudio or VSCode. Please familiarize yourself with by downloading a local installation.  We will be using a server based version to unify our bioinformatics and analysis.

## Schedule
Updated 1/25/2023 and still subject to change

| Date    | Week | Topic                                                                    | Reading                                               | Exercises and Problem Sets |
| ------- | ---- | ------------------------------------------------------------------------ | ----------------------------------------------------- | -------------------------- |
| 1/25/23 | 1    | Course Intro and Computer Setup and Testing                              | None                                                  |                            |
| 2/1/23  | 2    | Introduction to Phenotypic and Genetic Variaiton and Population Genomics | Text Book Chapters: 1-4                                             | Exercise 1                 |
|         |      | Github, Rmarkdown, and open science using RStudio                        | [Web Links](/Readings/Week_03/Web_Readings.md); [BES Guide to Open Science](https://github.com/jpuritz/BIO_594_2022/blob/main/Readings/Week_03/BES-Guide_to_reproducible_code.pdf)                                                      |
| 2/8/23  | 3    | Probability and Random Mating Populations: HWE                           | Appendix, Chap 5                                      | None                       |
| 2/15/23 | 4    | Effective Population Size and Genetic Drift                              | Text Book Chapters: 6-7                                             | [Prob Set 1](https://github.com/jpuritz/BIO_594_2023/blob/main/Exercises_ProbSets/Week03/Week_3_ProblemSet.md)                 |
| 2/22/23 | 5    | Natual Selection and Population Structure                                | Class cancelled                                            | [Prob Set 2](/Exercises_ProbSets/Week04/Week_4_ProblemSet.md)                 |
| 3/1/23  | 6    | Genetics to Genomics                                                     | Text Book Chapters: 8-10                                          | [Prob Set 2](/Exercises_ProbSets/Week04/Week_4_ProblemSet.md) and [Prob Set 3](/Exercises_ProbSets/Week05/Week_5_ProblemSet.md)                 |
| 3/8/23  | 7    | Exploited Populations and Climate Change                                 |              Text Book Chapters: 10-12                          | [Prob Set 3](/Exercises_ProbSets/Week05/Week_5_ProblemSet.md)              |
| 3/15/23 |      | SPRING BREAK!!                                                           |                                                       |                            |
| 3/22/23 | 8    | Unix Command Line                                                        | Text Book Chapters: 15-16                                                          |                         |
| 3/29/23 | 9    | NGS Data Structures- Visualization and Manipulation                      |                                                  |[Prob Set 4](/Exercises_ProbSets/Week06/Week_6_ProblemSet.md)  Linux Tutorials  |
| 4/5/23  | 10   | RADseq: De novo assembly and read mapping                                |                                                       |
| 4/12/23 | 11   | RADseq: SNP Calling and Filtering                                        |                                                       |
| 4/19/23 | 12   | Detecting Loci Under Selection                                           |                                                       |                            |
| 4/26/23 | 13   | Analyzing Population Structure                                           |                                                       |                            |
| 5/10/23 | 14   | FINAL PROJECTS DUE                                                       |                                                       |                            |
| 5/31/23 |      | ALL CLASS USER ACCOUNTS DELETED FROM KITT                                | Contact Dr. Puritz if you need different arrangements |


## Grading

### Class Participation (75%)
This class will be most effective when students come prepared for class (finished with assigned readings) and are ready to think critically about the day's topic.  You're highly encouraged to ask questions and share your opinions with the class.

#### Grading Breakdown
* Attendance (5 points)
  * Virtual attendance is allowed!
* Discussion Roles (40 points)
  * Chapter as Lecturer (20 of 40 points)
  * Chapter as Discussion Leader (15 of 40 points)
  * Chapter as Scribe (5 of 40 points)  
* Exercises and problem set (25 points)
  * **Part I** 
    * Several chapters will have problem sets that accompany them.  Problem sets must be posted to the GitHub Repo by the next class.  Problem sets can be worked on collaboratively.
  * **Part II** 
    * Each class will have a "laboratory" section where each student will work through exercises at their own pace.  Each exercise must be completed and documented on Github by the next class to receive credit (four points per week).  

### Final Projects (25%)

#### Option 1
The culmination of this course will be the completion of a final Population Genomics Project.  Each student must analyze a NGS data set from raw sequencing files to a completed population level analysis.  Students are encouraged to use their own data sets, but students can also use an actual data set of Dr. Puritz or a simulated data set.  Projects can be completed on a different computing system or may use software and packages not discussed in the course, but all analyses and results must be documented and repeatable.  

#### Option 2
We as a class will seek to reproduce and improve a published population genomics analysis.  We would divide the work up amongst small teams each responsible for specific parts of the the analysis, from bioinformatics to populatio-level stats.  All steps of the analysis would be documented and repeatable.

#### Grading Breakdown
* Project Plan and Approval (10 points)
  * A detailed outline of the proposed data set and analyses must be submitted and approved by Dr. Puritz by 4/12/23
* Analysis (20 points)
  * All bioinformatic are properly completed
  * Appropriate population genomic analyses are utilized and properly completed
* Documentation (20 points)
  * All work must be fully documented and repeatable on the class Github account
  * This includes markdown style documentation and executable scripts for each analysis component



## Accommodations

Any student with a documented disability is welcome to contact me as early in the semester as possible so that we may arrange reasonable accommodations. As part of this process, please be in touch with Disability Services for Students Office at 330 Memorial Union, 401-874-2098 [http://www.uri.edu/disabilittddss/](http://www.uri.edu/disabilittddss/) or the Academic Skills Center, [http://web.uri.edu/ceps/academic-skills-center/](http://web.uri.edu/ceps/academic-skills-center/).

"Section 504 of the Rehabilitation act of 1973 and the Americans with Disabilities Act of 1990 require the University of Rhode Island to provide academic adjustments or the accommodations for students with documented disabilities. The student with a disability shall be responsible for self-identification to the Disability Services for Students in the Office of Student Life, providing appropriate documentation of disability, requesting accommodation in a timely manner, and follow-through regarding accommodations requested."  It is the student's responsibility to make arrangements for any special needs and the instructor's responsibility to accommodate them with the assistance of the Office of Disability Services for Students. More resources are available here: http://web.uri.edu/disability/

## Course Assistance
This is a challenging course. Success requires that you keep pace with the work, understand course concepts, and study effectively. The Academic Enhancement Center (AEC) and Writing Center (WC), located in Roosevelt Hall, offers several kinds of support that help students improve their learning and academic performance in this and other classes. For information on any of these programs, visit [uri.edu/aec](uri.edu/aec), call the AEC’s main number at (401) 874-2367, or follow the specific suggestions below

* ***Subject Specific Tutoring***, located on the fourth floor of Roosevelt Hall, helps students navigate 100 and 200 level math, chemistry, physics, biology, and other select STEM courses. Options for peer tutoring are designed to enable you to get the kind of help you need when you need it. Students can join a **Weekly Tutoring Group** with others in their courses (information on groups will be made available to you in supported classes), stop by a subject-specific Drop-In Center as needed, or make a one-time **Group Appointment**. Information on what these programs offer, when they are available, and how to utilize them is available at [uri.edu/aec/tutoring](uri.edu/aec/tutoring).

* ***Academic Skills and Strategies*** programs help students identify their individual planning and studying needs in this or any other course. They can teach you more effective ways of studying, planning, managing time and work, and how to deal with challenges like procrastination and motivation. **Academic Skills Sessions** are 30-minute, one-on-one appointments that students can schedule online by visiting the AEC on Starfish and making an appointment with Dr. David Hayes, the AEC’s academic skills development specialist. **UCS160: Success in Higher Education** is a one-credit course offered each semester to all undergraduates on learning how to learn and excel in college academics. For more information on these programs or for help making an appointment, visit [uri.edu/aec/academic-skills](uri.edu/aec/academic-skills) or contact Dr. Hayes directly at davidhayes@uri.edu  

* ***The URI Writing Center***, located in Roosevelt Hall 009 (lower level, Memorial Union end), offers one-on-one and small-group peer tutoring for student writers in all majors who need help developing ideas or would benefit from advice on any aspect of writing. Appointments are 45 minutes in length and can be scheduled online at [uri.mywconline.com](uri.mywconline.com). It's best to make appointments in advance, especially during midterms and finals, but we often have same-day and drop-in appointments available so that writers can stop by to see what's open. For more information visit [uri.edu/aec/writing](uri.edu/aec/writing).

## Conduct and Behavior
Students are expected to treat faculty and fellow classmates with dignity and respect.  Students are responsible for being familiar with and adhering to the published "Student Code of Conduct" which can be accessed in the University Student Handbook [http://web.uri.edu/studentconduct/student-handbook/](http://web.uri.edu/studentconduct/student-handbook/).  If you must come in late, please do not disrupt the class.  Please turn off all cell phones, e-watches, or any electronic devices.

## Academic Honesty
Students are expected to be honest in all academic work. A student’s name on any written work, quiz or exam shall be regarded as assurance that the work is the result of the student’s own independent thought and study. Work should be stated in the student’s own words, properly attributed to its source.   Students have an obligation to know how to quote, paraphrase, summarize, cite and reference the work of others with integrity. The following are examples of academic dishonesty.

* Using material, directly or paraphrasing, from published sources (print or electronic) without appropriate citation

* Claiming disproportionate credit for work not done independently

* Unauthorized possession or access to exams

* Unauthorized communication during exams

* Unauthorized use of another’s work or preparing work for another student

* Taking an exam for another student

* Altering or attempting to alter grades

* The use of notes or electronic devices to gain an unauthorized advantage during exams

* Fabricating or falsifying facts, data or references

* Facilitating or aiding another’s academic dishonesty

* Submitting the same paper for more than one course without prior approval from the instructors.

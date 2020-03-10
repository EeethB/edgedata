(1) Each program with a .SAS extension has a corresponding .TXT file.  

The .SAS and .TXT files are identical. The .TXT files are provided to make 
the SAS programs easier to view with some text editors. 

File names are case sensitive on some computing platforms, and software 
modules assume that file names are upper case (e.g., AGESEXV6.SAS).

---------------------

(2) The two transport files (each with extension .TRN) contain the format 
library and model coefficients dataset. 

The transport files may be used on any SAS® version 9 platform after 
uploading them and converting them using SAS® PROC CIMPORT. Program 
IMPORT.SAS is provided as an example.

If your computing platform is z/OS, both transport files should be uploaded 
using the following parameters:  RECFM(F or FB) LRECL(80) BLKSIZE(8000).

---------------------

(3) Contents:

Program components (SAS code):

1.	AGESEXV6.SAS
2.	I0V05ED3.SAS
3.	SCOREV4.SAS
4.	V05128H1.SAS
5.	V05128L1.SAS
6.	V0519F3M.SAS
7.	V0519F3P.SAS – main program

Text versions of program components (ASCII text):

8.	AGESEXV6.TXT
9.	I0V05ED3.TXT
10.	SCOREV4.TXT
11.	V05128H1.TXT
12.	V05128L1.TXT
13.	V0519F3M.TXT
14.	V0519F3P.TXT

Calibration coefficients (SAS transport file):

15.	C0516P1.TRN

Diagnosis-to-CC crosswalks (SAS transport file containing SAS formats):

16.	H0520F1.TRN

Text versions of diagnosis-to-CC crosswalks:

17.  H0520F1.FY 2019 ICD10.TXT
18.  H0520F1.FY 2020 ICD10.TXT
19.  H0520F1_ICD10_MCE_AGE.TXT
20.  H0520F1_ICD10_MCE_SEX.TXT
21.  H0520F1_ICD10_BUNDLED_MOTHER.TXT
22.  H0520F1_ICD10_BUNDLED_INFANT.TXT
23.  H0520F1_HCPCS.5_3.1911.TXT
24.  H0520F1_NDC.5_3.1911.TXT

Sample program to read SAS transport files (SAS and text versions):

25.	IMPORT.SAS
26.	IMPORT.TXT

Documentation:

27.	Word file for this release
28.	Excel file for this release

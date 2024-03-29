(1) Each program with a .SAS extension has a corresponding .TXT file.  

The .SAS and .TXT files are identical. The .TXT files are provided to make 
the SAS programs easier to view with some text editors. 

File names are case sensitive on some computing platforms, and software 
modules assume that file names are upper case (e.g., AGESEXV6.SAS).

---------------------

(2) The two transport files (each with extension .TRN) contain the format 
library and model coefficients dataset. 

The transport files may be used on any SAS� version 9 platform after 
uploading them and converting them using SAS� PROC CIMPORT. Program 
IMPORT.SAS is provided as an example.

If your computing platform is z/OS, both transport files should be uploaded 
using the following parameters:  RECFM(F or FB) LRECL(80) BLKSIZE(8000).

---------------------

(3) Contents:

Program components (SAS code):

1.	AGESEXV6.SAS
2.	I0V07ED1.SAS
3.	SCOREV4.SAS
4.	V07141H1.SAS
5.	V07141L1.SAS
6.	CY21M07B.SAS
7.	CY21P07B.SAS � main program

Text versions of program components (ASCII text):

8.	AGESEXV6.TXT
9.	I0V07ED1.TXT
10.	SCOREV4.TXT
11.	V07141H1.TXT
12.	V07141L1.TXT
13.	CY21M07B.TXT
14.	CY21P07B.TXT

Calibration coefficients (SAS transport file):

15.	CY21C07A.TRN

Diagnosis-to-CC crosswalks (SAS transport file containing SAS formats):

16.	CY21F07B.TRN

Text versions of diagnosis-to-CC crosswalks:

17.  CY21F07B_FY2021_ICD10.TXT
18.  CY21F07B_FY2022_ICD10.TXT
19.  CY21F07B_ICD10_MCE_AGE.TXT
20.  CY21F07B_ICD10_MCE_SEX.TXT
21.  CY21F07B_ICD10_BUNDLED_MOTHER.TXT
22.  CY21F07B_ICD10_BUNDLED_INFANT.TXT
23.  CY21F07B_HCPCS7_3_21_10.TXT
24.  CY21F07B_NDC7_3_21_10.TXT

Sample program to read SAS transport files (SAS and text versions):

25.	IMPORT.SAS
26.	IMPORT.TXT

Documentation:

26.	Word file for this release
27.	Excel file for this release

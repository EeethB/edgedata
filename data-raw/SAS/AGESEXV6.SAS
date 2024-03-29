 %macro AGESEXV6;
 %**********************************************************************
 1  MACRO NAME:     AGESEXV6
 2  PURPOSE:        create 0/1 age/sex demographic variables:
                    30 M/F x AGE_LAST cells, and 2 infant Male markers:

 MAGE_LAST_0_0   MAGE_LAST_1_1   MAGE_LAST_2_4   MAGE_LAST_5_9   MAGE_LAST_10_14
 MAGE_LAST_15_20 MAGE_LAST_21_24 MAGE_LAST_25_29 MAGE_LAST_30_34 MAGE_LAST_35_39
 MAGE_LAST_40_44 MAGE_LAST_45_49 MAGE_LAST_50_54 MAGE_LAST_55_59 MAGE_LAST_60_GT
 FAGE_LAST_0_0   FAGE_LAST_1_1   FAGE_LAST_2_4   FAGE_LAST_5_9   FAGE_LAST_10_14
 FAGE_LAST_15_20 FAGE_LAST_21_24 FAGE_LAST_25_29 FAGE_LAST_30_34 FAGE_LAST_35_39
 FAGE_LAST_40_44 FAGE_LAST_45_49 FAGE_LAST_50_54 FAGE_LAST_55_59 FAGE_LAST_60_GT
 Age0_Male       Age1_Male

 Note: AGE_LAST is basis of age/sex cells, *NOT* age based on DOB

 Note: There is no ICD9/10 logic herein
 ***********************************************************************;

 ** zero age/sex cells **;
 do i=1 to dim(_AGE_SEX);
  _AGE_SEX(i)=0;
 end;

 ** upper case imposed in main macro, M/F/1/2 acceptable **;
 if SEX in("M","1") then do;
  select;
   when (      AGE_LAST =   0) do;
                               MAGE_LAST_0_0   = 1;
                               Age0_Male       = 1;
   end;
   when (      AGE_LAST =   1) do;
                               MAGE_LAST_1_1   = 1;
                               Age1_Male       = 1;
   end;
   when ( 2 <= AGE_LAST <=  4) MAGE_LAST_2_4   = 1;
   when ( 5 <= AGE_LAST <=  9) MAGE_LAST_5_9   = 1;
   when (10 <= AGE_LAST <= 14) MAGE_LAST_10_14 = 1;
   when (15 <= AGE_LAST <= 20) MAGE_LAST_15_20 = 1;
   when (21 <= AGE_LAST <= 24) MAGE_LAST_21_24 = 1;
   when (25 <= AGE_LAST <= 29) MAGE_LAST_25_29 = 1;
   when (30 <= AGE_LAST <= 34) MAGE_LAST_30_34 = 1;
   when (35 <= AGE_LAST <= 39) MAGE_LAST_35_39 = 1;
   when (40 <= AGE_LAST <= 44) MAGE_LAST_40_44 = 1;
   when (45 <= AGE_LAST <= 49) MAGE_LAST_45_49 = 1;
   when (50 <= AGE_LAST <= 54) MAGE_LAST_50_54 = 1;
   when (55 <= AGE_LAST <= 59) MAGE_LAST_55_59 = 1;
   when (60 <= AGE_LAST      ) MAGE_LAST_60_GT = 1;
   otherwise;
  end;
 end;

 else if SEX in("F","2") then do;
  select;
   when (      AGE_LAST =   0) FAGE_LAST_0_0   = 1;
   when (      AGE_LAST =   1) FAGE_LAST_1_1   = 1;
   when ( 2 <= AGE_LAST <=  4) FAGE_LAST_2_4   = 1;
   when ( 5 <= AGE_LAST <=  9) FAGE_LAST_5_9   = 1;
   when (10 <= AGE_LAST <= 14) FAGE_LAST_10_14 = 1;
   when (15 <= AGE_LAST <= 20) FAGE_LAST_15_20 = 1;
   when (21 <= AGE_LAST <= 24) FAGE_LAST_21_24 = 1;
   when (25 <= AGE_LAST <= 29) FAGE_LAST_25_29 = 1;
   when (30 <= AGE_LAST <= 34) FAGE_LAST_30_34 = 1;
   when (35 <= AGE_LAST <= 39) FAGE_LAST_35_39 = 1;
   when (40 <= AGE_LAST <= 44) FAGE_LAST_40_44 = 1;
   when (45 <= AGE_LAST <= 49) FAGE_LAST_45_49 = 1;
   when (50 <= AGE_LAST <= 54) FAGE_LAST_50_54 = 1;
   when (55 <= AGE_LAST <= 59) FAGE_LAST_55_59 = 1;
   when (60 <= AGE_LAST      ) FAGE_LAST_60_GT = 1;
   otherwise;
  end;
 end;
 %mend AGESEXV6;

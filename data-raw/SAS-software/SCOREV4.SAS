 %macro SCOREV4(MODEL);
 %***********************************************************************
 MACRO NAME:    SCOREV4
 PURPOSE:       Compute risk scores, one for each metal level
                Compute cost sharing reduction (CSR) adjusted risk scores,
                 one for each metal level
                Generate ONE official risk score and ONE official CSR 
                 adjusted risk score per enrollee 
 COMMENT:       Parameter MODEL in(ADULT,CHILD,INFANT)

 Note: CSR_INDICATORs might vary by model (A/C/I) in future

 Note: There is no ICD10 logic herein

 ***********************************************************************;

 %let INITIAL = %substr(&MODEL,1,1);

 ** zero scores **;
 do i=1 to dim(_&MODEL._SCORES);
  _&MODEL._SCORES(i)=0;
 end;

 do i=1 to dim(_&MODEL._VARIABLES);
  SCORE_&MODEL._PLATINUM     = SCORE_&MODEL._PLATINUM     +
   (_&MODEL._COEFFICIENTS_&INITIAL.P(i) * _&MODEL._VARIABLES(i));
  SCORE_&MODEL._GOLD         = SCORE_&MODEL._GOLD         +
   (_&MODEL._COEFFICIENTS_&INITIAL.G(i) * _&MODEL._VARIABLES(i)); 
  SCORE_&MODEL._SILVER       = SCORE_&MODEL._SILVER       +
   (_&MODEL._COEFFICIENTS_&INITIAL.S(i) * _&MODEL._VARIABLES(i)); 
  SCORE_&MODEL._BRONZE       = SCORE_&MODEL._BRONZE       +
   (_&MODEL._COEFFICIENTS_&INITIAL.B(i) * _&MODEL._VARIABLES(i)); 
  SCORE_&MODEL._CATASTROPHIC = SCORE_&MODEL._CATASTROPHIC +
   (_&MODEL._COEFFICIENTS_&INITIAL.C(i) * _&MODEL._VARIABLES(i));
 end;

 ** cost sharing reduction adjusted risk scores, one for each metal level **;
 CSR_ADJ_SCR_&MODEL._PLATINUM     = SCORE_&MODEL._PLATINUM;
 CSR_ADJ_SCR_&MODEL._GOLD         = SCORE_&MODEL._GOLD;
 CSR_ADJ_SCR_&MODEL._SILVER       = SCORE_&MODEL._SILVER;
 CSR_ADJ_SCR_&MODEL._BRONZE       = SCORE_&MODEL._BRONZE;
 CSR_ADJ_SCR_&MODEL._CATASTROPHIC = SCORE_&MODEL._CATASTROPHIC;

 ** CSR adjustments for all code points and A/C/I, cast to be table-driven in future **;
 select;
  ** adult **;
  when ("&INITIAL"="A") do;
   select;
    when (CSR_INDICATOR= 1 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 2 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 3 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.00;
    when (CSR_INDICATOR= 4 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 5 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR= 6 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 7 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR= 8 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 9 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR=10 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=11 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR=12 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=13 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    otherwise;
   end;
  end;
  ** child **;
  when ("&INITIAL"="C") do;
   select;
    when (CSR_INDICATOR= 1 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 2 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 3 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.00;
    when (CSR_INDICATOR= 4 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 5 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR= 6 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 7 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR= 8 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 9 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR=10 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=11 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR=12 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=13 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    otherwise;
   end;
  end;
  ** infant **;
  when ("&INITIAL"="I") do;
   select;
    when (CSR_INDICATOR= 1 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 2 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 3 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.00;
    when (CSR_INDICATOR= 4 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 5 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR= 6 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR= 7 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR= 8 and METAL="P") CSR_ADJ_SCR_&MODEL._PLATINUM=SCORE_&MODEL._PLATINUM*1.00;
    when (CSR_INDICATOR= 9 and METAL="G") CSR_ADJ_SCR_&MODEL._GOLD    =SCORE_&MODEL._GOLD    *1.07;
    when (CSR_INDICATOR=10 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=11 and METAL="B") CSR_ADJ_SCR_&MODEL._BRONZE  =SCORE_&MODEL._BRONZE  *1.15;
    when (CSR_INDICATOR=12 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    when (CSR_INDICATOR=13 and METAL="S") CSR_ADJ_SCR_&MODEL._SILVER  =SCORE_&MODEL._SILVER  *1.12;
    otherwise;
   end;
  end;
  otherwise;
 end;

 ** generate ONE risk score and ONE CSR adjusted risk score per enrollee **;
 ** note there is no metal suffix in this set of variables               **;
 select;
  when (METAL="P") do;
   SCORE_&MODEL = SCORE_&MODEL._PLATINUM; 
   CSR_ADJ_SCR_&MODEL = CSR_ADJ_SCR_&MODEL._PLATINUM;
  end;
  when (METAL="G") do;
   SCORE_&MODEL = SCORE_&MODEL._GOLD; 
   CSR_ADJ_SCR_&MODEL = CSR_ADJ_SCR_&MODEL._GOLD;
  end;
  when (METAL="S") do;
   SCORE_&MODEL = SCORE_&MODEL._SILVER; 
   CSR_ADJ_SCR_&MODEL = CSR_ADJ_SCR_&MODEL._SILVER;
  end;
  when (METAL="B") do;
   SCORE_&MODEL = SCORE_&MODEL._BRONZE; 
   CSR_ADJ_SCR_&MODEL = CSR_ADJ_SCR_&MODEL._BRONZE;
  end;
  when (METAL="C") do;
   SCORE_&MODEL = SCORE_&MODEL._CATASTROPHIC;
   CSR_ADJ_SCR_&MODEL = CSR_ADJ_SCR_&MODEL._CATASTROPHIC;
  end;
  otherwise;
 end;
 %mend SCOREV4;

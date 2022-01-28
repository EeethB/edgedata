** Model coefficients **;
FILENAME INC     "user defined location of transport file CY21C07A.TRN";
LIBNAME  INCOEF  "user defined location for creation of coefficient file";

proc cimport infile=INC data=INCOEF.Coefficients; run;

** Format library **;
FILENAME INF     "user defined location of transport file CY21F07B.TRN";
LIBNAME LIBRARY  "user defined location for creation of format library";

proc cimport infile=INF library=LIBRARY; run;

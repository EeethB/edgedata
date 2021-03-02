# EDGE DIY Data

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/EeethB/edgedata.svg?branch=main)](https://travis-ci.org/EeethB/edgedata)
<!-- badges: end -->

## Installation

`edgedata` can be installed from CRAN:

```
install.packages("edgedata")
```

You can also get the development version from Github:

```
remotes::install_github("EeethB/edgedata")
```

## Summary

An R package containing the data that supports the CMS External Data Gathering Environment (EDGE) Server DIY algorithm

## Background

When the Patient Protection and Affordable Care Act (PPACA, often just ACA, or Obamacare) was passed, health insurance issuers could no longer vary individual or small group premiums at the individual or group level due to risk. Thus if an issuer attracted greater than average risk, they would have to raise premiums for their entire individual and/or small group block, which would then push healthier members away, further increasing premiums. This is known as adverse selection.

The risk adjustment (RA) program was implemented to mitigate the risk of adverse selection. In RA, issuers with lower than average risk are required to transfer funds to issuers with higher than average risk. The total money transferred is budget-neutral so that there will always be enough money for the transfers. In order to calculate relative risk, issuers need a way to submit their enrollment, premium, and claims data to the federal government.

The Centers for Medicare and Medicaid Services (CMS) requires that issuers maintain an External Data Gathering Environment (EDGE) Server for RA. Data on the EDGE Servers is used to ultimately calculate the RA transfer payments. In order for issuers to QA EDGE submissions and to have a more transparent process to troubleshoot, CMS provides the EDGE DIY software, which allows issuers to calculate their risk score separately from the normal EDGE process.

The software is provided only in SAS format, and this package is the start of implementing it in R. This package provides the datasets used to support the DIY software.

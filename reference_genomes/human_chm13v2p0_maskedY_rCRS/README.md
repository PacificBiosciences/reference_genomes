# `human_chm13v2p0_maskedY_rCRS`

## About

This is a [modified "analysis set"](https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/README.txt) version of the human CHM13 v2.0 assembly, [GCA_009914755.4](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_009914755.4/).

## Details

- This is our recommended CHM13 reference for typical variant calling applications in human samples.
- chromosome names are `chr1`, `chr2`, ..., `chrM`, `chrX`, `chrY`
- the autosomes and chrX are assembled from the CHM13 cell line
- chrY is assembled from sample HG002/NA24385
- pseudoautosomal regions (PAR) are masked to `N` on `chrY`
- mitochondrial sequence is replaced with [rCRS](https://en.wikipedia.org/wiki/Cambridge_Reference_Sequence) ([NC_012920.1](https://www.ncbi.nlm.nih.gov/nuccore/251831106))

## Annotations

PAR intervals:

```text
chrX    0           2394410     PAR1
chrX    153925834   154259566   PAR2
chrY    0           2458320     PAR1
chrY    62122809    62460029    PAR2
```

Annotations are available for pbsv. See the [README](../../README.md) for details.

---

DISCLAIMER

TO THE GREATEST EXTENT PERMITTED BY APPLICABLE LAW, THIS WEBSITE AND ITS CONTENT, INCLUDING ALL SOFTWARE, SOFTWARE CODE, SITE-RELATED SERVICES, AND DATA, ARE PROVIDED "AS IS," WITH ALL FAULTS, WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS FOR A PARTICULAR PURPOSE. ALL WARRANTIES ARE REJECTED AND DISCLAIMED. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF THE FOREGOING. PACBIO IS NOT OBLIGATED TO PROVIDE ANY SUPPORT FOR ANY OF THE FOREGOING, AND ANY SUPPORT PACBIO DOES PROVIDE IS SIMILARLY PROVIDED WITHOUT REPRESENTATION OR WARRANTY OF ANY KIND. NO ORAL OR WRITTEN INFORMATION OR ADVICE SHALL CREATE A REPRESENTATION OR WARRANTY OF ANY KIND. ANY REFERENCES TO SPECIFIC PRODUCTS OR SERVICES ON THE WEBSITES DO NOT CONSTITUTE OR IMPLY A RECOMMENDATION OR ENDORSEMENT BY PACBIO.

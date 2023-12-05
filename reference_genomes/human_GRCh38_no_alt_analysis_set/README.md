# `human_GRCh38_no_alt_analysis_set`

## About

This is a [modified "analysis set"](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/README_analysis_sets.txt) version of the human GRCh38 assembly, [GCA_000001405.15](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_000001405.15/).

## Details

- This is our recommended GRCh38/hg38 reference genome, and most of our tool development is focused on this reference.
- chromosome names are `chr1`, `chr2`, ..., `chrM`, `chrX`, `chrY`
- ALT contigs are *excluded*
- decoy sequences are *excluded*
- pseudoautosomal regions (PAR) are masked to `N` on `chrY`
- duplicated centromeric arrays are hard masked to `N` on chromosomes 5, 14, 19, 21, and 22 ([details](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/unmasked_cognates_of_masked_CEN_PAR.txt))
- mitochondrial sequence is replaced with [rCRS](https://en.wikipedia.org/wiki/Cambridge_Reference_Sequence) ([NC_012920.1](https://www.ncbi.nlm.nih.gov/nuccore/251831106))
- Epstein-Barr virus (EBV) sequence is *included* as `chrEBV`
- we hard mask all non-`ACGTN` nucleotide codes to `N`

## Annotations

PAR intervals:

```text
chrX    10001       2781479     PAR1
chrX    155701383   156030895   PAR2
chrY    10001       2781479     PAR1
chrY    56887903    57217415    PAR2
```

Annotations are available for pbsv, HiFiCNV, TRGT, and Paraphase. See the [README](../../README.md) for details.

---

DISCLAIMER

TO THE GREATEST EXTENT PERMITTED BY APPLICABLE LAW, THIS WEBSITE AND ITS CONTENT, INCLUDING ALL SOFTWARE, SOFTWARE CODE, SITE-RELATED SERVICES, AND DATA, ARE PROVIDED "AS IS," WITH ALL FAULTS, WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS FOR A PARTICULAR PURPOSE. ALL WARRANTIES ARE REJECTED AND DISCLAIMED. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF THE FOREGOING. PACBIO IS NOT OBLIGATED TO PROVIDE ANY SUPPORT FOR ANY OF THE FOREGOING, AND ANY SUPPORT PACBIO DOES PROVIDE IS SIMILARLY PROVIDED WITHOUT REPRESENTATION OR WARRANTY OF ANY KIND. NO ORAL OR WRITTEN INFORMATION OR ADVICE SHALL CREATE A REPRESENTATION OR WARRANTY OF ANY KIND. ANY REFERENCES TO SPECIFIC PRODUCTS OR SERVICES ON THE WEBSITES DO NOT CONSTITUTE OR IMPLY A RECOMMENDATION OR ENDORSEMENT BY PACBIO.

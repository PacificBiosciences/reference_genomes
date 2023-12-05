# `human_hs37d5`

## About

This is an ["analysis set"](https://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/README_human_reference_20110707) version of the human GRCh37 assembly, [GCA_000001405.5](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_000001405.5/).

## Details

- This is our recommended GRCh37/hg19 reference genome, but we recommend using GRCh38/hg38 instead.  We have generated limited resources for this reference.
- chromosome names are `1`, `2`, ..., `M`, `X`, `Y`
- ALT contigs are *excluded*
- pseudoautosomal regions (PAR) are masked to `N` on chromosome `Y`
- mitochondrial sequence is replaced with [rCRS](https://en.wikipedia.org/wiki/Cambridge_Reference_Sequence) ([NC_012920.1](https://www.ncbi.nlm.nih.gov/nuccore/251831106))
- Epstein-Barr virus (EBV) sequence is *included* as `NC_007605`
- the concatenated decoy sequences ([hs37d5cs](https://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/README_human_reference_20110707)) are _**included**_ as `hs37d5`
- we hard mask all non-`ACGTN` nucleotide codes to `N`

## Annotations

PAR intervals:

```text
X   60001       2699520     PAR1
X   154931044   155260560   PAR2
Y   10001       2649520     PAR1
Y   59034050    59363566    PAR2
```

Annotations are available for pbsv, HiFiCNV, and Paraphase. See the [README](../../README.md) for details.

---

DISCLAIMER

TO THE GREATEST EXTENT PERMITTED BY APPLICABLE LAW, THIS WEBSITE AND ITS CONTENT, INCLUDING ALL SOFTWARE, SOFTWARE CODE, SITE-RELATED SERVICES, AND DATA, ARE PROVIDED "AS IS," WITH ALL FAULTS, WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS FOR A PARTICULAR PURPOSE. ALL WARRANTIES ARE REJECTED AND DISCLAIMED. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF THE FOREGOING. PACBIO IS NOT OBLIGATED TO PROVIDE ANY SUPPORT FOR ANY OF THE FOREGOING, AND ANY SUPPORT PACBIO DOES PROVIDE IS SIMILARLY PROVIDED WITHOUT REPRESENTATION OR WARRANTY OF ANY KIND. NO ORAL OR WRITTEN INFORMATION OR ADVICE SHALL CREATE A REPRESENTATION OR WARRANTY OF ANY KIND. ANY REFERENCES TO SPECIFIC PRODUCTS OR SERVICES ON THE WEBSITES DO NOT CONSTITUTE OR IMPLY A RECOMMENDATION OR ENDORSEMENT BY PACBIO.

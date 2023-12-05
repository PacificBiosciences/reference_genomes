# Reference genomes and annotations for PacBio data

## About <a name = "about"></a>

While PacBio HiFi human data can be aligned to any reference genome, our tool development has focused on GRCh38. This repository contains a curated set of reference genomes and annotations for use with HiFi data, as well as a table describing whether corresponding annotations (BED files) have been released to support the use of a PacBio developed/compatible tool with a given reference genome. We will continue to update this repository as new reference genomes and annotations become available.

Thanks to Heng Li for his [2017 blog post](http://lh3.github.io/2017/11/13/which-human-reference-genome-to-use) on the topic of human reference genomes, which was an influence on our early decisions.

---

## Reference genomes <a name = "reference_genomes"></a>

|  | GRCh38 / hg38 | GRCh37 / hg19 | CHM13 T2T |
| :-: | :-: | :-: | :-: |
| **Name** | [`human_GRCh38_no_alt_analysis_set`](./reference_genomes/human_GRCh38_no_alt_analysis_set/README.md) | [`human_hs37d5`](./reference_genomes/human_hs37d5/README.md) | [`human_chm13v2p0_maskedY_rCRS`](./reference_genomes/human_chm13v2p0_maskedY_rCRS/README.md) |
| Download Bundle | [download tar.gz](https://downloads.pacbcloud.com/public/reference-genomes/human_GRCh38_no_alt_analysis_set.tar.2023-12-04.gz)<br/>[download md5](https://downloads.pacbcloud.com/public/reference-genomes/human_GRCh38_no_alt_analysis_set.tar.2023-12-04.gz.md5)  | [download tar.gz](https://downloads.pacbcloud.com/public/reference-genomes/human_hs37d5.tar.2023-12-04.gz)<br/>[download md5](https://downloads.pacbcloud.com/public/reference-genomes/human_hs37d5.tar.2023-12-04.gz.md5) | [download tar.gz](https://downloads.pacbcloud.com/public/reference-genomes/human_chm13v2p0_maskedY_rCRS.tar.2023-12-04.gz)<br/>[download md5](https://downloads.pacbcloud.com/public/reference-genomes/human_chm13v2p0_maskedY_rCRS.tar.2023-12-04.gz.md5) |
| **Use case** | Choose this reference to take advantage of the full suite of HiFi variant calling tools and resources.<br/><br/>**PacBio Tool development is primarily focused on the linked "no_alt analysis set" for GRCh38.** | Choose this reference if you are limited to analysis in hg19. | Choose this reference if you are interested in variation in regions poorly assembled in GRCh38. |
| [**DeepVariant**](https://github.com/google/deepvariant) | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| [**pbsv**](https://github.com/pacificbiosciences/pbsv)<br/>tandem repeat annotations | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| [**HiPhase**](https://github.com/pacificbiosciences/hiphase) | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| [**HiFiCNV**](https://github.com/pacificbiosciences/hificnv)<br/>expected CN andexcluded regions | :white_check_mark: | :white_check_mark: | :x: |
| [**TRGT**](https://github.com/pacificbiosciences/trgt)<br/>repeat definitions | :white_check_mark: | :x: | :x: |
| [**Paraphase**](https://github.com/pacificbiosciences/paraphase)<br/>defined regions  | :white_check_mark:<br/>(161 [regions](https://github.com/PacificBiosciences/paraphase/blob/main/docs/regions.md)) | :white_check_mark:<br/>(11 [regions](https://github.com/PacificBiosciences/paraphase/blob/main/docs/regions.md)) | :x: |

---

## Annotation types <a name = "annotation_types"></a>

### [Tandem repeat annotations for PBSV](https://github.com/PacificBiosciences/pbsv/tree/master/annotations)

| annotation file | description |
| --- | --- |
| `trf.bed` | Tandem repeat annotation `BED` file to increase sensitivity and recall for pbsv (e.g., `pbsv discover --tandem-repeats ref.trf.bed`). |

### [TRGT repeat definition files](https://github.com/PacificBiosciences/trgt/blob/main/docs/repeat_files.md)

The repeat definition files are `BED` files containing coordinates and structure for tandem repeat loci.  **These are currently only available for GRCh38.**

| repeat definition file | description |
| --- | --- |
| `pathogenic_repeats.bed` | 56 loci with known pathogenic expansions |
| `repeat_catalog.bed` | >170,000 loci with polymorphic repeats<br/>[source](https://github.com/Illumina/RepeatCatalogs/releases/tag/v1.0.0) |
| `adotto_repeat_catalog.bed.gz` | >900,000 tandem repeat loci<br/>[![](https://zenodo.org/badge/DOI/10.5281/zenodo.7987365.svg)](https://zenodo.org/records/7987365) |

### [HiFiCNV expected CN and excluded regions](https://github.com/PacificBiosciences/HiFiCNV/blob/main/docs/aux_data.md)

| annotation file | description |
| --- | --- |
| `expected_cn.hg38.{XX,XY}.bed` | By default, HiFiCNV expects each chromosome to have two full copies (e.g. a diploid organism). When reporting variants to the output `VCF` file, it will only report deviations from this expectation. The expectation can be overridden by providing a `BED` file with expected copy number values. Examples corresponding to XX/XY karyotypes are provided.<br/>**These are only currently available for GRCh38 and hs37d5.**
| `cnv.excluded_regions.bed.gz` | Regions that are known to cause artifacts during data processing (e.g. centromeres).<br/>**This is only currently available for GRCh38 and hs37d5.** |
| `cnv.excluded_regions.common_50.bed.gz` | Regions above, plus regions frequently called as a duplication or deletion in a population of 97 diverse samples from HPRC.<br/>**This is only currently available for GRCh38.  This is the recommended excluded regions track for human sample analysis.** |

---

## Change log <a name = "change_log"></a>

| release | change |
| --- | --- |
| 2023.12.04 | Initial commit and bundle versions. |

---

DISCLAIMER

TO THE GREATEST EXTENT PERMITTED BY APPLICABLE LAW, THIS WEBSITE AND ITS CONTENT, INCLUDING ALL SOFTWARE, SOFTWARE CODE, SITE-RELATED SERVICES, AND DATA, ARE PROVIDED "AS IS," WITH ALL FAULTS, WITH NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, NON-INFRINGEMENT OR FITNESS FOR A PARTICULAR PURPOSE. ALL WARRANTIES ARE REJECTED AND DISCLAIMED. YOU ASSUME TOTAL RESPONSIBILITY AND RISK FOR YOUR USE OF THE FOREGOING. PACBIO IS NOT OBLIGATED TO PROVIDE ANY SUPPORT FOR ANY OF THE FOREGOING, AND ANY SUPPORT PACBIO DOES PROVIDE IS SIMILARLY PROVIDED WITHOUT REPRESENTATION OR WARRANTY OF ANY KIND. NO ORAL OR WRITTEN INFORMATION OR ADVICE SHALL CREATE A REPRESENTATION OR WARRANTY OF ANY KIND. ANY REFERENCES TO SPECIFIC PRODUCTS OR SERVICES ON THE WEBSITES DO NOT CONSTITUTE OR IMPLY A RECOMMENDATION OR ENDORSEMENT BY PACBIO.

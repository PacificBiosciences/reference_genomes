#!/usr/bin/env bash
set -eu

NAME="human_GRCh38_no_alt_analysis_set"
FASTA_URL="https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz"
TR_BED_URL="https://github.com/PacificBiosciences/pbsv/raw/master/annotations/human_GRCh38_no_alt_analysis_set.trf.bed"
TRGT_PATHOGENIC_REPEATS_URL="https://raw.githubusercontent.com/PacificBiosciences/trgt/main/repeats/pathogenic_repeats.hg38.bed"  # 56 pathogenic repeats
TRGT_REPEAT_CATALOG_URL="https://raw.githubusercontent.com/PacificBiosciences/trgt/main/repeats/repeat_catalog.hg38.bed"  # 170k polymorphic repeats
TRGT_ADOTTO_REPEAT_CATALOG_URL="https://zenodo.org/records/7987365/files/adotto_repeats.hg38.bed.gz?download=1"  # 900k repeats https://github.com/ACEnglish/adotto/tree/main
HIFICNV_EXPECTED_XX_URL="https://raw.githubusercontent.com/PacificBiosciences/HiFiCNV/main/data/expected_cn/expected_cn.hg38.XX.bed"
HIFICNV_EXPECTED_XY_URL="https://raw.githubusercontent.com/PacificBiosciences/HiFiCNV/main/data/expected_cn/expected_cn.hg38.XY.bed"
HIFICNV_EXCLUDED_URL="https://github.com/PacificBiosciences/HiFiCNV/raw/main/data/excluded_regions/cnv.excluded_regions.hg38.bed.gz"
HIFICNV_EXCLUDED_COMMON_URL="https://github.com/PacificBiosciences/HiFiCNV/raw/main/data/excluded_regions/cnv.excluded_regions.common_50.hg38.bed.gz"

echo "Downloading reference fasta, decompressing as ${NAME}.fasta, and converting all non-AGCT bases to N"
curl -s "$FASTA_URL" \
    | gunzip -c \
    | sed '/^[^>]/ y/BDEFHIJKLMOPQRSUVWXYZbdefhijklmopqrsuvwxyz/NNNNNNNNNNNNNNNNNNNNNnnnnnnnnnnnnnnnnnnnnn/' \
    > "${NAME}.fasta"
echo "Indexing ${NAME}.fasta"
samtools faidx "${NAME}.fasta"
md5sum "${NAME}.fasta" > "${NAME}.fasta.md5"
# 30f1a99359a5993edbf8c8bc885825a7  human_GRCh38_no_alt_analysis_set.fasta


echo "Downloading PBSV tandem repeat BED file"
wget -qO - "$TR_BED_URL" > "${NAME}.trf.bed"
md5sum "${NAME}.trf.bed" > "${NAME}.trf.bed.md5"
# 86d75a85add01f940c4d5abc4bd596b9  human_GRCh38_no_alt_analysis_set.trf.bed


echo "Downloading TRGT tandem repeat BED files"
wget -qO - "$TRGT_PATHOGENIC_REPEATS_URL" > "${NAME}.pathogenic_repeats.bed"   # 56 pathogenic repeats
md5sum "${NAME}.pathogenic_repeats.bed" > "${NAME}.pathogenic_repeats.bed.md5"
# 06ff62717cad4320878c9f209c01b253  human_GRCh38_no_alt_analysis_set.pathogenic_repeats.bed
wget -qO - "$TRGT_REPEAT_CATALOG_URL" > "${NAME}.repeat_catolog.bed"  # 170k polymorphic repeats
md5sum "${NAME}.repeat_catolog.bed" > "${NAME}.repeat_catolog.bed.md5"
# e9402d6b02b489cb139693891e959507  human_GRCh38_no_alt_analysis_set.repeat_catolog.bed
wget -qO - "$TRGT_ADOTTO_REPEAT_CATALOG_URL" > "${NAME}.adotto_repeat_catalog.bed.gz"  # 900k repeats
md5sum "${NAME}.adotto_repeat_catalog.bed.gz" > "${NAME}.adotto_repeat_catalog.bed.gz.md5"
# 9cfe0da4028cf7f7502162ee090199e4  human_GRCh38_no_alt_analysis_set.adotto_repeat_catalog.bed.gz


echo "Downloading HiFiCNV excluded regions and expected copy number BED files"
wget -qO - "$HIFICNV_EXCLUDED_URL" > "${NAME}.excluded_regions.bed.gz" \
    && tabix -p bed "${NAME}.excluded_regions.bed.gz"
md5sum "${NAME}.excluded_regions.bed.gz" > "${NAME}.excluded_regions.bed.gz.md5"
# 39479e0d849d92fa183b55d81f55a3bb  human_GRCh38_no_alt_analysis_set.excluded_regions.bed.gz
wget -qO - "$HIFICNV_EXCLUDED_COMMON_URL" > "${NAME}.excluded_regions.common_50.bed.gz" \
    && tabix -p bed "${NAME}.excluded_regions.common_50.bed.gz"
md5sum "${NAME}.excluded_regions.common_50.bed.gz" > "${NAME}.excluded_regions.common_50.bed.gz.md5"
# bed0c06cfd1d571997976ef77300714b  human_GRCh38_no_alt_analysis_set.excluded_regions.common_50.bed.gz
wget -qO - "$HIFICNV_EXPECTED_XX_URL" > "${NAME}.expected_cn.XX.bed"
md5sum "${NAME}.expected_cn.XX.bed" > "${NAME}.expected_cn.XX.bed.md5"
# cda5604d4cc4645657cf3e5c755ccb5b  human_GRCh38_no_alt_analysis_set.expected_cn.XX.bed
wget -qO - "$HIFICNV_EXPECTED_XY_URL" > "${NAME}.expected_cn.XY.bed"
md5sum "${NAME}.expected_cn.XY.bed" > "${NAME}.expected_cn.XY.bed.md5"
# e7bf2861de660e74a27232b5a2136d9a  human_GRCh38_no_alt_analysis_set.expected_cn.XY.bed

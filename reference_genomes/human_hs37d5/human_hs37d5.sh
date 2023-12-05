#!/usr/bin/env bash
set -eu

NAME="human_hs37d5"
FASTA_URL="https://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz"
TR_BED_URL="https://github.com/PacificBiosciences/pbsv/raw/master/annotations/human_hs37d5.trf.bed"
HIFICNV_EXPECTED_XX_URL="https://raw.githubusercontent.com/PacificBiosciences/HiFiCNV/main/data/expected_cn/expected_cn.hs37d5.XX.bed"
HIFICNV_EXPECTED_XY_URL="https://raw.githubusercontent.com/PacificBiosciences/HiFiCNV/main/data/expected_cn/expected_cn.hs37d5.XY.bed"
HIFICNV_EXCLUDED_URL="https://github.com/PacificBiosciences/HiFiCNV/raw/main/data/excluded_regions/cnv.excluded_regions.hs37d5.bed.gz"

echo "Downloading reference fasta, decompressing as ${NAME}.fasta, and converting all non-AGCT bases to N"
wget -qO - "$FASTA_URL" \
    | gunzip -c \
    | sed '/^[^>]/ y/BDEFHIJKLMOPQRSUVWXYZbdefhijklmopqrsuvwxyz/NNNNNNNNNNNNNNNNNNNNNnnnnnnnnnnnnnnnnnnnnn/' \
    > "${NAME}.fasta"
echo "Indexing ${NAME}.fasta"
samtools faidx "${NAME}.fasta"
md5sum "${NAME}.fasta" > "${NAME}.fasta.md5"
# b5a9506794ce4fa471663380bdbb4a14  human_hs37d5.fasta


echo "Downloading PBSV tandem repeat BED file"
wget -qO - "$TR_BED_URL" > "${NAME}.trf.bed"
md5sum "${NAME}.trf.bed" > "${NAME}.trf.bed.md5"
# ef118d581d2b39173e96f36a957ba12f  human_hs37d5.trf.bed


echo "Downloading HiFiCNV excluded regions and expected copy number BED files"
wget -qO - "$HIFICNV_EXCLUDED_URL" > "${NAME}.excluded_regions.bed.gz" \
    && tabix -p bed "${NAME}.excluded_regions.bed.gz"
md5sum "${NAME}.excluded_regions.bed.gz" > "${NAME}.excluded_regions.bed.gz.md5"
# 6727e193668868fb1f391c6bf86542e2  human_hs37d5.excluded_regions.bed.gz
wget -qO - "$HIFICNV_EXPECTED_XX_URL" > "${NAME}.expected_cn.XX.bed"
md5sum "${NAME}.expected_cn.XX.bed" > "${NAME}.expected_cn.XX.bed.md5"
# e440881feaea96deb88110a31908a99f  human_hs37d5.expected_cn.XX.bed
wget -qO - "$HIFICNV_EXPECTED_XY_URL" > "${NAME}.expected_cn.XY.bed"
md5sum "${NAME}.expected_cn.XY.bed" > "${NAME}.expected_cn.XY.bed.md5"
# 94bdd50c46e5629ee7c6707c7d7f133d  human_hs37d5.expected_cn.XY.bed

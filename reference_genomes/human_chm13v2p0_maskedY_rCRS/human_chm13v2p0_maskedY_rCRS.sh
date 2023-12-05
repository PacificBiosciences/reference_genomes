#!/usr/bin/env bash
set -eu

NAME="human_chm13v2p0_maskedY_rCRS"
FASTA_URL="https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0_maskedY_rCRS.fa.gz"
TR_BED_URL="https://github.com/PacificBiosciences/pbsv/raw/master/annotations/human_chm13v2.0_maskedY_rCRS.trf.bed"

echo "Downloading reference fasta, decompressing as ${NAME}.fasta, and converting all non-AGCT bases to N"
curl -s "$FASTA_URL" \
    | gunzip -c \
    | sed '/^[^>]/ y/BDEFHIJKLMOPQRSUVWXYZbdefhijklmopqrsuvwxyz/NNNNNNNNNNNNNNNNNNNNNnnnnnnnnnnnnnnnnnnnnn/' \
    > "${NAME}.fasta"
echo "Indexing ${NAME}.fasta"
samtools faidx "${NAME}.fasta"
md5sum "${NAME}.fasta" > "${NAME}.fasta.md5"
# 5c7b2a0911bba97d57d30a0f8267351f  human_chm13v2p0_maskedY_rCRS.fasta


echo "Downloading PBSV tandem repeat BED file"
wget -qO - "$TR_BED_URL" > "${NAME}.trf.bed"
md5sum "${NAME}.trf.bed" > "${NAME}.trf.bed.md5"
# a340c2ba23f355aa51bc15d4a81f6b4e  human_chm13v2p0_maskedY_rCRS.trf.bed

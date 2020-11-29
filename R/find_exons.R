# create function to find the exons of any gene in homosapien
#' Title
#'
#' @param gene is a string for the gene using RefSeq IDs
#'
#' @return a dataframe of the exons, and  their positions within the genome
#'
#' @export
#'
#' @examples
#' e.g. Find the all the exons in BRCA2:
#' find_exons("NM_000059")
#'
find_exons <- function(gene) {

  # create ensembl using grch37.ensembl for homosapien
  ensembl <-
    biomaRt::useMart(
      biomart = "ENSEMBL_MART_ENSEMBL",
      host = "grch37.ensembl.org",
      path = "/biomart/martservice",
      dataset = "hsapiens_gene_ensembl"
    )

  # retrieve the exons and their positions within the genome
  exons <- biomaRt::getBM(
    attributes = c(
      'chromosome_name',
      'exon_chrom_start',
      'exon_chrom_end',
      '5_utr_start',
      '5_utr_end',
      '3_utr_start',
      '3_utr_end'
    ),
    filters = "refseq_mrna",
    values = gene,
    bmHeader = TRUE,
    mart = ensembl
  )
  return(exons)

}

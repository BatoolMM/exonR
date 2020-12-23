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
#'
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

    exons <- exons %>%
    dplyr::rename_all(
      .funs = function(.x) {
        .x %>% tolower() %>% stringr::str_replace_all(pattern = " |\\)|\\(", replacement = "_")
      }
    ) %>%
      dplyr::mutate(exon_length = exon_region_end__bp_ - exon_region_start__bp_)

  return(exons)

}

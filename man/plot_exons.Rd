% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_exons.R
\name{plot_exons}
\alias{plot_exons}
\title{Title}
\usage{
plot_exons(exons_df, exon_start, exon_end)
}
\arguments{
\item{exons_df}{a dataframe of the exons of a gene,can be calculated with find_exons function}

\item{exon_start}{a vector has the start position of the exons}

\item{exon_end}{a vector has the end position of the exons}
}
\value{
a graph has the introns and exons of a gene
}
\description{
Title
}
\examples{
BRCA2 <- find_exons("NM_000059")
graph <- plot_exons(BRCA2, BRCA2$exon_region_start__bp_, BRCA2$exon_region_end__bp_)
}

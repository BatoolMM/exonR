


plot_exons  <- function(exons_df, exon_start, exon_end) {

  d = data.frame(
    x1 = exon_start,
    x2 = exon_end,
    y1 = c(1.5, 1.5),
    y2 = c(2, 2),
    t = paste0('Exon ' , seq(1, nrow(exons_df))),
    label = paste0('Exon ' , seq(1, nrow(exons_df)))
  )
  d %>%
    ggplot2::ggplot() +
    scale_x_continuous(name = "bp") +
    scale_y_continuous(name = "") +
    geom_hline(yintercept = 1.75) +
    geom_rect(
      data = d,
      mapping = aes(
        xmin = x1,
        xmax = x2,
        ymin = y1,
        ymax = y2,
        fill = t
      ),
      color = "black"
    ) +
    geom_text_repel(data = d,
                    aes(
                      x = x1 + (x2 - x1) / 2,
                      y = 2,
                      label = label
                    ),
                    size = 4.5) +
    ylim(1.5, 7) +
    xlab("bp") +
    ylab("") +
    theme_bw() +
    theme(
      legend.position = "none",
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      axis.text.y = element_blank(),
      axis.text.x = element_text(size = 30),
      axis.ticks.length =  unit(10, "pt"),
      text = element_text(size = 30),
      panel.border = element_blank()
    )

}

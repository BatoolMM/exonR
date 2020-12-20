

library(ggplot2)
library(ggrepel)

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
    scale_x_continuous(name = "(kbp)", scales::pretty_breaks(n = 8)) +
    scale_y_continuous(name = "") +
    geom_hline(yintercept = 1.6, size=20, alpha = 0.1) +
    geom_rect(
      data = d,
      mapping = aes(
        xmin = x1,
        xmax = x2,
        ymin = 1.5,
        ymax = 1.8,
        label = label
      ),
      color = "black",
      fill = "#56B4E9"
    ) +
    ggrepel::geom_text_repel(
      data = d,
      aes(
        x = x1 + (x2 - x1) / 2,
        y = 1.8,
        label = label,
      ), size = 10,
      force_pull   = 0, # do not pull toward data points
      nudge_y      = 0.05,
      direction    = "x",
      angle        = 90,
      vjust        = 0,
      segment.size = 0.2,
    ) +
    ylim(1.5, 2.2) +
    xlab("(kbp)") +
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

  options(repr.plot.width = 70, repr.plot.height = 10)

}

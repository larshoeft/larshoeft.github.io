set.seed(1014)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  # fig.width = 6,
  # fig.asp = 2/3,
  fig.show = "hold"
)

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  # Temporarily deactivate cli output for quarto
  cli.num_colors = 0,
  cli.hyperlink = FALSE,
  pillar.bold = TRUE,
  width = 77,
  unzip = "unzip",
  # 80 -- 3for #> comment
  encoding = "UTF-8"
)

Sys.setlocale("LC_ALL", "de_DE.UTF-8")

ggplot2::theme_set(ggplot2::theme_classic(12))

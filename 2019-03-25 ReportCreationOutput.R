##############################
## Effortless report generation: Different output options
##
## Karl Cottenie
##
## 2019-04-01
##
##############################

library(rmarkdown)
library(prettydoc)

# Startup ends here

## Comment codes ------
# Coding explanations (#, often after the code, but not exclusively)
# Code organization (## XXXXX -----)
# Justification for a section of code ## XXX
# Dead end analyses because it did not work, or not pursuing this line of inquiry (but leave it in as a trace of it, to potentially solve this issue, or avoid making the same mistake in the future # (>_<) 
# Solutions/results/interpretations (#==> XXX)
# Reference to manuscript pieces, figures, results, tables, ... # (*_*)
# TODO items #TODO
# names for data frames (dfName), for lists (lsName), for vectors (vcName) (Thanks Jacqueline May)

# Code adapted from 
# https://jozefhajnala.gitlab.io/r/r913-spin-with-style/

## _ Default option to create multiple different output reports -----

## __ Produce a default html output with rmarkdown::render -----
rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_file = "./output/ex_01_render_default.html"
)

## __ Produce a minimal html output with rmarkdown::render for comparison -----
rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_format =  rmarkdown::html_document(
    theme = NULL, mathjax = NULL, highlight = NULL
  ),
  output_file = "./output/ex_02_render_minimalish.html"
)

## __ Produce html output with custom css, with external dependency ----
rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_format =  rmarkdown::html_document(
    theme = NULL, mathjax = NULL, highlight = NULL,
    css = "./css/rmarkdown_spin_css_air.css"
  ),
  output_file = "./output/ex_03_render_air_css.html"
)
#==> This is again getting complicated

## __ other html_document themes -----
# see help file for full list of available themes
rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_format =  rmarkdown::html_document(
    theme = "journal", mathjax = NULL, highlight = NULL
  ),
  output_file = "./output/ex_04_render_journal.html"
)

rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_format =  rmarkdown::html_document(
    theme = "yeti", mathjax = NULL, highlight = NULL
  ),
  output_file = "./output/ex_05_render_yeti.html"
)

## _ Lightweight  option for html files with library prettydoc -----
# check help file for all available themes
rmarkdown::render(
  "2019-03-25 ReportCreationExample.R",
  output_format =  prettydoc::html_pretty(
    theme = "cayman"
  ),
  output_file = "./output/ex_07_render_cayman.html"
)

## _ Final piece of the puzzle: a snippet to almost automate it ----

# see the snippet.R file for the annotated code
# see the r.snippet file for the same code in the snippet format
# the easiest way to use this is to
# open your system specific snippet file (~/.R/r.snippet), for instance in RStudio
# directly copy-paste the snippet you want into it, save it, and you can use it immediately.

# alternatively, open the snippet editor in Tools > Global Options > Code > Edit snippets
# if you want to use this method, make sure that every line starts with a tab
# otherwise the snippet will not work
# if you see red line starts, you do not have a tab at the start of your line

  

##############################
## snippet codes for report creation
##
## Karl Cottenie
##
## 2019-05-14
##
##############################

# The below code is the development version for the snippets code
# This makes it easier to test all the snippets, before copy-pasting to r.snippets


## _ snippet cayman

# usage: go to the console, type "cayman" and tab complete
# write the name of the script file you want to create a report from
# it will automatically create the name for the report file name
rmarkdown::render(
  "${1:file.R}",
  output_format =  prettydoc::html_pretty(
    theme = "cayman"
  ),
  output_file = "./output/${1:file}.html"
)


## _ snippet cayman.full -----

# this code identifies the last saved script file
# runs it fully and automatically creates a lightweight report with the cayman theme
# that has all figures and output

# identify the last saved script file
vcScriptNameIn = list.files(pattern = "*.R") %>%
  file.info() %>%
  {bind_cols(FileName = row.names(.), .)} %>% 
  arrange(desc(atime)) %>% 
  pull(FileName) %>% 
  .[1]

# create a new output file name, timestamped
vcScriptNameOut = paste("./output/", Sys.Date(), 
                       "_", vcScriptNameIn, ".html", sep = "")

# create the report of the full script, reproducibly produced
rmarkdown::render(vcScriptNameIn,
  output_format =  prettydoc::html_pretty(
    theme = "cayman"),
  output_file = vcScriptNameOut)

# clean up objects
rm(vcScriptNameIn, vcScriptNameOut)


## _ snippet cayman.sub -------
# code that will go into snippet to create a report from subcomponents of a script file
# the subcomponents are identified by # (*_*), for which I also created a snippet :-)
# and run until the end of the next first empty line
# since the full code will not be run, all objects need to be in the environment
# start everything of by saving the script file just before running this snippet

# identifies the relevant file
vcScriptNameIn = list.files(pattern = "*.R") %>%
  file.info() %>%
  {bind_cols(FileName = row.names(.), .)} %>% 
  arrange(desc(atime)) %>% 
  pull(FileName) %>% 
  .[1]

# reads all the lines
vcScript = vcScriptNameIn %>% 
  read_lines() 

# identifies the starting position
vcStartPr = vcScript %>% 
  stringr::str_detect("(\\*_\\*)" ) %>% 
  which()
#identifies all the empty lines
vcStopPr = vcScript %>% 
  {nchar(.) == 0} %>% 
  which()
# connects all the starting positions to the first following empty line
dfOutput = rbind(vcStartPr,
vcStartPr %>% 
  sapply( function(x) {
    {vcStopPr > x} %>% 
      which %>% 
      min %>% 
      vcStopPr[.] 
  }))

# create a temp output script file name, timestamped
vcScriptNameOut = paste(Sys.Date(), vcScriptNameIn, sep = "_")

# extract all the relevant lines that need to go into the report
apply(dfOutput, 2, function(x) vcScript[x[1]:x[2]]) %>% 
  unlist() %>% 
  write_lines(vcScriptNameOut) # create the temp file

# create a report for the temporary file
rmarkdown::render(
  vcScriptNameOut,
  output_format =  prettydoc::html_pretty(
    theme = "cayman"),
  output_file = paste("./output/", vcScriptNameOut, ".html", sep = ""))

# remove the temporary file
file.remove(vcScriptNameOut)
# remove the temporary objects
rm(vcScriptNameIn, vcScriptNameOut, vcScript, vcStartPr, vcStopPr, dfOutput)

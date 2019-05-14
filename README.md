# Effortless-Report-Creation

## Do you want to:
1. share your R output (models, figures,...) with a collaborator or advisor, but they are not familiar with R
2. share your R output (models, figures,...) with a collaborator or advisor easily and efficiently
3. code in R script files because you do not like the overhead that is created by using RMarkdown code 
4. share your R code with a collaborator or advisor, but you do not want them to rerun your time-sucking simulation models
5. work in a reproducible manner and check that your code can run as is, without errors or intervention

If your answer to at least one of these objectives is **Yes**

## Then this repository provides a way to accomplish all these goals
And you should look at the two example files in this repository
1. ReportCreationExample.R has an example of an standard analysis that performs some data exploration, creates some figures, runs some statistical tests, and has some comments.
2. ReportCreationOutput.R has several examples of how to create output directly from the script file
  - without relying on your collaborator or advisor to run your code
  - based on your script file, without converting your code into RMarkdown
  - through the mechanisms of a familiar environment, R and RStudio
  - by rerunning all your code in the background, so you and your collaborator/advisor know it is reproducible (up to a certain point)
3. You can increase the easiness and efficiency even more by creating a snippet that semi-automates all of these objectives for you. I have created several types of snippets:
  - one where you write the script file name = easiest
  - one where the snippet automatically detects the latest saved script file, and runs that completely
  - one where the snippet automatically detects the latest saved script file, but only runs subsections of the code identified by # (*_*). My usage case for this is to easily generate selected figures and/or output. The disadvantage is that all the objects need to be available in the environment, so it is not necessarily reproducible.

## What are you waiting for?

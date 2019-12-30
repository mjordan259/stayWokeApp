# stayWokeApp
user-friendly interface for running threshold tests


Note: Currently this DOES NOT run a threshold test. It only subsets the inputted dataset to records that match the following 
rules:

[reason for stop column] == [user-selected stop code] & !([contraband found column]==1 & [search conducted column]==0)

All columns and the stop code are user-inputted. In theory, this will be the dataset that is then fed into the threshold tests.

To run a Shiny App locally:

If you haven't already, you will need to run:
install.packages("shiny")

Go to the directory that holds the folder containing the three .R scripts. (For illustrative purposes, let's say you've named 
the folder 'stayWokeApp'.)
Run:

library(shiny)

runApp("stayWokeApp")

This should pop up a window with the app in it.

To run this app in particular:

Upload the .csv file you want to analyze.

Once it's uploaded, a series of drop-down and text inputs will appear. (This can take a few seconds on huge datasets.) 

Select the requested column names. Contraband Found and Serach Conducted should be columns with only values of 1 and 0.

Type in the reason for stop code you want to filter by.

Click the Run Analysis Button.

When analysis is complete, you'll see a few lines of the resulting dataframe (mostly useful for debugging, this probably 
won't stay!) and a button to download the final dataframe.

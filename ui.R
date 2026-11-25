#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Iris dataset shiny visualisation example"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          selectInput("xaxis","Select a variable to place on the x-axis",
                      names(iris)),
          selectInput("yaxis","Select a variable to place on the y-axis",
                      names(iris)),     
          numericInput("clusters","How many clusters would you like to see?",
                       value=3, min=2, max=8),
          actionButton("button","Build me clusters!")

        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("clusterPlot"),
            
            # Table styling
            tags$style("
                       #clusterTable table {
                       width: 100% !important;
                       } 
                       #clusterTable {
                       width: 100%;
                       overflow-y: auto;
                       max-height: 300px;
                       }
                       "),
            
            tableOutput("clusterTable")
        )
    )
)

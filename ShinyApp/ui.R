#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Les corrélations entre les variables quantitatives des Superhéros"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("var1", 
                        "Axe x :", 
                        choices = colnames(select(Superheroes, class, intelligence, strength, speed, durability, power, combat, height.cm, weight.kg))),
            selectInput("var2", 
                        "Axe y :", 
                        choices=colnames(select(Superheroes, class, intelligence, strength, speed, durability, power, combat, height.cm, weight.kg)))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))


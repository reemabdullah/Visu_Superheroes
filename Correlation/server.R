#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    Superheroes <- read.csv("superheroes.csv")
    output$distPlot <- renderPlot({

        ggplot(Superheroes, aes(x = .data[[input$var1]], y = .data[[input$var2]]))+
            theme_bw() +
            geom_point() +
            geom_smooth() +
            labs(title = paste("Corrélation entre", as.character(input$var1),"et", as.character(input$var2)),
                 x = as.character(input$var1),
                 y = as.character(input$var2))

    })

})

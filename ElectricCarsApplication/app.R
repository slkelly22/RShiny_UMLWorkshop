# Electric Vehicles Application
# Importing External Data

library(shiny)
library(tidyverse)

ev_data <- read_csv("https://data.wa.gov/api/views/f6w7-q2d2/rows.csv?accessType=DOWNLOAD")

# ui
ui <- fluidPage(
  titlePanel("Let's review electric vehicle data from Washington state"),
  radioButtons("car", 
               h4("Do you have an electric vehicle?"), choices = list("do", "do not", "do not yet", "never will"), selected = character(0)),
  textOutput("EVstatus"),
  dataTableOutput("dynamic")
)

# server
server <- function(input, output){
  output$EVstatus <- renderText({
    paste("You", input$car, "have an electric vehicle.")
  })
  output$dynamic <- renderDataTable(ev_data)
}

#application
shinyApp(ui, server)

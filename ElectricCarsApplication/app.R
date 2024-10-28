# Electric Vehicles Application
# Importing External Data

library(shiny)
library(tidyverse)

ev_data <- read_csv("https://data.wa.gov/api/views/f6w7-q2d2/rows.csv?accessType=DOWNLOAD")

# ui
ui <- fluidPage(
  titlePanel("Let's review this electric vehicle data"),
  dataTableOutput("dynamic")
)

# server
server <- function(input, output){
  output$dynamic <- renderDataTable(ev_data)
}

#application
shinyApp(ui, server)

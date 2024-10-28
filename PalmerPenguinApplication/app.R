# Application: Basic df with palmerpenguins

library(shiny)
library(palmerpenguins)
ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)
server <- function(input, output){
  output$static <- renderTable(head(penguins))
  output$dynamic <- renderDataTable(penguins)
}
shinyApp(ui, server)
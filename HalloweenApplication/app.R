# Savannah's Halloween Application for the R Shiny Workshop

# Simple input / output Text App
library(shiny)

candy <- c("Reese's cups", "Sour Patch Kids", "candy corn", "hot dogs", "chocolate", "not any of those options", "none, I'm on a diet")

ui <- fluidPage(
  titlePanel("Halloween Time!"), 
  textInput("name", "Hello, what is your name?"), 
  radioButtons("candy", 
               h4("In your opinion, what's the best Halloween treat?"), choices = candy, selected = character(0)),
               #choices = list("Reese's cups", "Sour Patch kids", "candy corn", "not any of those options"), selected = character(0)), 
  dateInput("date", "What day is Halloween?"), 
  textOutput("helpme")
)

server <- function(input, output){
  output$helpme <- renderText({
    paste("I hope you dressed up for Halloween, ", input$name, "!", "Your preferred Halloween candy is ", input$candy, ".", " Yes, Halloween was ", input$date, ".")
  })
}

shinyApp(ui, server) 


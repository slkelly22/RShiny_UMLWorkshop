# Creating an Application with a Plot using the Gapminder data

library(shiny)
library(tidyverse)
library(gapminder)

# adding a logged var to the df so we can plot it directly rather than taking the log of the var in the plot
gapminder$logGDP <- log(gapminder$gdpPercap)

ui <- fluidPage(
  titlePanel("Gapminder Data"), 
  sidebarLayout(
    sidebarPanel(
      textOutput("justtext"), 
      tableOutput("data")
    ), 
    mainPanel(
      plotOutput("plot", width = "1000px", click = "plot_click") 
    )
  )
)


server <- function(input, output) { 
  
  output$justtext <- renderText({
    "Hi Everyone! Let's explore the Gapminder Data by clicking on the points in the plot and retrieving the corresponding data rows."
  })
  
  output$plot <- renderPlot(
    ggplot(gapminder, aes(x = logGDP, y = lifeExp, color = continent)) + geom_point() + facet_wrap(vars(year)) + labs(title = "Gapminder Data", x = "GDP per capita (logged)", y = "Life Expectancy", color = "Continent")
  )
 
  output$data <- renderTable({
    req(input$plot_click)
    nearPoints(gapminder, input$plot_click)
  })
}

shinyApp(ui, server)

# plotOutput("plot", width = "800px", click = "plot_click"), 
# verbatimTextOutput("info")

# output$info <- renderPrint({
# req(input$plot_click)
# x <- round(input$plot_click$x, 2)
# y <- round(input$plot_click$y, 2)
# cat("[", x, ", ", y, "]", sep = "")

#ui <- fluidPage(
 # titlePanel("Gapminder Data"), 
  # textOutput("justtext"),
  # plotOutput("plot", width = "1000px", click = "plot_click"), 
  # tableOutput("data")
# )


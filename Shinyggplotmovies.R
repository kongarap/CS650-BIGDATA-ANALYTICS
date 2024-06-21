# Load required libraries
library(shiny)
library(shinythemes)
library(ggplot2)

# Set working directory
setwd("C:/Users/konga/Downloads")

# Load dataset
movies <- read.csv("movierating.csv")
dataset <- movies

# Define UI
ui <- fluidPage(
  theme = shinytheme('united'), # Cute grey & blue color scheme
  
  headerPanel("Movies Reviews"),
  
  sidebarPanel(
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1, nrow(dataset)), step=5, round=0),
    
    # Names refer to the column names of the dataset, all of them
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)

# Define server logic
server <- function(input, output) {
  dataset <- reactive({
    movies[sample(nrow(movies), input$sampleSize),]
  })
  
  output$plot <- renderPlot({
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    print(p)
  }, height=400)
}

# Run the app
shinyApp(ui = ui, server = server)

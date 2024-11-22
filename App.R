#This Shiny app uses the mtcars dataset from the datasets package. The app allows users to explore and analyze the dataset by filtering cars based on their attributes (e.g., MPG, number of cylinders, and horsepower), comparing metrics using a plot, and visualizing results in an interactive table
# Load necessary libraries
library(shiny)
library(DT)

# Define the UI
ui <- fluidPage(
  titlePanel("MTCars Dataset Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Filter Options"),
      sliderInput("mpg", "Miles Per Gallon (MPG):", 
                  min = min(mtcars$mpg), max = max(mtcars$mpg), 
                  value = c(min(mtcars$mpg), max(mtcars$mpg))),
      sliderInput("hp", "Horsepower (HP):", 
                  min = min(mtcars$hp), max = max(mtcars$hp), 
                  value = c(min(mtcars$hp), max(mtcars$hp))),
      checkboxGroupInput("cyl", "Cylinders:",
                         choices = unique(mtcars$cyl),
                         selected = unique(mtcars$cyl)),
      
      h4("Plot Options"),
      selectInput("xvar", "X-axis Variable:",
                  choices = names(mtcars), selected = "mpg"),
      selectInput("yvar", "Y-axis Variable:",
                  choices = names(mtcars), selected = "hp"),
      
      h4("Table Options"),
      downloadButton("downloadData", "Download Filtered Data")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Table",
                 textOutput("carCount"),
                 DT::dataTableOutput("filteredTable")),
        tabPanel("Plot",
                 plotOutput("scatterPlot"))
      )
    )
  )
)

# Define the server
server <- function(input, output) {
  # Reactive filtering of the data
  filteredData <- reactive({
    mtcars %>%
      subset(mpg >= input$mpg[1] & mpg <= input$mpg[2]) %>%
      subset(hp >= input$hp[1] & hp <= input$hp[2]) %>%
      subset(cyl %in% input$cyl)
  })
  
  # Display the number of results
  output$carCount <- renderText({
    paste("We found", nrow(filteredData()), "cars matching your criteria.")
  })
  
  # Render the filtered table
  output$filteredTable <- DT::renderDataTable({
    datatable(filteredData(), options = list(pageLength = 10))
  })
  
  # Download the filtered data
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("filtered-mtcars-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filteredData(), file, row.names = FALSE)
    }
  )
  
  # Render the scatter plot
  output$scatterPlot <- renderPlot({
    plot(filteredData()[[input$xvar]], filteredData()[[input$yvar]],
         xlab = input$xvar, ylab = input$yvar, pch = 19,
         col = "blue", main = "Scatter Plot")
  })
}

# Run the app
shinyApp(ui, server)


### for example see: http://shiny.rstudio.com/tutorial/written-tutorial/lesson1/


library(shiny)

# UI Section --------------------------------------------------------------

ui <- fluidPage(
  
  # App title ----
  titlePanel("HR Demographics Dashboard"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Input: Slider for the number of bins ----
    sliderInput(inputId = "bins",
                label = "Number of bins:",
                min = 1,
                max = 50,
                value = 30)
    
  ),

    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)


# Server Section ----------------------------------------------------------

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  # Note: Within the app server function is only looking locally so 
  d <- read.csv('./Final_Turnover_Data_CSV.csv', header = T, stringsAsFactors = F)
  
  output$distPlot <- renderPlot({
    
    x    <- d$age
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Age",
         main = "Associate Age Distribution")
    
  })
  
}


# Shiny App Section -------------------------------------------------------


shinyApp(ui = ui, server = server)
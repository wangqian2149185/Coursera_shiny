

library(shiny)
library(ggplot2)
df <- datasets::mtcars
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Presentation relationship between mpg and hp"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("horsepower",
                   "Gross HorsePower:",
                   min = min(df$hp),
                   max = max(df$hp),
                   value = mean(df$hp)),
       checkboxInput("showModel","Show/Hide Model",value = TRUE),
       checkboxInput("showPred", "Show/Hide predict point",value =TRUE),
       checkboxInput("showData", "Show/Hide data set points",value =TRUE),
       checkboxInput("fun_botton","Have fun!", value=FALSE),
       h4("This is an application that can predict the car miles per gallon (mpg) based on the gross horsepower (hp). Slide the button to pick up the hp your want to use. The red dot will be the prediction with the exact number showing at the bottom textbox.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h3("Predicted mpg value from the model:"),
       textOutput("Pred"),
       h3("The fun is: "),
       textOutput("fun")
       
    )
  )
))

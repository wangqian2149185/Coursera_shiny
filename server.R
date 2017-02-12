

library(shiny)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        df <- datasets::mtcars
        model <- lm(formula = mpg~hp,data = df)
        modelpred <- reactive({
                modelInput <- input$horsepower
                predict(model,newdata = data.frame(hp=modelInput))
        })
        
  output$distPlot <- renderPlot({
    modelInput <- input$horsepower
    if(input$showData){
            plot(df$hp, df$mpg,xlab = "Gross horsepower",ylab = "Miles per hour")
    }
    
    if(input$showPred){
            points(modelInput,modelpred(),col="red",pch=16,cex=2)
    }
    
    if(input$showModel){
            abline(model,col = "blue",lwd =1.5)
    }
    if(input$fun_botton){
            funText <- "I want you!"
    }
    else {funText <- ""}
    output$Pred <- renderText({modelpred()})
    output$fun <- renderText({funText})
  })
  
})

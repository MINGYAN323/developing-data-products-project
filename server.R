library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  model <- reactive({
    lm(as.formula(paste("mpg ~", input$predictor)), data = mtcars)
  })
  
  output$summary <- renderPrint({
    summary(model())
  })
  
  output$plot <- renderPlot({
    ggplot(mtcars, aes_string(x = input$predictor, y = "mpg")) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE) +
      labs(title = paste("mpg vs", input$predictor),
           x = input$predictor,
           y = "mpg")
  })
})
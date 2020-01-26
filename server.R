library(shiny)
library(UsingR)
data(iris)
shinyServer(function(input, output) {
        model1 <- lm(Sepal.Width ~ Sepal.Length, data = iris)

        model1pred <- reactive({
                sepalInput <- input$Lgth
                predict(model1, newdata = data.frame(Sepal.Length = sepalInput))

        })
                
        output$text1 <- renderText({
                "General Information"
        })
        output$text4 <- renderText({
                "This app uses the Iris dataset. It analyses the relationship between sepal width and sepal lenght of the 150 plants observed."
        })
                output$text2 <- renderText({
                "Histogram Description"
        })
        output$text3 <- renderText({
                "In the Histogram tab it is shown the distribution of the 150 plants based on the sepal length. 
                Depending on the sepal lenght selected in the slider a line will move showing the selection and 
                the MSE for the value selected.
The mean squared error (MSE) measures the average squared difference between the estimated 
                values and the actual value."
        })
        output$text5 <- renderText({
                "Line Chart Description"
        })
        output$text6 <- renderText({
                "In the Line Chart tab it is shown the relationship between sepal width and sepal length. 
                Depending on the sepal lenght selected in the slider, a value will be predicted for the sepal width. 
                The prediction is been done with a linear regression model"
                
        })
        
        output$newHist <- renderPlot({      
                hist(iris$Sepal.Length, xlab='Sepal.Length', col='lightblue',main='Histogram')      
                Lgth <- input$Lgth      
                lines(c(Lgth, Lgth), c(0, 200),col="red",lwd=5)      
                mse <- mean((iris$Sepal.Length - Lgth)^2)      
                text(7.5, 25, paste("Lgth = ", Lgth))      
                text(7.5, 23, paste("MSE = ", round(mse, 2)))      
        })
        
        
        output$plot1 <- renderPlot({
                sepalInput <- input$Lgth
                        
                        plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Sepal.Length", 
                             ylab = "Sepal.Width", bty = "n", pch = 16)
                        
                        
                        abline(model1, col = "red", lwd = 2)
                        
               
                        points(sepalInput, model1pred(), col = "red", pch = 16, cex = 2)
                        
                                           
        })
        output$pred1 <- renderText({
                model1pred()
        })

})



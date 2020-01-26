library(shiny)
shinyUI(fluidPage(
        titlePanel("Assignment Number 4: App with Shiny"),
        sidebarLayout(
                sidebarPanel(
                        helpText("Selection Pane"),
                        tags$head(tags$style("#text1{color: black;
                             font-size: 20px;
                                             font-style: bold;
                                             }")),
                        tags$head(tags$style("#text2{color: black;
                                font-size: 20px;
                                             font-style: bold;
                                             }"))
                        ,
                        tags$head(tags$style("#text5{color: black;
                                font-size: 20px;
                                             font-style: bold;
                                             }")),
                        
                        sliderInput('Lgth', 'What is the Sepal Lenght?',value = 5, min = 4, max = 8, step = 0.1)
                        ),
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Documentation ", br(), textOutput("text1"), textOutput("text4"), textOutput("text2")
                                             , textOutput("text3"),textOutput("text5"),textOutput("text6")), 
                                    tabPanel("Histogram", br(), plotOutput('newHist')),
                                    tabPanel("Line Chart", br(),plotOutput("plot1"),
                                             h4("Predicted Sepal Width"),textOutput("pred1") )
                                    
                        )
                )
        )
))
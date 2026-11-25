#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  plot_data <- reactive({
    iris %>% select(input$xaxis,input$yaxis)
  })
  
  clusters <- reactive({
    kmeans(plot_data(), centers = input$clusters)
  })
  
  output$clusterPlot <- renderPlot({
    
    palette(c("#E41A1C","#377EB8","#4DAF4A","#984EA3", "#B94AE2",
              "#FF7F00","#FFFF33","#A65628","#F781BF","#999999"))
    
    plot(plot_data(),
         col=clusters()$cluster,
         pch = 20, cex = 3)
    
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    title("Clustering the Iris dataset")
  })
  
  output$clusterTable <- renderTable({
    
    bind_cols(iris,Cluster=clusters()$cluster)
  })
  

}

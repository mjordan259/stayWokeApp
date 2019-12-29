options(shiny.maxRequestSize=100*1024^2)

server <- function(input, output) {

  
  # read in the data as a reactive object
  getData <- reactive({
    
    inFile <- input$file1
    
    if (is.null(input$file1))
      return(NULL)
    
    read.csv(inFile$datapath)
    
  })
  
  # Set column names as necessary
  output$stopCol <- renderUI({
    req(getData())
    selectInput("stopCol", label = "Column With Stop Reason",choices = names(getData()))
  })
  
  output$searchCond <- renderUI({
    req(getData())
    selectInput("searchCond", label = "Search Conducted Column",choices = names(getData()))
  })
  
  output$contraFound <- renderUI({
    req(getData())
    selectInput("contraFound", label = "Contraband Found Column",choices = names(getData()))
  })
  
   output$stopCode <- renderUI({
     req(getData(),input$stopCol)
     textInput("stopCode", label = "Identify Traffic Stop Code")
   })
  
  
  #subset data to the rows we're interested in
  # this only happens once the user had clicked the run analysis button
  rel.Data <- eventReactive(input$analysisGo, {
    subset(getData(), getData()[input$stopCol] == input$stopCode & !(getData()[input$contraFound]==1 & getData()[input$searchCond]==0))
  })
  
  #run the analysis
  
  # show the first ten rows of the output to show that it's all done
  output$contents <- renderTable(
    
    head(rel.Data(),10)
    
  )
  
  # Downloadable output
  
  output$downloadData <- renderUI({
    req(rel.Data())
    downloadButton("downloadData01","Download Data")
  })
  
  
  output$downloadData01 <- downloadHandler(
    filename = function() { 
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(rel.Data(), file)
    }
  )
  
}
ui <- fluidPage(
  titlePanel(""),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Upload data to run a threshold test"),
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
                multiple = FALSE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      #Conduct Analysis
      actionButton("analysisGo", label = "Run Analysis"),
      
      # Download Data
      uiOutput("downloadData")
      
    ),
    mainPanel(uiOutput("stopCol"),
              uiOutput("stopCode"),
              uiOutput('searchCond'),
              uiOutput('contraFound'),
      
      tableOutput('contents')
      )
  )
)
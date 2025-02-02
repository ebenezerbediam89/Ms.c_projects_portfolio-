##############################################################################################
# Predictive modelling of the performance of Cameroonian companies was carried out as part,  #
# of the master's thesis in Mathematical Modelling for Economics and Finance as part of the  #
# CETIC project at the École Normale Supérieure Polytechnique of Yaoundé.                    #
#                                                                                            #
# Ebenezer Bediam Nonbo(1*), Georges Nguefack Tsague(2), Desire Avom(3)                      #
# (1*)CETIC, National Advanced School of Engineering of Yaoundé, University of Yaoundé I     #
# (2) Faculty of Medicine and Biomedical Sciences, University of Yaoundé I                   #
# (3) Faculty of Economics and Management, University of Yaoundé II                          #
# *ebenezerbediam@yahoo.fr                                                                   #
##############################################################################################


# Import libraries
library(shiny)
library(shinythemes)
library(data.table)
library(RCurl)
#library(randomForest)

####################################
# User interface                   #
####################################

ui <- fluidPage(theme = shinytheme("superhero"),
                
                # Page header
                headerPanel('Annual Sales Forecast App'),
                
                # Input values
                sidebarPanel(
                  p("Enter company parameters on this panel, then click the buttom [Submit]"),
                  p("All quantitative variables are captured through their logarithms"),
                  textAreaInput("UserName",
                                label = "Company/User name:",
                                value = "",
                                width = "100%",
                                rows = 1,
                                placeholder = "Enter a name here"),
                  HTML("<h3>Input parameters</h3>"),
                  selectInput("certification", label = "Certification:", 
                              choices = list("Yes" = "yes", "No" = "no", "In process" = "in process"), 
                              selected = "in process"),
                  selectInput("region", label = "Region:", 
                              choices = list("Littoral" = "littoral", "Center" = "center", "West" = "west","Kribi" = "kribi"), 
                              selected = "littoral"),
                  selectInput("marche_principal", label = "Main market:", 
                              choices = list("International" = "international", "National" = "national", "Local" = "local"), 
                              selected = "international"),
                  selectInput("site_internet", label = "Web site:", 
                              choices = list("Yes" = "yes", "No" = "no"), 
                              selected = "yes"),
                  sliderInput("lcapital", "Capital (FCFA):",
                              min = 3.63, max = 29.85,
                              value = 15),
                  sliderInput("lcout_travail", "Labour cost (FCFA):",
                              min = 5.99, max = 24.59,
                              value = 10),
                  sliderInput("lemplyer_perm", "Number of permanent workers:",
                              min = 0, max = 8.51,
                              value = 2),
                  sliderInput("lcout_materiel", "Cost of materials (FCFA):",
                              min = 0, max = 24.92,
                              value = 8),
                  sliderInput("lachat_equipement", "Equipment purchase costs (FCFA):",
                              min = 0, max = 23.94,
                              value = 6),
                  
                  actionButton("submitbutton", "Submit", class = "btn btn-primary"),
                  # Button
                  downloadButton("downloadData", "Download your result")
                ),
                
                mainPanel(
                  tags$label(h3('Result/Output')), # Status/Output Text Box
                  verbatimTextOutput('contents'),
                  tableOutput('tabledata') # Prediction results table
                  
                )
)

####################################
# Server                           #
####################################

server <- function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
    
    input$add # triggers reactive
    UserName <-input$UserName
    lcapital <- (input$lcapital)
    lcout_travail <- (input$lcout_travail)
    lemplyer_perm <- (input$lemplyer_perm)
    lcout_materiel <- (input$lcout_materiel)
    lachat_equipement <- (input$lachat_equipement)
    CERTIFICATION <- (input$certification)
    REGION <- (input$region)
    MAIN_MARKET <- (input$marche_principal)
    WEB_SITE <- (input$site_internet)
    
    PREDICT=(0.2979*exp(lcapital) + 0.3783*exp(lcout_travail) + 0.3045*exp(lemplyer_perm) + 0.0539*exp(lcout_materiel) + 0.0232*exp(lachat_equipement))
    
    if(CERTIFICATION=="in process"& REGION== "littoral" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.3554)}
    if(CERTIFICATION=="in process"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 - 0.7455)}
    if(CERTIFICATION=="in process"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="in process"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 - 0.6251)}
    if(CERTIFICATION=="in process"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.6251)*(1 - 0.3554)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 - 0.6257)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.6257)*(1 - 0.3554)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 - 0.6257)*(1 - 0.7455)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.6257)*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 - 0.6257)*(1 - 0.6251)}
    if(CERTIFICATION=="in process"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 - 0.6257)*(1 - 0.6251)*(1 - 0.3554)}
    
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="international" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)}
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.3554)}
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.7455)}
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6251)}
    if(CERTIFICATION=="yes"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6251)*(1 - 0.3554)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)*(1 - 0.3554)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)*(1 - 0.7455)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)*(1 - 0.6251)}
    if(CERTIFICATION=="yes"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.8545)*(1 - 0.6257)*(1 - 0.6251)*(1 - 0.3554)}
    
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="international" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)}
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.3554)}
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.7455)}
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6251)}
    if(CERTIFICATION=="no"& REGION== "littoral" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6251)*(1 - 0.3554)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="international" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)*(1 - 0.3554)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)*(1 - 0.7455)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="national" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)*(1 - 0.7455)*(1 - 0.3554)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="yes"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)*(1 - 0.6251)}
    if(CERTIFICATION=="no"& REGION== "west" & MAIN_MARKET=="local" & WEB_SITE=="no"){
      PREDICT = PREDICT*(1 + 5.6222)*(1 - 0.6257)*(1 - 0.6251)*(1 - 0.3554)}
    
    Output <- data.frame(PREDICT,UserName,REGION,MAIN_MARKET,CERTIFICATION,WEB_SITE) 
    print(Output)
    
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Outcome table: forecast (FCFA) + company references") 
    } else {
      return("Server is now ready to forecast")
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton>0) { 
      isolate(datasetInput())
    } 
  })
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("MyData.csv", ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
  
}

####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)

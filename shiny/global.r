#setwd("C:/Users/Cornholio/Desktop/clusteR-master")    # This should look something like C:/Users/.../clusteR-master
basedir <- getwd()
#  _ __ ___  __ _  _____  __
# | '__/ _ \/ _` |/ _ \ \/ /
# | | |  __/ (_| |  __/>  < 
# |_|  \___|\__, |\___/_/\_\
#           |___/           
# Here is where the HTA fired VBS replaces strings for user interactions.  At the moment if you want to run clusteR on another platform you can
# Install R studio
# Point the R installation to the FOSSFlood R-Portable executible
# Rplace code below with desired inputs.

# -- USER Inputs -------------------------------------------------------------------------
userInputFile <- "C:/Users/Cornholio/Desktop/FOSSFlood-master/AOI/66044_66046_66047_66045_66049/geo/addresses/OSMaddresses.shp"
LATFieldName <- "Latitude.Decimal"
LONFieldName <- "Longitude.Decimal"
CRSFieldName <- "4326"
USERNetworkDistance <- "0"
UserRoads <- "##UserRoads"  # Use network distance flag
RoadsFile <- ""  # Which network to use
OutputMap <- "##MapType"  # Unused
realProjection <- TRUE  # Unused
useOldMethod <- FALSE  

# -- Dev   Comment/uncomment with ctrl-shift-c
#userInputFile <- "C:/Users/Cornholio/Desktop/hold/sites_tristate-upstate_trimmed.csv"
#userInputFile <- "C:/Users/Cornholio/Desktop/FOSSFlood-master/AOI/66044_66046_66047_66045_66049/geo/addresses/OSMaddresses.shp"
#LATFieldName <- "Latitude.Decimal"
#LONFieldName <- "Longitude.Decimal"
#CRSFieldName <- 4326
OutputMap <- "Basic"     # For future dev
#realProjection <- TRUE  # Unused
#useOldMethod <- FALSE  

print(paste("-- Welcome to clusteR - Running clusteR in", basedir)) # This should look something like C:/Users/.../clusteR-master
print("-- Welcome to clusteR - Pre-Preloading constants --")

##  _______       ___      .__   __.   _______  _______ .______          ________    ______   .__   __.  _______ 
## |       \     /   \     |  \ |  |  /  _____||   ____||   _  \        |       /   /  __  \  |  \ |  | |   ____|
## |  .--.  |   /  ^  \    |   \|  | |  |  __  |  |__   |  |_)  |       `---/  /   |  |  |  | |   \|  | |  |__   
## |  |  |  |  /  /_\  \   |  . `  | |  | |_ | |   __|  |      /           /  /    |  |  |  | |  . `  | |   __|  
## |  '--'  | /  _____  \  |  |\   | |  |__| | |  |____ |  |\  \----.     /  /----.|  `--'  | |  |\   | |  |____ 
## |_______/ /__/     \__\ |__| \__|  \______| |_______|| _| `._____|    /________| \______/  |__| \__| |_______|
##  
## Edit below this line at your own risk, well, as risky as coding can be...

# install.packages('installr')
# install.packages('devtools')
# install.packages('dismo')
# install.packages('ggplot2')
# install.packages('ncdf4')
## install.packages('FedData')
# install.packages('ggmap')
# install.packages('curl')
# install.packages('RCurl')
# install.packages('stringr')
# install.packages('gtools')
# install.packages('rvest')
# install.packages('tigris')
# install.packages('sp')
# install.packages('sf')
# install.packages('maptools')
# install.packages('rgdal')
# install.packages('raster')
# install.packages('dplyr')
# install.packages('leaflet')
# install.packages('shapefiles')
# install.packages('httr')
# install.packages('rgeos')
# install.packages('shiny')
# install.packages('shinydashboard')
# install.packages('data.table')
# install.packages('DT')
# install.packages('RColorBrewer')
# install.packages('lattice')
# install.packages('scales')
# install.packages('rio')
# install.packages('cdlTools')
# install.packages('MazamaSpatialUtils')
# install.packages("stargazer")
# install.packages("sjPlot")
# install.packages("formattable")
# install.packages("DT")
# install.packages("tibble")
# install.packages("flexdashboard")
# install.packages("mapview")
# install.packages("geosphere")
# install.packages("editData")
# install.packages("randomcoloR")
# install.packages('shinyjs')
# install.packages('shinyalert')
suppressMessages(library(dismo))
suppressMessages(library(ggplot2))
suppressMessages(library(ncdf4))
suppressMessages(library(ggmap))
suppressMessages(library(curl))
suppressMessages(library(RCurl))
suppressMessages(library(stringr))
suppressMessages(library(gtools))
suppressMessages(library(rvest))
suppressMessages(library(sp))
suppressMessages(library(sf))
suppressMessages(library(maptools))
suppressMessages(library(rgdal))
suppressMessages(library(raster))
suppressMessages(library(dplyr))
suppressMessages(library(leaflet))
suppressMessages(library(shapefiles))
suppressMessages(library(httr))
suppressMessages(library(rgeos))
suppressMessages(library(data.table))
suppressMessages(library(DT))
suppressMessages(library(RColorBrewer))
suppressMessages(library(lattice))
suppressMessages(library(scales))
suppressMessages(library(rio))
suppressMessages(library(cdlTools))
suppressMessages(library(stargazer))
suppressMessages(library(sjPlot))
suppressMessages(library(MazamaSpatialUtils))
suppressMessages(library(formattable))
suppressMessages(library(mapview))
suppressMessages(library(flexdashboard))
suppressMessages(library(geosphere))
suppressMessages(library(magrittr))
suppressMessages(library(editData))
suppressMessages(library(randomcoloR))
suppressMessages(library(ggplot2))
suppressMessages(library(tidyverse))
suppressMessages(library(sp))
suppressMessages(library(htmlwidgets))
suppressMessages(library(htmltools))
suppressMessages(library(plotly))
suppressMessages(library(mapedit))
suppressMessages(library(leafpop))
suppressMessages(library(shiny))
suppressMessages(library(shinydashboard))
suppressMessages(library(shinyjs))
suppressMessages(library(lubridate))
suppressMessages(library(shinyalert))
useShinyalert()

file_ext <- function(f_name) {
  f_name %>%
    strsplit(".", fixed = TRUE) %>%
    unlist
}
quiet <- function(x) { 
  sink(tempfile()) 
  on.exit(sink()) 
  invisible(force(x)) 
} 

# the two is to peal out the extention
if(file_ext(userInputFile)[2]=="csv") {
  userPoints <- read.csv(userInputFile, header=TRUE, stringsAsFactors = FALSE)
  coordinates(userPoints) <- eval(parse(text=as.character(paste0('~',LONFieldName,"+",LATFieldName))))
  CRSString <- paste0("+init=epsg:",CRSFieldName)
  proj4string(userPoints) <- CRS(CRSString)
} else if(file_ext(userInputFile)[2]=="shp") {
  userPoints  <- readOGR(userInputFile)
} else {
  print("Unrecognized file extention -- valid files are csv shp")
  quit()
}

if (file.exists(paste0(basedir,"/shiny/workingdata.rds"))) {
  quiet(file.remove(paste0(basedir,"/shiny/workingdata.rds")))
}
setwd(paste0(basedir,"/shiny/"))
saveRDS(userPoints, "workingdata.rds")
UniqueValues <- data.frame(sapply(as.data.frame(userPoints), function(x) length(unique(x))))
sorted <- UniqueValues[order(UniqueValues[, "sapply.as.data.frame.userPoints...function.x..length.unique.x..."]), , drop = FALSE]
values <-first(row.names(sorted))
uniqeValuecount <- first(sorted) 

browser.chromeium = file.path(paste0(basedir, '/ChromiumPortable/App/Chromium/64/chrome.exe'))
#browser.chrome = file.path(paste0(basedir, '/GoogleChromePortable/App/Chrome-bin/chrome.exe'))
#browser.firefox = file.path(paste0(basedir, '/FirefoxPortable/App/Firefox64/firefox.exe'))

# launch.browser = function(appUrl, browser.path=browser.chrome) {
#   shell(sprintf('"%s" --app=%s', browser.path, appUrl))
# }

# launch.browser = function(appUrl, browser.path=browser.chrome) {
#   system(sprintf('"%s" --disable-gpu --app="data:text/html,<html>
#                  <head>
#                  <title>System Configuration</title>
#                  </head>
#                  <body>
#                  <script>window.resizeTo(830,675);window.location=\'%s\';</script>
#                  </body></html>" &', browser.path, appUrl))
# }

launch.browser = function(appUrl, browser.path=browser.chromeium) {
  system(sprintf('"%s" --disable-gpu --app="data:text/html,<html>
                 <head>
                 <title>System Configuration</title>
                 </head>
                 <body>
                 <script>window.resizeTo(830,675);window.location=\'%s\';</script>
                 </body></html>" &', browser.path, appUrl), wait=FALSE)
}

shinyApp(
  ui = dashboardPage(
    dashboardHeader(title = "clusteR - V 0.8"),
    dashboardSidebar(disable = TRUE),
    dashboardBody(
      useShinyalert(),
      fluidRow(
        box(tags$style(type = "text/css", "#map {height: calc(50vh - 80px) !important;}"), title = "Map", width = 10, solidHeader = TRUE, status = "primary", leafletOutput("map")),
        column(width = 2,
               box(title = "User Input", status = "warning", width = NULL, solidHeader = TRUE, 
                   selectInput("variabledisplay", "Column to cluster:", choices = names(userPoints), selected = first(row.names(sorted))),
                   selectInput("variablelabel", "Column to label with:", choices = names(userPoints), selected = last(row.names(sorted)))
               )
        )
      ),
      fluidRow(
        tabBox(
          title = "Data tables",
          id = "tabset1",
          width = 12,
          tabPanel("Data Table", 
                   fluidRow(DT::dataTableOutput("DataTableForm")),
                   fluidRow( 
                     actionButton(inputId = "save_edits",label = "Save"),
                     tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")),
                     downloadButton("Download_csv", "Download in CSV", class="butt"),
                     shinyjs::useShinyjs(),
                     shinyjs::extendShinyjs(text = "shinyjs.refresh = function() { location.reload(); }")
                   )
          ),
          tabPanel("ClusteR", DT::dataTableOutput("DataTableSummery"))
        )
      )
    )
  ),
  server = function(input, output, session) {
    ### interactive dataset 
    dataInstance<-reactiveValues()
    dataInstance$Data<-readRDS("workingdata.rds")
    
    output$DataTableForm<-DT::renderDataTable({
      datatable(as.data.frame(dataInstance$Data), editable = TRUE, selection = "none") 
    })
    proxy = dataTableProxy('DataTableForm')
    observeEvent(input$DataTableForm_cell_edit, {
      info = input$DataTableForm_cell_edit
      str(info) 
      i = info$row 
      j = info$col 
      v = info$value
      dataInstance$Data[i, j] <<- DT::coerceValue(v, dataInstance$Data[i, j]) 
      replaceData(proxy, dataInstance$Data, resetPaging = FALSE) # important
    })
    observeEvent(input$save_edits,{
      saveRDS(dataInstance$Data, "workingdata.rds")
      shinyalert(title = "Saved!", type = "success")
    })
    output$Download_csv<- downloadHandler(
      filename = function() {paste("clusteR_edits", Sys.Date(), ".csv", sep="")},
      content = function(file) {write.csv(data.frame(dataInstance$Data), file, row.names = F)}
    )
    colorpal <- reactive({
      colorFactor(palette = distinctColorPalette(k = length(unique(dataInstance$Data[[input$variabledisplay]])), altCol = FALSE, runTsne = FALSE), 
                  levels = unique(dataInstance$Data[[input$variabledisplay]]))
    })
    output$map <- renderLeaflet({
      leaflet() %>%
        addProviderTiles(providers$Stamen.TonerLite, group = "TonerLite") %>%
        addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
        addProviderTiles(providers$OpenTopoMap, group = "OpenTopo") %>%
        addLayersControl(
          baseGroups = c("TonerLite", "Toner", "OpenTopo"),
          options = layersControlOptions(collapsed = FALSE)
        )
    })
    observe({
      proxy <- leafletProxy("map", data = dataInstance$Data)
      proxy %>% 
        clearGroup(group = "Points") %>% 
        clearControls()
      pal <- colorpal()
      proxy %>% addLegend(title = "Legend", position = "bottomright", pal = pal, values = ~dataInstance$Data[[input$variabledisplay]])
    })    
    observe({
      pal <- colorpal()
      leafletProxy("map", data = dataInstance$Data) %>%
        addCircleMarkers(data=dataInstance$Data, 
                         color = ~pal(dataInstance$Data[[input$variabledisplay]]), 
                         label = ~dataInstance$Data[[input$variablelabel]],
                         stroke = FALSE,
                         radius = 6,
                         fillOpacity = 0.9,
                         group = "Points") %>%
        addLayersControl(
          baseGroups = c("TonerLite", "Toner", "OpenTopo"),
          overlayGroups = c("Points"),
          options = layersControlOptions(collapsed = FALSE)
        )
    })
    output$DataTableSummery<-DT::renderDataTable({
      datatable(as.data.frame(table(subset(as.data.frame(dataInstance$Data),select=input$variabledisplay),dnn=input$variabledisplay))) 
    })
    
    session$onSessionEnded(stopApp)
  },
  options = list(launch.browser=launch.browser)
)

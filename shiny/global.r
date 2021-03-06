#setwd("C:/Users/Cornholio/Desktop/clusteR-master")    # This should look something like C:/Users/.../clusteR-master
basedir <- getwd()
#  _ __ ___  __ _  _____  __
# | '__/ _ \/ _` |/ _ \ \/ /
# | | |  __/ (_| |  __/>  < 
# |_|  \___|\__, |\___/_/\_\
#           |___/           
# Here is where the HTA fired VBS replaces strings for user interactions.  At the moment if you want to run clusteR on another platform you can
# Install R studio
# Point the R installation to the FOSSFlood R-Portable executable
# Replace code below with desired inputs.

# -- USER Inputs -------------------------------------------------------------------------
userInputFile <- "C:/Users/Cornholio/Desktop/clusteR-master/data/TestDataset.csv"
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
#userInputFile <- paste0(basedir, "/data/TestDataset.csv")
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
# install.packages('grid')
# install.packages('gridExtra')
# install.packages("purrr")
# install.packages("magick")
# install.packages("animation")
# install.packages("mapview")
# install.packages("imager")

suppressWarnings(suppressMessages(library(dismo)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(ncdf4)))
suppressWarnings(suppressMessages(library(ggmap)))
suppressWarnings(suppressMessages(library(curl)))
suppressWarnings(suppressMessages(library(RCurl)))
suppressWarnings(suppressMessages(library(stringr)))
suppressWarnings(suppressMessages(library(gtools)))
suppressWarnings(suppressMessages(library(rvest)))
suppressWarnings(suppressMessages(library(sp)))
suppressWarnings(suppressMessages(library(sf)))
suppressWarnings(suppressMessages(library(maptools)))
suppressWarnings(suppressMessages(library(rgdal)))
suppressWarnings(suppressMessages(library(raster)))
suppressWarnings(suppressMessages(library(dplyr)))
suppressWarnings(suppressMessages(library(leaflet)))
suppressWarnings(suppressMessages(library(shapefiles)))
suppressWarnings(suppressMessages(library(httr)))
suppressWarnings(suppressMessages(library(rgeos)))
suppressWarnings(suppressMessages(library(data.table)))
suppressWarnings(suppressMessages(library(DT)))
suppressWarnings(suppressMessages(library(RColorBrewer)))
suppressWarnings(suppressMessages(library(lattice)))
suppressWarnings(suppressMessages(library(scales)))
suppressWarnings(suppressMessages(library(rio)))
suppressWarnings(suppressMessages(library(cdlTools)))
suppressWarnings(suppressMessages(library(stargazer)))
suppressWarnings(suppressMessages(library(sjPlot)))
suppressWarnings(suppressMessages(library(MazamaSpatialUtils)))
suppressWarnings(suppressMessages(library(formattable)))
suppressWarnings(suppressMessages(library(mapview)))
suppressWarnings(suppressMessages(library(flexdashboard)))
suppressWarnings(suppressMessages(library(geosphere)))
suppressWarnings(suppressMessages(library(magrittr)))
suppressWarnings(suppressMessages(library(editData)))
suppressWarnings(suppressMessages(library(randomcoloR)))
suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(sp)))
suppressWarnings(suppressMessages(library(htmlwidgets)))
suppressWarnings(suppressMessages(library(htmltools)))
suppressWarnings(suppressMessages(library(webshot)))
suppressWarnings(suppressMessages(library(plotly)))
suppressWarnings(suppressMessages(library(mapedit)))
suppressWarnings(suppressMessages(library(leafpop)))
suppressWarnings(suppressMessages(library(shiny)))
suppressWarnings(suppressMessages(library(shinydashboard)))
suppressWarnings(suppressMessages(library(shinyjs)))
suppressWarnings(suppressMessages(library(lubridate)))
suppressWarnings(suppressMessages(library(shinyalert)))
# suppressWarnings(suppressMessages(library(knitr)))
suppressWarnings(suppressMessages(library(rmarkdown)))
suppressWarnings(suppressMessages(library(purrr)))
suppressWarnings(suppressMessages(library(gtable)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(gridExtra)))
suppressWarnings(suppressMessages(library(grid)))
suppressWarnings(suppressMessages(library(magick)))
suppressWarnings(suppressMessages(library(animation)))
suppressWarnings(suppressMessages(library(mapview)))
suppressWarnings(suppressMessages(library(imager)))
suppressWarnings(suppressMessages(library(installr)))

useShinyalert()
if(is.null(webshot:::find_phantom())) {
  print("Installing phantomjs.")
  webshot::install_phantomjs()
}
if(is.null(pandoc_version())) {
  print("Pandoc is needed in order to print outputs, please follow the installation prompts when they appear.")
  install.pandoc(use_regex = TRUE, to_restart = FALSE)
}

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
launch.browser = function(appUrl, browser.path=browser.chromeium) {
  system(sprintf('"%s" --disable-gpu --app="data:text/html,<html>
                 <head>
                 <title>System Configuration</title>
                 </head>
                 <body>
                 <script>window.resizeTo(830,675);window.location=\'%s\';</script>
                 </body></html>" &', browser.path, appUrl), wait=FALSE)
}

print("Launching clusteR application.")
shinyApp(
  ui = dashboardPage(
    dashboardHeader(title = "clusteR - V 0.82", 
                    tags$li(class = "dropdown",
                            actionButton("print", "Export analysis")
                    )),
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
                   DT::dataTableOutput("DataTableForm"),
                   actionButton(inputId = "save_edits",label = "Save"),
                   tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")),
                   downloadButton("Download_csv", "Download in CSV", class="butt"),
                   shinyjs::useShinyjs(),
                   shinyjs::extendShinyjs(text = "shinyjs.refresh = function() { location.reload(); }")
          ),
          tabPanel("ClusteR", DT::dataTableOutput("DataTableSummery"))
        )
      )
    )
  ),
  server = function(input, output, session) {
    ### interactive dataset 
    dataInstance <- reactiveValues()
    dataInstance$Data <- readRDS("workingdata.rds")
    map_reactive <- reactive({
      leaflet() %>%
        addProviderTiles(providers$Stamen.TonerLite, group = "TonerLite") %>%
        addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
        addProviderTiles(providers$OpenTopoMap, group = "OpenTopo") %>%
        addLayersControl(
          baseGroups = c("TonerLite", "Toner", "OpenTopo"),
          options = layersControlOptions(collapsed = FALSE)
        )
    })
    output$map <- renderLeaflet({
      map_reactive()
    })
    output$DataTableForm<-DT::renderDataTable({
      datatable(as.data.frame(dataInstance$Data), editable = TRUE, class = 'compact hover stripe order-column row-border stripe', options = list(scrollX = TRUE), selection = "single") 
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
    observeEvent(input$save_edits, {
      saveRDS(dataInstance$Data, "workingdata.rds")
      shinyalert(title = "Saved!", type = "success")
    })
    output$Download_csv <- downloadHandler(
      filename = function() {paste("clusteR_edits", Sys.Date(), ".csv", sep="")},
      content = function(file) {write.csv(data.frame(dataInstance$Data), file, row.names = F)}
    )
    output$DataTableSummery <- DT::renderDataTable({
      datatable(as.data.frame(table(subset(as.data.frame(dataInstance$Data),select=input$variabledisplay),dnn=input$variabledisplay)), class = 'compact hover stripe order-column row-border stripe') 
    })
    
    colorpal <- reactive({
      colorFactor(palette = distinctColorPalette(k = length(unique(dataInstance$Data[[input$variabledisplay]])), altCol = FALSE, runTsne = FALSE), 
                  levels = unique(dataInstance$Data[[input$variabledisplay]]))
    })
    observe({
      proxy <- leafletProxy("map")
      proxy %>% 
        clearGroup(group = "Points") %>% 
        clearControls()
      pal <- colorpal()
      proxy %>% 
        addLegend(title = "Legend", 
                  position = "bottomright", 
                  pal = pal, 
                  values = dataInstance$Data[[input$variabledisplay]]
        )
    })    
    observe({
      pal <- colorpal()
      leafletProxy("map") %>%
        addCircleMarkers(data= dataInstance$Data, 
                         color = pal(dataInstance$Data[[input$variabledisplay]]), 
                         label = dataInstance$Data[[input$variablelabel]],
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
    observe({
      if (length(input$DataTableForm_rows_selected)) {
        leafletProxy("map") %>%
          flyTo(coordinates(dataInstance$Data[input$DataTableForm_rows_selected,])[1],coordinates(dataInstance$Data[input$DataTableForm_rows_selected,])[2],18)
      }
    })
    user_created_map <- reactive({
      pal <- colorpal()
      m = map_reactive() %>%
        addCircleMarkers(data= dataInstance$Data, 
                         color = pal(dataInstance$Data[[input$variabledisplay]]), 
                         label = dataInstance$Data[[input$variablelabel]],
                         stroke = FALSE,
                         radius = 6,
                         fillOpacity = 0.9,
                         group = "Points") %>%
        addLayersControl(
          baseGroups = c("TonerLite", "Toner", "OpenTopo"),
          overlayGroups = c("Points"),
          options = layersControlOptions(collapsed = FALSE)
        ) %>%
        setView(lng = input$map_center$lng, lat = input$map_center$lat, 
                zoom = input$map_zoom)
      m
    })
    
    # Print the map to the working directory
    observeEvent(input$print, {
      # Take a screenshot of the map
      mapshot(user_created_map(), file=paste0(getwd(), '/exported_map.png'))
      
      # Generate summery table images
      ggsave(
        "SummeryTable.png",
        plot = ggplot() + 
          annotation_custom(tableGrob(as.matrix(as.data.frame(table(subset(as.data.frame(dataInstance$Data),select=input$variabledisplay),dnn=input$variabledisplay))), vp = viewport(width=10))) + 
          theme_void(),
        width=10,
        dpi = 300
      )
      
      # Generate table images
      maxrow = 30
      npages = ceiling(nrow(dataInstance$Data)/maxrow)
      for (i in 1:npages) {
        idx = seq(1+((i-1)*maxrow), i*maxrow)
        if(i*maxrow >= length(dataInstance$Data)){
          idx = seq(1+((i-1)*maxrow), length(dataInstance$Data))
        }
        imageName = paste0("rawTable",i,".png")
        ggsave(
          imageName,
          plot = ggplot() + 
            annotation_custom(tableGrob(as.matrix(as.data.frame(dataInstance$Data[idx, ])), vp = viewport(width=10))) + 
            theme_void(),
          width=10,
          dpi = 300
        )
      }
      
      # Modify FirstPage with dates
      MapPage <- image_read(paste0(basedir,"/data/ClusteR_MapPageBase.png"))
      MapPageChage <- image_annotate(MapPage, paste("Generated on:", Sys.Date(), " ",format(Sys.time(), "%H:%M:%S")), font = 'Helvetica', location = "+30+1100", size = 77)
      
      # and map image
      mappaste <- image_read(paste0(getwd(),"/exported_map.png"))
      FirstPage <- image_composite(MapPageChage, mappaste, offset = "+30+1200")
      
      # and summery table (probably do this on export...)
      sumtablarge <- load.image(paste0(getwd(),"/SummeryTable.png"))
      imager::save.image(autocrop(sumtablarge,"white"),paste0(getwd(),"/SummeryTableSamll.png"))
      sumtabSmall <- image_read(paste0(getwd(),"/SummeryTableSamll.png"))
      HeadPage <- image_composite(FirstPage, sumtabSmall, offset = "+1000+1200")
      image_write(HeadPage, path = "HeadPage.png", format = "png")
      
      # remove extra images
      file.remove('exported_map.png')
      file.remove('SummeryTable.png')
      file.remove('SummeryTableSamll.png')
      file.remove('cropsum.png')
      
      # Flatten images into pdf
      all_images = list.files(getwd(), full.names = TRUE, pattern = '.png')
      all_images_1 <- purrr::reduce(
        purrr::map(all_images,image_read),
        c
      )
      image_write(all_images_1 , format = "pdf", "check.pdf")
      file.remove(all_images)
      
      # Alert to finish :)
      shinyalert(title = "Print complete, see /shiny!", type = "success")
    })
    
    session$onSessionEnded(stopApp)
  },
  options = list(launch.browser=launch.browser)
)

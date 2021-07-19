#Librarias generalmente necesarias
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(leaflet)
library(leaflet.extras)

library(shinydashboardPlus)


setwd("D:/Jdocs/J/VD/sesion01-shinydashboard-Mineria/mapas")
datosEcuProv <-read.csv('provincias_por_dia.csv')

listaProvincias = c("Todo",as.character(datosEcuProv$provincia))


#Aplicación: Función de usuario (Cliente)
ui <-dashboardPage(
  
  dashboardHeader(title = "Demo",fixed = TRUE
  ),
  
  sidebar = dashboardSidebar(
    sidebarMenu(
      menuItem("Acerca de...", tabName = "tab_AcercaDe")
    )
  ),
  
  body = dashboardBody(
    leafletOutput("MapaPrincipal",width="100%", height="800px")
  )
  
)

#Aplicación: Función de SServidor
server_Dashboard1 <- function(input, output) {
  
  output$MapaPrincipal <- renderLeaflet({
    leaflet(datosEcuProv) %>% addTiles() %>% clearMarkers() %>%
      addMarkers(~lng, ~lat, popup =  as.character( datosEcuProv$X10.07.2021))
    
  })  
  
  
}

#Iniciar Aplicación
shinyApp(ui, server_Dashboard1)

## Goal: Enable filtering by storm status.
  
library(shiny)
library(tidyverse)
tax <- read_excel("~/Downloads/Tax_Burden_clean.xlsx")
tax <- tax %>% 
  select(LocationDesc, Year, pack_consumption_pc)

theme_set(theme_minimal())


ui <- fluidPage(
  
  selectInput("State",
              label = "Consumption by State: ",
              choices = unique(tax$LocationDesc)),
  
  "The plot below shows the distribution of storm name use.",
  plotOutput("Tobacco")
)

server <- function(input, output, session) {
  
  output$Tobacco <- renderPlot({
    
  
    
    ggplot(data = filter(tax, LocationDesc == input$State)) +
        geom_line(aes(x = Year, y = pack_consumption_pc)) 

  },
  
  width = 400, height = 300)
  
}

shinyApp(ui, server)

install.packages(c("shiny", "rsconnect", "plotly", "leaflet", "DT"))

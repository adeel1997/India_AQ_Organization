library(leaflet)

df1_filled <- read.csv("AQ_Air_table_Location.csv")
leaflet(df1_filled) %>%
    addProviderTiles(providers$CartoDB.Voyager) %>%
    addMarkers(popup = paste("<a href=",df1_filled$Website,">",df1_filled$ï..Organization,"</a>"),clusterOptions = markerClusterOptions())%>%    
    fitBounds(65, 21, 99, 27)

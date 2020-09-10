library(dplyr)
library(ggmap)
library(tidyverse)
library(leaflet)

df1 <- read.csv("airtable_6_Aug.csv")

head(df1)
ggmap::register_google(key = "AIzaSyBa10Iu6yEenjSYsCYttxWtqiPDIsic6MY")
df1$OrgCity <- paste(df1$ï..Organization, ",", df1$Loation)

head(df1)

location_org <- geocode(location = df1$OrgCity, output = "more", source = "google")
head(location_org)
df1_filled <- cbind(df1, location_org)
head(df1_filled)

write.csv(df1_filled,"AQ_Air_table_Location.csv")

#df1_filled <- read.csv("AQ_Air_table_Location.csv")
#leaflet(df1_filled) %>%
#    addProviderTiles(providers$CartoDB.Voyager) %>%
#    addMarkers(popup = paste("<a href=",df1_filled$Website,">",df1_filled$ï..Organization,"</a>"),clusterOptions = markerClusterOptions())%>%    
#    fitBounds(65, 21, 99, 27)





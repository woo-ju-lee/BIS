library(jsonlite)
library(tidyverse)
library(httr)

scrap_data <- function() {
  url <- "https://www.chungnam.go.kr/cnbus/cmmn/selectBusRealTimeListGeoJsonProcs.do"
  
  res <- POST(
    url = url,
    body = list(
      ROUTE_NM = 100
    ),
    encode = "form"
  )
  
  status_code(res)
  raw_text <- content(res, "text", encoding = "UTF-8")
  
  parsed_json <- fromJSON(raw_text)
  
  data1 <- parsed_json$data$result %>% as.data.frame()
    
  write.csv(data1, "Bis_Data.csv")
}

scrap_data()

library(httr)
library(tidyverse)
library(jsonlite)

raw_url <- "https://www.chungnam.go.kr/cnbus/mobile/api/search.do"

raw_route <- function(route) {
  raw_post <- POST(url = raw_url,
                   body = list(
                     SEARCH_TYPE = "route", 
                     TEXT = route, 
                     SUB_TEXT = "",
                     ADMIN_ID = "287"),
                   add_headers(
                     "Referer" = "https://www.chungnam.go.kr/cnbus/mobile.jsp?areaCd=287"
                   )) %>% content("text", encoding = "UTF-8")
  return(raw_post)
}


raw_json <- fromJSON(raw_route(300))

raw_routeDetail <- function(routedetail) {
  raw_post <- POST(url = raw_url,
                   body = list(
                     SEARCH_TYPE = "routeDetail", 
                     TEXT = routedetail, 
                     SUB_TEXT = "",
                     ADMIN_ID = "287"),
                   add_headers(
                     "Referer" = "https://www.chungnam.go.kr/cnbus/mobile.jsp?areaCd=287"
                   )) %>% content("text", encoding = "UTF-8")
  return(raw_post)
}

raw_routeDetail_json <- fromJSON(raw_routeDetail(raw_json$data$result$보령시$ROUTE_ID))
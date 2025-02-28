# Brittany Bobb
# 02/24/2025
# script is for exercise 8
library(tidyverse)
library(ggplot2)
library(ggthemes)

url<-"https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
covid<-read_csv(url)

df= data.frame(region = state.region,
               state = state.name,
               state_abbreviation = state.abb)
    inner_join(df,covid,by = "state")|>
    group_by(region,date)|>
    summarise(cases= sum(cases),deaths= sum(deaths))|>
    pivot_longer(cols = c(cases, deaths),
             names_to = "type",
             values_to = "count") |>
    ggplot(aes(x = date, y = count)) +
    geom_line() +
    facet_grid(type~region, scales = "free_y")+
    theme_bw()

    
    
    
  

  





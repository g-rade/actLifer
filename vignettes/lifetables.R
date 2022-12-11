## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(lifetables)

## -----------------------------------------------------------------------------
example <- lifetable(mortality2, "age_group", "population", "deaths")

## ---- echo = FALSE------------------------------------------------------------
example[1:5,]


## ---- echo = FALSE------------------------------------------------------------
mortality2[1:5,]

## -----------------------------------------------------------------------------
lifetable(mortality3, "age_group", "population", "deaths", FALSE, FALSE, FALSE, "gender")

## -----------------------------------------------------------------------------
lifetable(mortality2, "age_group", "population", "deaths", TRUE, FALSE, FALSE)

## -----------------------------------------------------------------------------
mort<- mortality2 %>% 
  central_death_rate("age_group", "population", "deaths") %>% 
  conditional_death_prob("age_group", "population", "deaths")

head(mort)
tail(mort)


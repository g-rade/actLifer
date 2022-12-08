
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lifetables

<!-- badges: start -->

[![R-CMD-check](https://github.com/g-rade/lifetables/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/g-rade/lifetables/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `lifetables` package contains functions that create a life table
based on mortality data, and ultimately calculates life expectancy from
data on annual deaths for given ages/age groups. This package also
contains mortality data from CDC wonder.

## Target audience

Our target audience for this package are actuaries, epidemiologists, or
generally any data scientists working with mortality data.

## R package proposal

We are still working on an R package that has a function for creating
lifetables from age-group mortality data, and some included lifetables.
We now want to include functions that will result in different
combinations of columns from a full lifetable.

## Installation

You can install the development version of lifetables from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("g-rade/lifetables")
```

## How To Use ‘lifetables’

``` r
library(lifetables)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

## Take a look at the mortality2 data fram
head(mortality2)
#> # A tibble: 6 × 3
#>   age_group deaths population
#>   <chr>      <dbl>      <dbl>
#> 1 < 1 year   23161    3970145
#> 2 1 year      1568    3995008
#> 3 2 years     1046    3992154
#> 4 3 years      791    3982074
#> 5 4 years      640    3987656
#> 6 5 years      546    4032515


## Use the lifetable function to make a custom life table with just
## CentralDeathRate, PropToSurvive, and LifeExpectancy by setting includeAllSteps = FALSE

lifetable(mortality2, "age_group", "population", "deaths", FALSE, TRUE, TRUE)
#> # A tibble: 85 × 6
#>    age_group deaths population CentralDeathRate PropToSurvive LifeExpectancy
#>    <chr>      <dbl>      <dbl>            <dbl>         <dbl>          <dbl>
#>  1 < 1 year   23161    3970145         0.00583          1               75.9
#>  2 1 year      1568    3995008         0.000392         0.994           75.3
#>  3 2 years     1046    3992154         0.000262         0.994           74.4
#>  4 3 years      791    3982074         0.000199         0.994           73.4
#>  5 4 years      640    3987656         0.000160         0.993           72.4
#>  6 5 years      546    4032515         0.000135         0.993           71.4
#>  7 6 years      488    4029655         0.000121         0.993           70.4
#>  8 7 years      511    4029991         0.000127         0.993           69.4
#>  9 8 years      483    4159114         0.000116         0.993           68.4
#> 10 9 years      462    4178524         0.000111         0.993           67.4
#> # … with 75 more rows


## Or show everything by setting includeAllSteps=TRUE, includeCDR=TRUE, and includePS=TRUE which are the default values
lifetable(mortality2, "age_group", "population", "deaths")
#> # A tibble: 85 × 11
#>    age_group deaths population Central…¹ Condi…² Condi…³ Numbe…⁴ PropT…⁵ Perso…⁶
#>    <chr>      <dbl>      <dbl>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1 < 1 year   23161    3970145  0.00583  5.82e-3   0.994 100000    1      99709.
#>  2 1 year      1568    3995008  0.000392 3.92e-4   1.00   99418.   0.994  99399.
#>  3 2 years     1046    3992154  0.000262 2.62e-4   1.00   99379.   0.994  99366.
#>  4 3 years      791    3982074  0.000199 1.99e-4   1.00   99353.   0.994  99343.
#>  5 4 years      640    3987656  0.000160 1.60e-4   1.00   99334.   0.993  99326.
#>  6 5 years      546    4032515  0.000135 1.35e-4   1.00   99318.   0.993  99311.
#>  7 6 years      488    4029655  0.000121 1.21e-4   1.00   99304.   0.993  99298.
#>  8 7 years      511    4029991  0.000127 1.27e-4   1.00   99292.   0.993  99286.
#>  9 8 years      483    4159114  0.000116 1.16e-4   1.00   99280.   0.993  99274.
#> 10 9 years      462    4178524  0.000111 1.11e-4   1.00   99268.   0.993  99263.
#> # … with 75 more rows, 2 more variables: TotalYears <dbl>,
#> #   LifeExpectancy <dbl>, and abbreviated variable names ¹​CentralDeathRate,
#> #   ²​ConditionalProbDeath, ³​ConditionalProbLife, ⁴​NumberToSurvive,
#> #   ⁵​PropToSurvive, ⁶​PersonYears
```

## Contributors

- [Grace Rade](https://github.com/g-rade)
- [Maeve Tyler-Penny](https://github.com/mctp546)
- [Julia Ting](https://github.com/jtingy)

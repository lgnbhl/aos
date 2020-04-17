
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/aos)](https://CRAN.R-project.org/package=aos)
[![pipeline
status](https://gitlab.com/lgnbhl/aos/badges/master/pipeline.svg)](https://gitlab.com/lgnbhl/aos/pipelines)
[![experimental
status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)]()

# aos <img src="man/figures/logo.png" align="right" />

> Animate on Scroll Library for Shiny

The package `aos` allows to animate on scroll elements in Shiny thanks
to [AOS - Animate On Scroll](http://michalsnik.github.io/aos/).

## Installation

Install the package from Github.

``` r
# install.packages("remotes")
remotes::install_github("lgnbhl/aos")
```

## Shiny

In order to use the {aos} package, you must first call `use_aos()` in
the apps’ UI. The `use_aos()` allows to parameter global options.

Then simply apply `aos()` to any Shiny element with an animation and
other arguments such as ‘duration’, ‘delay’ or ‘easing’. Check out the
[aos
documentation](https://github.com/michalsnik/aos/tree/v2#-animations) to
learn more.

``` r
library(shiny)
library(ggplot2)
library(aos)

shinyApp(
  ui = fluidPage(
    align = "center",
    use_aos(), # add use_aos() in the UI
    aos(
      element = h1("Shiny with AOS - Animation On Scroll"), 
      animation = "fade-up", 
      duration = "3000"),
    br(), br(), br(), br(),
    aos(
      element = plotOutput("plot"), 
      animation = "flip-left", 
      delay = "200",
      duration = "2000",
      easing = "ease-out-cubic")
  ),
  server <- function(input, output, session) {
    output$plot <- renderPlot({
      ggplot(mpg, aes(displ, hwy, colour = class)) + 
        geom_point()
    })
  }
)
```

The function `aos()` doesn’t work (yet) with
[htmlwidgets](https://www.htmlwidgets.org/).

## R Markdown

To animate a element of a R Markdown document, you must first call
`use_aos()` inside a R code chunk with `{r, echo = FALSE}` so the code
will not be shown in the final document.

``` r
```{r, echo = FALSE}
aos::use_aos()
```
```

Then you can animate any content of your R Markdown document using the
`:::` markers of the `rmarkdown` package followed by
`{data-aos="ANIMATION EFFECT" data-aos-ARGUMENT="ARGUMENT OPTION"}`. The
animation effects are listed in the documentation
[here](https://github.com/michalsnik/aos/tree/v2#-animations).

Below an example with the “fade-up” animation with other arguments.

``` md
::: {data-aos="fade-up" data-aos-duration="2000" data-aos-offset="0"}
This element will be animated.
:::
```

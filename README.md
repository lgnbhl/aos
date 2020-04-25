
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](https://www.r-pkg.org/badges/version/aos)](https://CRAN.R-project.org/package=aos)
[![pipeline
status](https://gitlab.com/lgnbhl/aos/badges/master/pipeline.svg)](https://gitlab.com/lgnbhl/aos/pipelines)

# aos <img src="man/figures/logo.png" align="right" />

> Animate on Scroll Library for Shiny

The package `aos` allows to animate on scroll elements in R Shiny thanks
to [AOS - Animate On Scroll](http://michalsnik.github.io/aos/).

## Installation

Install the released version from CRAN.

``` r
install.packages("aos")
```

To get a bug fix, or use a feature from the development version, you can
install it from GitHub.

``` r
# install.packages("remotes")
remotes::install_github("lgnbhl/aos")
```

## Shiny

In order to use the {aos} package, you must first call `use_aos()` in
the apps’ UI.

Then simply apply `aos()` to any Shiny element with an animation and
other arguments such as `duration`, `delay` or `easing`.

``` r
library(shiny)
library(ggplot2)
library(aos)

shinyApp(
  ui = fluidPage(
    align = "center",
    use_aos(disable = "mobile"), # add use_aos() in the UI
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

### Customize your animations

The `use_aos()` allows to parameter global settings as well as overrid
default `aos()` arguments.

For example, you can change the offset to trigger animations later
(200px instead of the default 120px), the duration of the animations
(600ms instead of 400ms), the easing (“ease-in-sine” instead of “ease”),
the delay (300ms instead of 0ms) or disable the animation for mobile
phones (global setting).

``` r
aos::use_aos(
  offset = "200", 
  duration = "600", 
  easing = "ease-in-sine", 
  delay = "300", 
  disable = "mobile"
  )
```

Check out the [aos
documentation](https://github.com/michalsnik/aos/tree/v2#-animations) to
learn about all the attributes available for `use_aos()` and `aos()`.

The arguments `duration` and `delay` accept only values from “50” to
“3000”, with step 50ms.

The attribute `anchor_placement` allows to set different placement
option, for example `top-center`, i.e. the animation will be triggered
when `top` of element will reach `center` of the window.

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
`{data-aos="ANIMATION_EFFECT" data-aos-ARGUMENT="ARGUMENT_OPTION"}`. The
animation effects are listed in the documentation
[here](https://github.com/michalsnik/aos/tree/v2#-animations).

Below an example with the “fade-up” animation with other arguments.

``` md
::: {data-aos="fade-up" data-aos-duration="2000" data-aos-offset="0"}
This element will be animated.
:::
```

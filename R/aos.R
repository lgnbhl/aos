#' Animate element on scroll
#'
#' Animate on scroll a Shiny or R Markdown element.
#'
#' @param element An shiny or rmarkdown element.
#' @param animation An animation from \href{https://github.com/michalsnik/aos/tree/v2#-animations}{AOS}
#' @param offset string. Change offset to trigger animations sooner or later, px
#' @param duration string. Duration of animation in ms
#' @param easing string. Choose timing function to ease elements in different ways
#' @param delay string. Delay animation in ms
#' @param anchor string. Anchor placement
#' @param anchor_placement string. Anchor placement - which one position of element on the screen should trigger animation 
#' @param once boolean.
#' @param ... Additional class element 
#'
#' @importFrom htmltools tagAppendAttributes
#'
#' @return Javascript code animating the element.
#'
#' @examples 
#' if (interactive()) {
#'  library(shiny)
#'   shinyApp(
#'    ui = fluidPage(
#'      use_aos(), # add use_aos() in the UI
#'      aos(h1("Shiny with AOS - Animate On Scroll"), animation = "fade-zoom-in"),
#'      aos(textOutput("text"), animation = "fade-up")
#'    ),
#'   server <- function(input, output, session){
#'     output$text <- renderText({ print("An animated text.") })
#'   }
#'  )
#' }
#'
#' @export
aos <- function(element, 
                animation, 
                offset = "120", 
                duration = "400", 
                easing = "ease", 
                delay = "0", 
                anchor = "", 
                anchor_placement = "top-bottom", 
                once = FALSE, 
                ...) {
  if(missing(element)) stop("must pass element.", call. = FALSE)
  if(missing(animation)) stop("must pass animation effect.", call. = FALSE)
  
  htmltools::tagAppendAttributes(
    element, 
    "data-aos" = animation, 
    "data-aos-offset" = offset, 
    "data-aos-duration" = duration, 
    "data-aos-easing" = easing, 
    "data-aos-delay" = delay, 
    "data-aos-anchor" = anchor, 
    "data-aos-anchor-placement" = anchor_placement, 
    "data-aos-once" = once, 
    ...)
}

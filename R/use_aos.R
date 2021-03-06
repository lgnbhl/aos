#' Use aos
#'
#' @param disable boolean. Accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
#' @param startEvent string. Name of the event dispatched on the document, that AOS should initialize on
#' @param initClassName string. Class applied after initialization
#' @param animatedClassName string. Class applied on animation
#' @param useClassNames boolean. If true, will add content of data-aos as classes on scroll
#' @param disableMutationObserver boolean. Disables automatic mutations detections (advanced)
#' @param debounceDelay string. The delay on debounce used while resizing window (advanced)
#' @param throttleDelay string. The delay on throttle used while scrolling the page (advanced)
#' @param offset string. Change offset to trigger animations sooner or later, in px
#' @param duration string. Duration of animation in ms.
#' @param easing string. Timing function to animate elements nicely
#' @param delay string. Delay animation (ms)
#' @param disable string. Condition when AOS should be disabled, for example 'mobile'
#' @param use_cdn boolean. TRUE to use a Content Delivery Network (CDN), true by default, or false to use locally stored files.
#' 
#' @importFrom jsonlite toJSON
#' @importFrom htmltools tags tagList
#' 
#' @return Javascript code initializing aos with dependencies.
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

use_aos <- function(
  disable = FALSE, # accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
  startEvent = 'DOMContentLoaded', # name of the event dispatched on the document, that AOS should initialize on
  initClassName = 'aos-init', # class applied after initialization
  animatedClassName = 'aos-animate', # class applied on animation
  useClassNames = FALSE, # if true, will add content of `data-aos` as classes on scroll
  disableMutationObserver = FALSE, # disables automatic mutations detections (advanced)
  debounceDelay = "50", # the delay on debounce used while resizing window (advanced)
  throttleDelay = "99", # the delay on throttle used while scrolling the page (advanced)
  offset = "120",
  duration = "400",
  easing = 'ease',
  delay = "0",
  use_cdn = TRUE
){
  options <- list(
    disable = disable, # accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
    startEvent = startEvent, # name of the event dispatched on the document, that AOS should initialize on
    initClassName = initClassName, # class applied after initialization
    animatedClassName = animatedClassName, # class applied on animation
    useClassNames = useClassNames, # if true, will add content of `data-aos` as classes on scroll
    disableMutationObserver = disableMutationObserver, # disables automatic mutations detections (advanced)
    debounceDelay = debounceDelay, # the delay on debounce used while resizing window (advanced)
    throttleDelay = throttleDelay, # the delay on throttle used while scrolling the page (advanced)
    offset = offset,
    duration = duration,
    easing = easing,
    delay = delay
  )
  
  options <- jsonlite::toJSON(options, auto_unbox = TRUE)
  
  htmltools::tagList(
    html_dependencies_aos(use_cdn),
    htmltools::tags$script(
      sprintf(
        "$(document).ready(function(){
            AOS.init(%s);
        });",
        options
      )
    )
  )
}

#' aos dependencies
#' 
#' Get aos html dependencies.
#' 
#' @param use_cdn boolean. TRUE to use a Content Delivery Network (CDN), true by default, or false to use locally stored files.
#' 
#' @importFrom htmltools tagList htmlDependency
#' 
#' @rdname oas-dependencies
#' 
#' @export

html_dependencies_aos <- function(use_cdn = TRUE) {
  
  # animate.css
  if(use_cdn)
    aos_css <- htmltools::htmlDependency(
      name = "aoscss",
      version = "2.3.4",
      src = c(href = "https://unpkg.com/aos@2.3.4/dist/"),
      stylesheet = "aos.css"
    )
  else 
    aos_css <- htmltools::htmlDependency(
      name = "aoscss",
      version = "2.3.4",
      src = "",
      stylesheet = c(file = "assets/aos.css"),
      package = "aos"
    )
  
  # jquery-aniview
  if(use_cdn)
    aos_js <- htmltools::htmlDependency(
      name = "aosjs",
      version = "2.3.4",
      src = c(href = "https://unpkg.com/aos@2.3.4/dist/"),
      script = "aos.js"
    )
  else 
    aos_js <- htmltools::htmlDependency(
      name = "aosjs",
      version = "2.3.4",
      src = "",
      script = c(file = "assets/aos.js"),
      package = "aos"
    )
  
  htmltools::tagList(aos_css, aos_js)
}

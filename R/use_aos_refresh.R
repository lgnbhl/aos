#' Refresh aos
#'
#' Recalculate all offsets and positions of elements (called on window resize).
#'
#' By default AOS is watching for DOM changes and if there are any new elements loaded asynchronously or when something is removed from DOM it calls refreshHard automatically. In browsers that don't support MutationObserver like IE you might need to call AOS.refreshHard() by yourself.
#'
#' @return Javascript code
#'
#' @importFrom htmltools tags tagList
#'
#' @examples
#' use_aos_refresh()
#'
#' @export
use_aos_refresh <- function(){
  htmltools::tagList(
    html_dependencies_aos(),
    htmltools::tags$script(
      sprintf(
        "$(document).ready(function(){
            AOS.refresh();
        });",
        options
      )
    )
  )
}
  
#' Refresh hard aos
#'
#' Reinit array with AOS elements and trigger refresh (called on DOM changes that are related to aos elements)
#'
#' @return Javascript code
#'
#' @importFrom htmltools tags tagList
#'
#' @examples
#' use_aos_refresh_hard()
#'
#' @export
use_aos_refresh_hard <- function(){
  htmltools::tagList(
    html_dependencies_aos(),
    htmltools::tags$script(
      sprintf(
        "$(document).ready(function(){
            AOS.refreshHard();
        });",
        options
      )
    )
  )
}

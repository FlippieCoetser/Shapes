#' Rectangle.Coordinates.Generator'
#' 
#' @description
#' Generates a data.frame with the coordinates of a rectangle.
#'  
#' @usage NULL
#' @returns a data.frame with the coordinates of a rectangle. 
#' @export
Rectangle.Coordinates.Generator <- \(specifications) data.frame(
  x = c(0,specifications[['width']],specifications[['width']],0,0),
  y = c(0,0,specifications[['height']],specifications[['height']],0)
)
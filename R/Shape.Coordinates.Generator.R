#' Shape.Coordinates.Generator
#' 
#' @description
#'  Generates coordinates for a set of primary shapes.
#' 
#' @usage NULL
#' @export
Shape.Coordinates.Generator <- \() {
  align <- Alignment.Configurator()

  set.defaults <- \(specifications) {
    specifications[['align']] <- specifications[['align']] |> is.null() |> ifelse('corner', specifications[['align']])
    return(specifications)
  }

  generators <- list()
  generators[['Rectangle']] <- \(specifications) {
    specifications <- specifications |> set.defaults()

    coordinates <- data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    ) 

    coordinates |> align[[specifications[['align']]]]()
  }
  generators[['Circle']]    <- \(specifications) {
    specifications <- specifications |> set.defaults()

    shape   <- Shape.Utility()
    angle   <- Angle.Converter()
    convert <- Coordinate.System.Converter()

    angle  <- seq(0,360, 10) |> angle[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    coordinates <- data.frame(angle, radius) |> convert[['PolarToCartesian']]()

    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = height / 2)

    coordinates |> shape[['translate']](offset) |> align[[specifications[['align']]]]()
  }
  return(generators)
}
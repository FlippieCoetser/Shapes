#' Shape.Coordinates.Generator
#' 
#' @description
#'  Generates coordinates for a set of primary shapes.
#' 
#' @usage NULL
#' @export
Shape.Coordinates.Generator <- \() {
  generators <- list()
  generators[['Rectangle']] <- \(specifications) {
    data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    )
  }
  generators[['Circle']]    <- \(specifications) {
    shape   <- Shape.Utility()
    convert <- Angle.Converter()

    angle  <- seq(0,360, 10) |> convert[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    convert <- Coordinate.System.Converter()

    coordinates <- data.frame(angle, radius) |> convert[['PolarToCartesian']]()

    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = height / 2)

    coordinates <- coordinates |> shape[['translate']](offset)

    return(coordinates)
  }
  return(generators)
}
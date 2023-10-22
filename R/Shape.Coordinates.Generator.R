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
  generators[['Triangle']]  <- \(specifications) {
    specifications <- specifications |> set.defaults()

    coordinates <- data.frame(
      x = c(0,specifications[['base']],specifications[['base']]/2,0),
      y = c(0,0,specifications[['height']],0)
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
  generators[['Trapezoid']] <- \(specifications) {
    specifications <- specifications |> set.defaults()

    descending <- specifications[['bottom']] >= specifications[['top']] 
    ascending  <- specifications[['bottom']]  < specifications[['top']]

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    coordinates <- NULL

    if(descending) {
      coordinates <- data.frame(
        x = c(0,specifications[['bottom']],specifications[['bottom']] - difference / 2,difference / 2,0),
        y = c(0,0,specifications[['height']],specifications[['height']],0)
      )
    }

    if(ascending) {
      coordinates <- data.frame(
        x = c(difference / 2,specifications[['bottom']] + difference / 2,specifications[['top']],0,difference / 2),
        y = c(0,0,specifications[['height']],specifications[['height']],0)
      )
    }

    coordinates |> align[[specifications[['align']]]]()
  }
  generators[['Segment']]   <- \(specifications) {
    specifications <- specifications |> set.defaults()

    shape   <- Shape.Utility()
    angle   <- Angle.Converter()
    convert <- Coordinate.System.Converter()

    angle  <- seq(0,180, 10) |> angle[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    coordinates <- data.frame(angle, radius) |> convert[['PolarToCartesian']]()

    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = 0)

    coordinates |> shape[['translate']](offset) |> align[[specifications[['align']]]]()
  }
  return(generators)
}
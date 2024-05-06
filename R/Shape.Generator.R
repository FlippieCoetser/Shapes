Shape.Generator <- \() {
  validate <- Shape.Validator()
  align <- Alignment.Configurator()

  set.defaults <- \(specifications) {
    specifications[['align']] <- specifications[['align']] |> is.null() |> ifelse('corner', specifications[['align']])
    return(specifications)
  }

  generators <- list()
  generators[['Rectangle']] <- \(specifications) {
    specifications |> validate[['Rectangle']]()
    specifications <- specifications |> set.defaults()

    coordinates <- data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    ) 

    coordinates |> align[[specifications[['align']]]]()
  }
  generators[['Triangle']]  <- \(specifications) {
    specifications |> validate[['Triangle']]()
    specifications <- specifications |> set.defaults()

    coordinates <- data.frame(
      x = c(0,specifications[['base']],specifications[['base']]/2,0),
      y = c(0,0,specifications[['height']],0)
    )

    coordinates |> align[[specifications[['align']]]]()
  }
  generators[['Circle']]    <- \(specifications) {
    specifications |> validate[['Circle']]()
    specifications <- specifications |> set.defaults()

    shape   <- Shape.Utility()
    angle   <- Angle.Converter()
    convert <- Coordinate.Converter()

    angle  <- seq(0,360, 10) |> angle[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    coordinates <- data.frame(angle, radius) |> convert[['PolarToCartesian']]()

    width  <- coordinates |> shape[['Get.Width']]()
    height <- coordinates |> shape[['Get.Height']]()

    offset <- data.frame(x = width / 2, y = height / 2)

    coordinates |> shape[['Translate']](offset) |> align[[specifications[['align']]]]()
  }
  generators[['Trapezoid']] <- \(specifications) {
    specifications |> validate[['Trapezoid']]()
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
    specifications |> validate[['Segment']]()
    specifications <- specifications |> set.defaults()

    shape   <- Shape.Utility()
    angle   <- Angle.Converter()
    convert <- Coordinate.Converter()

    angle  <- seq(0,180, 10) |> angle[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    coordinates <- data.frame(angle, radius) |> convert[['PolarToCartesian']]()

    width  <- coordinates |> shape[['Get.Width']]()
    height <- coordinates |> shape[['Get.Height']]()

    offset <- data.frame(x = width / 2, y = 0)

    coordinates |> shape[['Translate']](offset) |> align[[specifications[['align']]]]()
  }
  return(generators)
}

#' Shape Generator
#'
#' This Generator Component returns a collection of geometric shape generator functions.
#' Each generator function is designed to create x, y coordinate pairs for specific geometric shapes
#' based on given specifications. It uses validators to ensure that the specifications meet
#' the requirements.
#'
#' @return A list of validator functions, which includes:
#' \describe{
#'   \item{\code{Rectangle}}{Use width and height to generate x y coordinates to plot a rectangle.}
#'   \item{\code{Triangle}}{Use base and height to generate x y coordinates to plot a triangle.}
#'   \item{\code{Circle}}{Use radius to generate x y coordinates to plot a circle.}
#'   \item{\code{Trapezoid}}{Use bottom, top and height to generate x y coordinates to plot a trapezoid.}
#'   \item{\code{Segment}}{Use radius to generate x y coordinates to plot a segment.}
#' }
#' @export
Generator <- Shape.Generator
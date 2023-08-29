Shape.Coordinates.Generator <- \() {
  generators <- list()
  generators[['Rectangle']] <- \(specifications) {
    data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    )
  }
  generators[['Circle']] <- \(specifications) {
    convert <- Angle.Converter()

    angle <- seq(0,360, 10) |> convert[['DegreesToRadians']]()
    radius <- specifications[['radius']] |> rep(length(angle))

    convert <- Coordinate.System.Converter()

    coordinates <- data.frame(angle, radius) |> 
      convert[['PolarToCartesian']]()

    return(coordinates)
  }
  return(generators)
}
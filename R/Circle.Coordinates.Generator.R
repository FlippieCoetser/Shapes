Circle.Coordinates.Generator <- \(specifications) {
  convert <- Angle.Converter()

  angle <- seq(0,360, 10) |> convert[['DegreesToRadians']]()
  radius <- specifications[['radius']] |> rep(length(angle))

  convert <- Coordinate.System.Converter()

  coordinates <- data.frame(angle, radius) |> 
    convert[['PolarToCartesian']]()

  return(coordinates)
}
Coordinate.Converter <- \() {
  converters <- list()
  converters[['PolarToCartesian']] <- \(coordinates) {
    data.frame(
      x = (coordinates[['angle']] |> cos()) * coordinates[['radius']],
      y = (coordinates[['angle']] |> sin()) * coordinates[['radius']]
    )
  }
  converters[['CartesianToPolar']] <- \(coordinates) {
    data.frame(
      radius = (coordinates[['x']]^2 + coordinates[['y']]^2) |> sqrt(),
      angle = (coordinates[['y']] / coordinates[['x']]) |> atan()
    )
  }
  return(converters)
}
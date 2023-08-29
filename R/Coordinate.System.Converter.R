Coordinate.System.Converter <- \() {
  converters <- list()
  converters[['PolarToCartesian']] <- \(coordinates) {
    data.frame(
      x = (coordinates[['angle']] |> cos()) * coordinates[['radius']],
      y = (coordinates[['angle']] |> sin()) * coordinates[['radius']]
    )
  }
  converters[['CartesianToPolar']] <- \() {}
  return(converters)
}
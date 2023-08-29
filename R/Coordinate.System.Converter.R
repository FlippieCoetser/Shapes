Coordinate.System.Converter <- \() {
  converters <- list()
  converters[['PolarToCartesian']] <- \() {}
  converters[['CartesianToPolar']] <- \() {}
  return(converters)
}
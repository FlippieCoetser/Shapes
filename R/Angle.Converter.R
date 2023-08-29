Angle.Converter <- \() {
  converters <- list()
  converters[['DegreesToRadians']] <- \(degrees) {
    degrees * pi / 180
  }
  converters[['RadiansToDegrees']] <- \() {}
  return(converters)
}
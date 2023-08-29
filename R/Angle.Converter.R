Angle.Converter <- \() {
  converters <- list()
  converters[['DegreesToRadians']] <- \(degrees) {
    degrees * pi / 180
  }
  converters[['RadiansToDegrees']] <- \(radians) {
    radians * 180 / pi
  }
  return(converters)
}
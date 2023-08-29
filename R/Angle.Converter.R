Angle.Converter <- \() {
  converters <- list()
  converters[['DegreesToRadians']] <- \() {}
  converters[['RadiansToDegrees']] <- \() {}
  return(converters)
}
Shape.Coordinates.Generator <- \() {
  generators <- list()
  generators[['Rectangle']] <- \() {}
  generators[['Circle']] <- \() {}
  return(generators)
}
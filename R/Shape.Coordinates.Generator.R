Shape.Coordinates.Generator <- \() {
  generators <- list()
  generators[['Rectangle']] <- \(specifications) {
    data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    )
  }
  generators[['Circle']] <- \() {}
  return(generators)
}
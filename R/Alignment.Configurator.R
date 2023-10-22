Alignment.Configurator <- \() {
  alignment <- list()
  alignment[['corner']]     <- \(coordinates) {
    coordinates
  }
  alignment[['origin']]     <- \() {}
  alignment[['horizontal']] <- \() {}
  alignment[['vertical']]   <- \() {}
  return(alignment)
}
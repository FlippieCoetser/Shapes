Alignment.Configurator <- \() {
  alignment <- list()
  alignment[['corner']]     <- \() {}
  alignment[['origin']]     <- \() {}
  alignment[['horizontal']] <- \() {}
  alignment[['vertical']]   <- \() {}
  return(alignment)
}
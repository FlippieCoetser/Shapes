Alignment.Configurator <- \() {
  shape <- Shape.Utility()

  alignment <- list()
  alignment[['corner']]     <- \(coordinates) {
    coordinates
  }
  alignment[['center']]     <- \(coordinates) {
    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = -width / 2, y = -height / 2)

    coordinates |> shape[['translate']](offset)
  }
  alignment[['horizontal']] <- \() {}
  alignment[['vertical']]   <- \() {}
  return(alignment)
}
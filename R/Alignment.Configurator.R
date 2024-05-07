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
  alignment[['horizontal']] <- \(coordinates) {
    width <- coordinates |> shape[['get.width']]()

    offset <- data.frame(x = -width / 2, y = 0)

    coordinates |> shape[['translate']](offset)
  }
  alignment[['vertical']]   <- \(coordinates) {
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = 0, y = -height / 2)

    coordinates |> shape[['translate']](offset)
  }
  return(alignment)
}
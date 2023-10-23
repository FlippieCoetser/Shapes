Alignment.Configurator <- \() {
  shape <- Shape.Utility()

  alignment <- list()
  alignment[['corner']]     <- \(coordinates) {
    coordinates
  }
  alignment[['center']]     <- \(coordinates) {
    width  <- coordinates |> shape[['Get.Width']]()
    height <- coordinates |> shape[['Get.Height']]()

    offset <- data.frame(x = -width / 2, y = -height / 2)

    coordinates |> shape[['Translate']](offset)
  }
  alignment[['horizontal']] <- \(coordinates) {
    width <- coordinates |> shape[['Get.Width']]()

    offset <- data.frame(x = -width / 2, y = 0)

    coordinates |> shape[['Translate']](offset)
  }
  alignment[['vertical']]   <- \(coordinates) {
    height <- coordinates |> shape[['Get.Height']]()

    offset <- data.frame(x = 0, y = -height / 2)

    coordinates |> shape[['Translate']](offset)
  }
  return(alignment)
}
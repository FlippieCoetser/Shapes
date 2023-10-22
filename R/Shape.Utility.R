Shape.Utility <- \() {
  utilities <- list()
  utilities[['get.width']]  <- \(coordinates) {
    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()
    (max.x - min.x)
  }
  utilities[['get.height']] <- \() {}
  return(utilities)
}
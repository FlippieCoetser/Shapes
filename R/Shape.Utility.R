Shape.Utility <- \() {
  utilities <- list()
  utilities[['get.width']]  <- \(coordinates) {
    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()
    (max.x - min.x)
  }
  utilities[['get.height']] <- \(coordinates) {
    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()
    (max.y - min.y)
  }
  utilities[['translate']]  <- \(coordinates, offset) {
    coordinates[['x']] <- coordinates[['x']] + offset[['x']]
    coordinates[['y']] <- coordinates[['y']] + offset[['y']]
    coordinates
  }
  return(utilities)
}
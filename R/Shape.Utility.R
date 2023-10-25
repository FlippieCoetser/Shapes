#' Shape.Utility
#' 
#' @description
#'  Set of Shape Utilities:
#' - Get.Width
#' - Get.Height
#' - Translate
#' 
#' @usage NULL
#' @export
Shape.Utility <- \() {
  utilities <- list()
  utilities[['Get.Width']]     <- \(coordinates) {
    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()
    (max.x - min.x)
  }
  utilities[['Get.Height']]    <- \(coordinates) {
    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()
    (max.y - min.y)
  }
  utilities[['Translate']]     <- \(coordinates, offset) {
    data.frame(
      x = coordinates[['x']] + offset[['x']],
      y = coordinates[['y']] + offset[['y']] 
    )
  }
  utilities[['Shrink.Height']] <- \(coordinates, amount) {
    values  <- coordinates[['y']]
    floor   <- values |> min()
    ceiling <- values |> max()

    amount <- amount |> min(ceiling - floor)
           
    values[values > floor]  <- values[values > floor] - amount

    coordinates[['y']] <- values

    coordinates
  }
  return(utilities)
}
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
  utilities[['Get.Width']]  <- \(coordinates) {
    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()
    (max.x - min.x)
  }
  utilities[['Get.Height']] <- \(coordinates) {
    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()
    (max.y - min.y)
  }
  utilities[['Translate']]  <- \(coordinates, offset) {
    data.frame(
      x = coordinates[['x']] + offset[['x']],
      y = coordinates[['y']] + offset[['y']] 
    )
  }
  return(utilities)
}
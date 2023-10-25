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
  utilities[['Join']]          <- \(coordinates.one, coordinates.two) {
    intersection <-
      coordinates.one |>
        dplyr::mutate(id = 1:dplyr::n()) |>
        dplyr::inner_join(coordinates.two, by = c('x','y')) |>
        unique()

    intersection.start <- intersection[which.min(intersection[['id']]),3]
    intersection.end   <- intersection[which.max(intersection[['id']]),3]

    start <- coordinates.one[0:intersection.start,]
    end   <- coordinates.one[-(0:(intersection.end-1)),]

    addon <- coordinates.two |> dplyr::anti_join(intersection, by = c('x','y'))    

    start |> rbind(addon) |> rbind(end)
  }
  return(utilities)
}
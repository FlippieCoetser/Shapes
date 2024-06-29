Shape.Utility <- \() {
  coordinates.validate <- Coordinates.Validator()

  utilities <- list()
  utilities[['get.width']]     <- \(coordinates) {
    coordinates |> coordinates.validate[['Coordinates']]()

    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()
    (max.x - min.x)
  }
  utilities[['get.height']]    <- \(coordinates) {
    coordinates |> coordinates.validate[['Coordinates']]()

    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()
    (max.y - min.y)
  }
  utilities[['translate']]     <- \(coordinates, offset) {
    coordinates |> coordinates.validate[['Coordinates']]()

    data.frame(
      x = coordinates[['x']] + offset[['x']],
      y = coordinates[['y']] + offset[['y']] 
    )
  }
  utilities[['translate.x']]   <- \(coordinates, x) {
    coordinates |> coordinates.validate[['Coordinates']]()

    data.frame(
      x = coordinates[['x']] + x,
      y = coordinates[['y']]
    )
  }
  utilities[['translate.y']]   <- \(coordinates, y) {
    coordinates |> coordinates.validate[['Coordinates']]()

    data.frame(
      x = coordinates[['x']],
      y = coordinates[['y']] + y
    )
  }
  utilities[['shrink']]        <- \(coordinates, amount) {
    coordinates |> 
      utilities[['shrink.height']](amount) |> 
      utilities[['shrink.width']](amount)
  }
  utilities[['shrink.height']] <- \(coordinates, amount) {
    values  <- coordinates[['y']]
    floor   <- values |> min()
    ceiling <- values |> max()

    amount <- amount |> min(ceiling - floor)
           
    values[values > floor]  <- values[values > floor] - amount

    coordinates[['y']] <- values

    coordinates
  }
  utilities[['shrink.width']]  <- \(coordinates, amount) {
    values  <- coordinates[['x']]
    floor   <- values |> min()
    ceiling <- values |> max()

    amount <- amount |> min(ceiling - floor)
           
    values[values > floor]  <- values[values > floor] - amount

    coordinates[['x']] <- values

    coordinates
  }
  utilities[['join']]          <- \(coordinates.one, coordinates.two) {
    if(coordinates.two |> length() == 0) return(coordinates.one)

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

#' Shape.Utility
#' 
#' @description
#'  Set of Shape Utilities:
#' - get.width
#' - get.height
#' - translate
#' - translate.x
#' - translate.y
#' - shrink.height
#' - join
#' 
#' @usage NULL
#' @export
Utility <- Shape.Utility
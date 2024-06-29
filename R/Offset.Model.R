Offset.Model <- \(data) {
  if(data[['x']] |> is.null()) data[['x']] <- 0
  if(data[['y']] |> is.null()) data[['y']] <- 0
  
  data.frame(
    x = data[['x']],
    y = data[['y']] 
  )
}

#' Offset
#' 
#' @description
#'  Model use to create a offset instance
#' 
#' @usage NULL
#' @export
Offset <- Offset.Model
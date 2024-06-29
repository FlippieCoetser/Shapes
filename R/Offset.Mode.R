Offset.Model <- \(data) {
  if(data[['x']] |> is.null()) data[['x']] <- 0
  if(data[['y']] |> is.null()) data[['y']] <- 0
  
  data.frame(
    x = data[['x']],
    y = data[['y']] 
  )
}
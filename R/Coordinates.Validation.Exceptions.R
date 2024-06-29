Coordinates.Validation.Exceptions <- \() {
  exceptions <- list() 
  exceptions[['Coordinates.NULL']] <- \(invoke) {
    if(invoke) stop('Coordinates.NULL: Coordinates does not exist.', call. = FALSE)
   } 
  return(exceptions)
}
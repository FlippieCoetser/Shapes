Offset.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Offset.NULL']]    <- \(invoke) {
    if(invoke) stop('Offset.NULL: Offset does not exist.', call. = FALSE)
   }
  exceptions[['Attribute.NULL']] <- \(invoke, attribute) {
    if(invoke) stop("Attribute.NULL: '", attribute,"' does not exist.", call. = FALSE)
  }
  return(exceptions)
}
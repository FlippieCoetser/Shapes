Offset.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Offset.NULL']]    <- \(invoke) {
    if(invoke) stop('Offset.NULL: Offset does not exist.', call. = FALSE)
   }
  exceptions[['Attribute.NULL']] <- \() {}
  return(exceptions)
}
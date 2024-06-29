Offset.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Offset.NULL']]    <- \() { }
  exceptions[['Attribute.NULL']] <- \() {}
  return(exceptions)
}
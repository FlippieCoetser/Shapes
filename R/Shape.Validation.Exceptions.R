Shape.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Rectangle.NULL']] <- \() {}
  exceptions[['Triangle.NULL']]  <- \() {}
  return(exceptions)
}
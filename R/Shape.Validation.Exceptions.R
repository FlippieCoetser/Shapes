Shape.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Rectangle.NULL']] <- \() {}
  exceptions[['Triangle.NULL']]  <- \() {}
  exceptions[['Circle.NULL']]    <- \() {}
  return(exceptions)
}
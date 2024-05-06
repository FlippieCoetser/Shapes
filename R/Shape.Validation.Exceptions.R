Shape.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Rectangle.NULL']] <- \() {}
  exceptions[['Triangle.NULL']]  <- \() {}
  exceptions[['Circle.NULL']]    <- \() {}
  exceptions[['Trapezoid.NULL']] <- \() {}
  exceptions[['Segment.NULL']]   <- \() {}
  exceptions[['Attribute.NULL']] <- \() {}
  return(exceptions)
}
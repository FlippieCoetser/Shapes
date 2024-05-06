Shape.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Rectangle.NULL']] <- \(invoke) {
    if(invoke) stop('Rectangle.NULL: Rectangle Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Triangle.NULL']]  <- \(invoke) {
    if(invoke) stop('Triangle.NULL: Triangle Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Circle.NULL']]    <- \() {}
  exceptions[['Trapezoid.NULL']] <- \() {}
  exceptions[['Segment.NULL']]   <- \() {}
  exceptions[['Attribute.NULL']] <- \() {}
  return(exceptions)
}
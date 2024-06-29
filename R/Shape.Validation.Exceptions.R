Shape.Validation.Exceptions <- \() {
  exceptions <- list()
  exceptions[['Line.NULL']]       <- \(invoke) {
    if(invoke) stop('Line.NULL: Line Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Rectangle.NULL']] <- \(invoke) {
    if(invoke) stop('Rectangle.NULL: Rectangle Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Triangle.NULL']]  <- \(invoke) {
    if(invoke) stop('Triangle.NULL: Triangle Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Circle.NULL']]    <- \(invoke) {
    if(invoke) stop('Circle.NULL: Circle Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Trapezoid.NULL']] <- \(invoke) {
    if(invoke) stop('Trapezoid.NULL: Trapezoid Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Segment.NULL']]   <- \(invoke) {
    if(invoke) stop('Segment.NULL: Segment Specifications does not exist.', call. = FALSE)
  }
  exceptions[['Attribute.NULL']] <- \(invoke, attribute) {
    if(invoke) stop("Attribute.NULL: '", attribute,"' does not exist.", call. = FALSE)
  }
  return(exceptions)
}
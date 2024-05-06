Shape.Validator <- \() {
  exceptions <- Shape.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Rectangle']]  <- \(specifications) {
    specifications |> validators[['is.not.NULL']]('Rectangle') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[['Rectangle.NULL']]()})
    return(specifications)
  }
  validators[['Triangle']]   <- \() {}
  validators[['Circle']]     <- \() {}
  validators[['Trapezoid']]  <- \() {}
  validators[['Segment']]    <- \() {}
  validators[['has.width']]  <- \(specifications) {
    specifications[['width']] |> validators[['is.not.NULL']]('width') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('width')})
    return(specifications)
  }
  validators[['has.height']] <- \() {}
  validators[['has.base']]   <- \() {}
  validators[['has.radius']] <- \() {}
  validators[['has.bottom']] <- \() {}
  validators[['has.top']]    <- \() {}
  return(validators)
}
Shape.Validator <- \() {
  exceptions <- Shape.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Rectangle']]  <- \(specifications) {
    specifications |> validators[['is.not.NULL']]('Rectangle') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[['Rectangle.NULL']]()})
  }
  validators[['Triangle']]   <- \() {}
  validators[['Circle']]     <- \() {}
  validators[['Trapezoid']]  <- \() {}
  validators[['Segment']]    <- \() {}
  validators[['has.width']]  <- \() {}
  validators[['has.height']] <- \() {}
  validators[['has.base']]   <- \() {}
  validators[['has.radius']] <- \() {}
  validators[['has.bottom']] <- \() {}
  validators[['has.top']]    <- \() {}
  return(validators)
}
Shape.Validator <- \() {
  validators <- Validate::Validator()
  validators[['Rectangle']]  <- \(specifications) {
    specifications |> validators[['is.not.NULL']]('Rectangle Specifications')
  }
  validators[['Triangle']]   <- \() {}
  validators[['Circle']]     <- \() {}
  validators[['Trapezoid']]  <- \() {}
  validators[['Segment']]    <- \() {}
  validators[['has.width']]  <- \() {}
  validators[['has.height']] <- \() {}
  validators[['has.base']]   <- \() {}
  validators[['has.radius']] <- \() {}
  return(validators)
}
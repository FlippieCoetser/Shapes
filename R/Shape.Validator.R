Shape.Validator <- \() {
  validators <- Validate::Validator()
  validators[['Rectangle']] <- \() {}
  validators[['Triangle']]  <- \() {}
  validators[['Circle']]    <- \() {}
  validators[['Trapezoid']] <- \() {}
  validators[['Segment']]   <- \() {}
  return(validators)
}
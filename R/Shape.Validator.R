Shape.Validator <- \() {
  validators <- Validate::Validator()
  validators[['Rectangle']] <- \() {}
  validators[['Triangle']]  <- \() {}
  return(validators)
}
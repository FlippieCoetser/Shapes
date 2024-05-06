Shape.Validator <- \() {
  validators <- Validate::Validator()
  validators[['Rectangle']] <- \() {}
  return(validators)
}
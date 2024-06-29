Offset.Validator <- \() {
  exceptions <- Offset.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['exists']]      <- \(offset, exception) { 
    offset |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(offset)
  }
  return(validators)
}
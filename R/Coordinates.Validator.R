Coordinates.Validator <- \() {
  exceptions <- Coordinates.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['exists']]     <- \(coordinates, exception) { 
    coordinates |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(coordinates)
  }
  return(validators)
}
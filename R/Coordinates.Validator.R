Coordinates.Validator <- \() {
  exceptions <- Coordinates.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['exists']]     <- \(coordinates, exception) { 
    coordinates |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(coordinates)
  }
  validators[['has.x']]      <- \(coordinates) {
    coordinates[['x']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('x')})
    return(coordinates)
  }
  validators[['has.y']]      <- \() {}
  return(validators)
}
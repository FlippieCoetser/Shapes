Coordinates.Validator <- \() {
  exceptions <- Coordinates.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Coordinates']] <- \() {}
  validators[['exists']]      <- \(coordinates, exception) { 
    coordinates |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(coordinates)
  }
  validators[['has.x']]       <- \(coordinates) {
    coordinates[['x']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('x')})
    return(coordinates)
  }
  validators[['has.y']]       <- \(coordinates) {
    coordinates[['y']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('y')})
    return(coordinates)
  }
  return(validators)
}
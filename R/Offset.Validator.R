Offset.Validator <- \() {
  exceptions <- Offset.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Offset']] <- \(offset) {
    offset |> validators[['exists']]('Offset.NULL') 
    offset |> validators[['has.x']]()
    offset |> validators[['has.y']]()
    return(offset)
  }
  validators[['exists']] <- \(offset, exception) { 
    offset |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(offset)
  }
  validators[['has.x']]  <- \(offset) {
    offset[['x']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('x')})
    return(offset)
  }
  validators[['has.y']]  <- \(offset) {
    offset[['y']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('y')})
    return(offset)
  }
  return(validators)
}
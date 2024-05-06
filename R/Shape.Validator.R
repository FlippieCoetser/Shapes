Shape.Validator <- \() {
  exceptions <- Shape.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Rectangle']]  <- \(specifications) {
    specifications |> validators[['exists']]('Rectangle.NULL') 
    specifications |> validators[['has.width']]()
    specifications |> validators[['has.height']]()
    return(specifications)
  }
  validators[['Triangle']]   <- \(specifications) {
    specifications |> validators[['exists']]('Triangle.NULL') 
    specifications |> validators[['has.base']]()
    specifications |> validators[['has.height']]()
    return(specifications)
  }
  validators[['Circle']]     <- \(specifications) {
    specifications |> validators[['exists']]('Circle.NULL') 
    return(specifications)
  }
  validators[['Trapezoid']]  <- \() {}
  validators[['Segment']]    <- \() {}
  validators[['exists']]     <- \(specifications, exception) {
    specifications |> validators[['is.not.NULL']]('') |> 
      tryCatch(error = \(...){ TRUE |> exceptions[[exception]]()})
    return(specifications)
  }
  validators[['has.width']]  <- \(specifications) {
    specifications[['width']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('width')})
    return(specifications)
  }
  validators[['has.height']] <- \(specifications) {
    specifications[['height']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('height')})
    return(specifications)
  }
  validators[['has.base']]   <- \(specifications) {
    specifications[['base']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('base')})
    return(specifications)
  }
  validators[['has.radius']] <- \(specifications) {
    specifications[['radius']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('radius')})
    return(specifications)
  }
  validators[['has.bottom']] <- \() {}
  validators[['has.top']]    <- \() {}
  return(validators)
}
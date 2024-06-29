#' Shape Specification Validator
#'
#' This component creates a collection of geometric shape specification validators.
#' It includes validators for basic shape properties such as dimensions and existence checks.
#' The function returns a list of validator functions, each tailored to a specific shape type.
#'
#' @return A list of validator functions for different shapes. Each validator function takes
#'   a `specifications` list as an argument, which should contain the attributes of the shape
#'   to validate. Each validator ensures that the necessary attributes are present and not NULL.
#'   If a validation fails, an appropriate exception is thrown. A list of validator functions, which includes:
#'
#' \describe{
#'   \item{\code{Rectangle}}{Validate if specifications has width and height attributes.}
#'   \item{\code{Triangle}}{Validate if specifications has base and height attributes.}
#'   \item{\code{Circle}}{Validates if specifications has radius attribute.}
#'   \item{\code{Trapezoid}}{Validates if specifications has bottom, top, and height attributes.}
#'   \item{\code{Segment}}{Validates if specifications has radius attribute.}
#' }
#' @export
Shape.Validator <- \() {
  exceptions <- Shape.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Line']]       <- \(specifications) {
    specifications |> validators[['exists']]('Line.NULL') 
    specifications |> validators[['has.length']]()
    return(specifications)
  }
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
    specifications |> validators[['has.radius']]() 
    return(specifications)
  }
  validators[['Trapezoid']]  <- \(specifications) {
    specifications |> validators[['exists']]('Trapezoid.NULL')
    specifications |> validators[['has.bottom']]()
    specifications |> validators[['has.top']]()
    specifications |> validators[['has.height']]()
    return(specifications)
  }
  validators[['Segment']]    <- \(specifications) {
    specifications |> validators[['exists']]('Segment.NULL')
    specifications |> validators[['has.radius']]()
    return(specifications)
  }
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
  validators[['has.bottom']] <- \(specifications) {
    specifications[['bottom']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('bottom')})
    return(specifications)
  }
  validators[['has.top']]    <- \(specifications) {
    specifications[['top']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('top')})
    return(specifications)
  }
  validators[['has.length']] <- \(specifications) {
    specifications[['length']] |> validators[['is.not.NULL']]('') |>
      tryCatch(error = \(...){ TRUE |> exceptions[['Attribute.NULL']]('length')})
    return(specifications)
  }
  return(validators)
}

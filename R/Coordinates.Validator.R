#' Coordinates Validator
#'
#' This component contains all needed validators to check if coordinates are .valid.factor(

#' @return A list of validator functions to validate different aspects of coordinates. :
#'
#' \describe{
#'   \item{\code{Coordinates}}{Validate if coordinates exists and has x and y attributes.}
#'   \item{\code{exists}}{Validate if coordinates exists.}
#'   \item{\code{has.x}}{Validates if coordinates has x attribute.}
#'   \item{\code{has.y}}{Validates if coordinates has y attribute.}
#' }
#' @export
Coordinates.Validator <- \() {
  exceptions <- Coordinates.Validation.Exceptions()

  validators <- Validate::Validator()
  validators[['Coordinates']] <- \(coordinates) {
    coordinates |> validators[['exists']]('Coordinates.NULL') 
    coordinates |> validators[['has.x']]()
    coordinates |> validators[['has.y']]()
    return(coordinates)
  }
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

#' Offset Validator
#'
#' This component contains all needed validators to check if an offset is.

#' @return A list of validator functions to validate different aspects of offset:
#'
#' \describe{
#'   \item{\code{Offset}}{Validate if offset exists and has x and y attributes.}
#'   \item{\code{exists}}{Validate if offset exists.}
#'   \item{\code{has.x}}{Validates if offset has x attribute.}
#'   \item{\code{has.y}}{Validates if offset has y attribute.}
#' }
#' @export
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
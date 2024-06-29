describe('Coordinates.Validator',{
  it('exist',{
    Coordinates.Validator |> expect.exist()
  })
})

describe("When validators <- Coordinates.Validator()",{
  it("then validators is a list",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators |> expect.list()
  })
  it("then validators contains 'exists' validator",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators[['exists']] |> expect.function()
  })
})

describe("When coordinates |> validate[['exists']]('Coordinates.NULL')",{
  it("then no exception is thrown if coordinates is not NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- list()

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.no.error()
  })
  it("then a Coordinates.NULL exception is thrown if coordinates is NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Coordinates.NULL: Coordinates does not exist."

    # WHEN
    coordinates <- NULL

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.error(expected.error)
  })
  it("then coordinates is return if coordinates is not NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- list()

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.equal(coordinates)
  })
})

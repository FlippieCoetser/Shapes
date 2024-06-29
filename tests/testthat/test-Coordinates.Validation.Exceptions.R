describe('Coordinates.Validation.Exceptions',{
  it('exist',{
    Coordinates.Validation.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Coordinates.Validation.Exceptions()",{
  it("then exceptions is a list",{
    # When
    exceptions <- Coordinates.Validation.Exceptions()

    # Then
    exceptions |> expect.list()
  })
    it("then exceptions contains 'Coordinates.NULL' exception",{
    # WHEN
    exceptions <- Coordinates.Validation.Exceptions()

    # THEN
    exceptions[['Coordinates.NULL']] |> expect.exist()
  })
})

describe("When input |> exceptions[['Coordinates.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Coordinates.Validation.Exceptions()


    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Coordinates.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Coordinates.Validation.Exceptions()


    expected.exception <- 'Coordinates.NULL: Coordinates does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Coordinates.NULL']]() |> expect.error(expected.exception)
  })
})
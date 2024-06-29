describe("Offset.Validation.Exceptions",{
  it("exist",{
    Offset.Validation.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Offset.Validation.Exceptions()",{
  it("then exception is a list",{
    # Given
    exceptions <- Offset.Validation.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exception has Offset.NULL",{
    # Given
    exceptions <- Offset.Validation.Exceptions()

    # Then
    exceptions[['Offset.NULL']] |> expect.function()
  })
  it("then exception has Attribute.NULL",{
    # Given
    exceptions <- Offset.Validation.Exceptions()

    # Then
    exceptions[['Attribute.NULL']] |> expect.function()
  })
})

describe("When input |> exceptions[['Offset.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Offset.Validation.Exceptions()


    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Offset.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Offset.Validation.Exceptions()


    expected.exception <- 'Offset.NULL: Offset does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Offset.NULL']]() |> expect.error(expected.exception)
  })
})
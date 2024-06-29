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
})
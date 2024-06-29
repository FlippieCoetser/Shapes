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
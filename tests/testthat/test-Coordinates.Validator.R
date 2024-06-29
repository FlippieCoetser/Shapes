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

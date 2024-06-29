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
  
})

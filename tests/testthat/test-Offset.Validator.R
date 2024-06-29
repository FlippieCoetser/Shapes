describe("Offset.Validator",{
  it('exists',{
    Offset.Validator |> expect.exist()
  })
})

describe("When validators <- Offset.Validator()",{
  it('then validators is a list',{
    # GIVEN
    validators <- Offset.Validator()
    
    # THEN
    validators |> expect.list()
  })
})
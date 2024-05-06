describe("Shape.Validator",{
  it("exist",{
    Shape.Validator |> expect.exist()
  })
})

describe("When validators <- Shape.Validator()",{
  it("then validators is a list",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators |> expect.list()
  })
})
describe("Shape.Validation.Exceptions",{
  it("exist",{
    Shape.Validation.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Shape.Validation.Exceptions()",{
  it("then exceptions is a list",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions |> expect.list()
  })
})
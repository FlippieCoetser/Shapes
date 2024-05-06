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
  it("then exceptions contains 'Rectangle.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Rectangle.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'Triangle.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Triangle.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'Circle.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Circle.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'Trapezoid.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Trapezoid.NULL']] |> expect.exist()
  })
})
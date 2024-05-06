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
  it("then validators contains 'Rectangle' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Rectangle']] |> expect.exist()
  })
  it("then validators contains 'Triangle' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Triangle']] |> expect.exist()
  })
  it("then validators contains 'Circle' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Circle']] |> expect.exist()
  })
  it("then validators contains 'Trapezoid' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Trapezoid']] |> expect.exist()
  })
})
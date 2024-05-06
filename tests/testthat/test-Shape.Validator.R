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
  it("then validators contains 'Segment' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Segment']] |> expect.exist()
  })
  it("then validators contains 'has.width' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.width']] |> expect.exist()
  })
  it("then validators contains 'has.height' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.height']] |> expect.exist()
  })
})

describe("When specifications |> Shape.Validator[['Rectangle']]()",{
  it("then no exception is thrown if specifications are valid",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['width']]  <- 10
    specifications[['height']] <- 10

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Argument.NULL: 'Rectangle Specifications' cannot not be NULL."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.error(expected.error)
  })
})
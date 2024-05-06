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
  it("then validators contains 'has.base' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.base']] |> expect.exist()
  })
  it("then validators contains 'has.radius' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.radius']] |> expect.exist()
  })
  it("then validators contains 'has.bottom' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.bottom']] |> expect.exist()
  })
  it("then validators contains 'has.top' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.top']] |> expect.exist()
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

    expected.error <- "Rectangle.NULL: Rectangle Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.width']]()",{
  it("then no exception is thrown if specifications has width",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['width']] <- 10

    # THEN
    specifications |> validate[['has.width']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no width",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'width' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.width']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has width",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['width']] <- 10

    # THEN
    specifications |> validate[['has.width']]() |> expect.equal(specifications)
  })
})

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
  it("then exceptions contains 'Segment.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Segment.NULL']] |> expect.exist()
  })
  it("then exceptions contains 'Attribute.NULL' exception",{
    # WHEN
    exceptions <- Shape.Validation.Exceptions()

    # THEN
    exceptions[['Attribute.NULL']] |> expect.exist()
  })
})

describe("When input |> exceptions[['Rectangle.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Rectangle.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    expected.exception <- 'Rectangle.NULL: Rectangle Specifications does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Rectangle.NULL']]() |> expect.error(expected.exception)
  })
})

describe("When input |> exceptions[['Triangle.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Triangle.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    expected.exception <- 'Triangle.NULL: Triangle Specifications does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Triangle.NULL']]() |> expect.error(expected.exception)
  })
})

describe("When input |> exceptions[['Circle.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Circle.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- TRUE

    expected.exception <- 'Circle.NULL: Circle Specifications does not exist.'

    # THEN
    input |> exceptions[['Circle.NULL']]() |> expect.error(expected.exception)
  })
})

describe("When input |> exceptions[['Trapezoid.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Trapezoid.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    expected.exception <- 'Trapezoid.NULL: Trapezoid Specifications does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Trapezoid.NULL']]() |> expect.error(expected.exception)
  })
})

describe("When input |> exceptions[['Segment.NULL']]()",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE

    # THEN
    input |> exceptions[['Segment.NULL']]() |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    expected.exception <- 'Segment.NULL: Segment Specifications does not exist.'

    # WHEN
    input <- TRUE

    # THEN
    input |> exceptions[['Segment.NULL']]() |> expect.error(expected.exception)
  })
})

describe("When input |> exceptions[['Attribute.NULL']]('attribute')",{
  it("then an exceptions is thrown if input is FALSE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    # WHEN
    input <- FALSE
    attribute <- 'attribute'

    # THEN
    input |> exceptions[['Attribute.NULL']](attribute) |> expect.no.error()
  })
  it("then an exceptions is thrown if input is TRUE",{
    # GIVEN
    exceptions <- Shape.Validation.Exceptions()

    expected.exception <- "Attribute.NULL: 'attribute' does not exist."

    # WHEN
    input <- TRUE
    attribute <- 'attribute'

    # THEN
    input |> exceptions[['Attribute.NULL']](attribute) |> expect.error(expected.exception)
  })
})
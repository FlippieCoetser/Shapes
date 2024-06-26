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
  it("then validators contains 'Line' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['Line']] |> expect.exist()
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
  it("then validators contains 'exists' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['exists']] |> expect.exist()
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
  it("then validators contains 'has.length' validator",{
    # WHEN
    validators <- Shape.Validator()

    # THEN
    validators[['has.length']] |> expect.exist()
  })
})

describe("When specifications |> Shape.Validator[['Line']]()",{
  it("then an exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Line.NULL: Line Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Line']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no length",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'length' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Line']]() |> expect.error(expected.error)
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
  it("then an exception is thrown if specifications has no width",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'width' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no height",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'height' does not exist."

    # WHEN
    specifications <- list()
    specifications[['width']]  <- 10

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['width']]  <- 10
    specifications[['height']] <- 10

    # THEN
    specifications |> validate[['Rectangle']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['exists']]('Rectangle.NULL')",{
  it("then no exception is thrown if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['exists']]('exception') |> expect.no.error()
  })
  it("then a Rectangle.NULL exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Rectangle.NULL: Rectangle Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['exists']]('Rectangle.NULL') |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['exists']]('Rectangle.NULL') |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.width']]()",{
  it("then no exception is thrown if specifications has width",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['width']]  <- 10

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
    specifications[['width']]  <- 10

    # THEN
    specifications |> validate[['has.width']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.height']]()",{
  it("then no exception is thrown if specifications has height",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['height']]  <- 10

    # THEN
    specifications |> validate[['has.height']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no height",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'height' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.height']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has height",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['height']]  <- 10

    # THEN
    specifications |> validate[['has.height']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> Shape.Validator[['Triangle']]()",{
  it("then no exception is thrown if specifications are valid",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['base']]  <- 10
    specifications[['height']] <- 10

    # THEN
    specifications |> validate[['Triangle']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Triangle.NULL: Triangle Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Triangle']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no base",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'base' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Triangle']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no height",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'height' does not exist."

    # WHEN
    specifications <- list()
    specifications[['base']]  <- 10

    # THEN
    specifications |> validate[['Triangle']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['base']]  <- 10
    specifications[['height']] <- 10

    # THEN
    specifications |> validate[['Triangle']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.base']]()",{
  it("then no exception is thrown if specifications has base",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['base']]  <- 10

    # THEN
    specifications |> validate[['has.base']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no base",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'base' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.base']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has base",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['base']]  <- 10

    # THEN
    specifications |> validate[['has.base']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['Circle']]()",{
  it("then an Circle.NULL exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Circle.NULL: Circle Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Circle']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no radius",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'radius' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Circle']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is not NULL",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['radius']]  <- 10

    # THEN
    specifications |> validate[['Circle']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.radius']]()",{
  it("then no exception is thrown if specifications has radius",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['radius']]  <- 10

    # THEN
    specifications |> validate[['has.radius']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no radius",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'radius' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.radius']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has radius",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['radius']]  <- 10

    # THEN
    specifications |> validate[['has.radius']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['Trapezoid']]()",{
  it("then an Trapezoid.NULL exception is thrown if specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Trapezoid.NULL: Trapezoid Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Trapezoid']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no bottom",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'bottom' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Trapezoid']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no top",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'top' does not exist."

    # WHEN
    specifications <- list()
    specifications[['bottom']]  <- 10

    # THEN
    specifications |> validate[['Trapezoid']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no height",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'height' does not exist."

    # WHEN
    specifications <- list()
    specifications[['bottom']]  <- 10
    specifications[['top']]     <- 10

    # THEN
    specifications |> validate[['Trapezoid']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is valid",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['bottom']]  <- 10
    specifications[['top']]     <- 10
    specifications[['height']]  <- 10

    # THEN
    specifications |> validate[['Trapezoid']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.bottom']]()",{
  it("then no exception is thrown if specifications has bottom",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['bottom']]  <- 10

    # THEN
    specifications |> validate[['has.bottom']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no bottom",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'bottom' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.bottom']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has bottom",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['bottom']]  <- 10

    # THEN
    specifications |> validate[['has.bottom']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.top']]()",{
  it("then no exception is thrown if specifications has top",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['top']]  <- 10

    # THEN
    specifications |> validate[['has.top']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no top",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'top' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.top']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has top",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['top']]  <- 10

    # THEN
    specifications |> validate[['has.top']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['has.length']]()",{
  it("then no exception is thrown if specifications has length",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['length']]  <- 10

    # THEN
    specifications |> validate[['has.length']]() |> expect.no.error()
  })
  it("then an exception is thrown if specifications has no length",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'length' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['has.length']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications has length",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['length']]  <- 10

    # THEN
    specifications |> validate[['has.length']]() |> expect.equal(specifications)
  })
})

describe("When specifications |> validate[['Segment']]()",{
  it("then an exception is thrown is specifications is NULL",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Segment.NULL: Segment Specifications does not exist."

    # WHEN
    specifications <- NULL

    # THEN
    specifications |> validate[['Segment']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if specifications has no radius",{
    # GIVEN
    validate <- Shape.Validator()

    expected.error <- "Attribute.NULL: 'radius' does not exist."

    # WHEN
    specifications <- list()

    # THEN
    specifications |> validate[['Segment']]() |> expect.error(expected.error)
  })
  it("then specifications is return if specifications is valid",{
    # GIVEN
    validate <- Shape.Validator()

    # WHEN
    specifications <- list()
    specifications[['radius']]  <- 10

    # THEN
    specifications |> validate[['Segment']]() |> expect.equal(specifications)
  })
})
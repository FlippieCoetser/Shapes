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
  it("then validators contains 'Coordinates' validator",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators[['Coordinates']] |> expect.function()
  })
  it("then validators contains 'exists' validator",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators[['exists']] |> expect.function()
  })
  it("then validators contains 'has.x' validator",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators[['has.x']] |> expect.function()
  })
  it("then validators contains 'has.y' validator",{
    # When
    validators <- Coordinates.Validator()

    # Then
    validators[['has.y']] |> expect.function()
  })
})

describe("When coordinates |> validate[['Coordinates']]()",{
  it("then no exception is thrown if coordinates is valid",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(x=1, y=1)

    # THEN
    coordinates |> validate[['Coordinates']]() |> expect.no.error()
  })
  it("then a Coordinates.NULL exception is thrown if coordinates is NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Coordinates.NULL: Coordinates does not exist."

    # WHEN
    coordinates <- NULL

    # THEN
    coordinates |> validate[['Coordinates']]() |> expect.error(expected.error)
  })
  it("then a Attribute.NULL exception is thrown if coordinates has no x attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Attribute.NULL: 'x' does not exist"

    # WHEN
    coordinates <- data.frame(y=1)

    # THEN
    coordinates |> validate[['Coordinates']]() |> expect.error(expected.error)
  })
  it("then a Attribute.NULL exception is thrown if coordinates has no y attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Attribute.NULL: 'y' does not exist"

    # WHEN
    coordinates <- data.frame(x=1)

    # THEN
    coordinates |> validate[['Coordinates']]() |> expect.error(expected.error)
  })
  it("then coordinates is return if coordinates is valid",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(x=1, y=1)

    # THEN
    coordinates |> validate[['Coordinates']]() |> expect.equal(coordinates)
  })
})

describe("When coordinates |> validate[['exists']]('Coordinates.NULL')",{
  it("then no exception is thrown if coordinates is not NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- list()

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.no.error()
  })
  it("then a Coordinates.NULL exception is thrown if coordinates is NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Coordinates.NULL: Coordinates does not exist."

    # WHEN
    coordinates <- NULL

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.error(expected.error)
  })
  it("then coordinates is return if coordinates is not NULL",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- list()

    # THEN
    coordinates |> validate[['exists']]('Coordinates.NULL') |> expect.equal(coordinates)
  })
})

describe("When coordinates |> validate[['has.x']]()",{
  it("then no exception is thrown if coordinates has a x attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(x=1)

    # THEN
    coordinates |> validate[['has.x']]() |> expect.no.error()
  })
  it("then a Attribute.NULL exception is thrown if coordinates has no x attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Attribute.NULL: 'x' does not exist"

    # WHEN
    coordinates <- data.frame()

    # THEN
    coordinates |> validate[['has.x']]() |> expect.error(expected.error)
  })
  it("then coordinates is return if coordinates has x attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(x=1)

    # THEN
    coordinates |> validate[['has.x']]() |> expect.equal(coordinates)
  })
})

describe("When coordinates |> validate[['has.y']]()",{
  it("then no exception is thrown if coordinates has a y attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(y=1)

    # THEN
    coordinates |> validate[['has.y']]() |> expect.no.error()
  })
  it("then a Attribute.NULL exception is thrown if coordinates has no y attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    expected.error <- "Attribute.NULL: 'y' does not exist"

    # WHEN
    coordinates <- data.frame()

    # THEN
    coordinates |> validate[['has.y']]() |> expect.error(expected.error)
  })
  it("then coordinates is return if coordinates has y attribute",{
    # GIVEN
    validate <- Coordinates.Validator()

    # WHEN
    coordinates <- data.frame(y=1)

    # THEN
    coordinates |> validate[['has.y']]() |> expect.equal(coordinates)
  })
})
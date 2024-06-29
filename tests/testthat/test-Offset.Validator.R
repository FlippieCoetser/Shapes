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
  it("then validators contains 'exists' validator",{
    # When
    validators <- Offset.Validator()

    # Then
    validators[['exists']] |> expect.function()
  })
})

describe("When offset |> validate[['Offset']]()",{
  it("then no exception is thrown if offset is valid",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    coordinates <- data.frame(x=1, y=1)

    # THEN
    coordinates |> validate[['Offset']]() |> expect.no.error()
  })
  it("then a Offset.NULL exception is thrown if offset is NULL",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Offset.NULL: Offset does not exist."

    # WHEN
    offset <- NULL

    # THEN
    offset |> validate[['Offset']]() |> expect.error(expected.error)
  })
  it("then a Attribute.NULL exception is thrown if offset has no x attribute",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Attribute.NULL: 'x' does not exist"

    # WHEN
    offset <- data.frame(y=1)

    # THEN
    offset |> validate[['Offset']]() |> expect.error(expected.error)
  })
  it("then a Attribute.NULL exception is thrown if offset has no y attribute",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Attribute.NULL: 'y' does not exist"

    # WHEN
    offset <- data.frame(x=1)

    # THEN
    offset |> validate[['Offset']]() |> expect.error(expected.error)
  })
  it("then offset is return if offset is valid",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- data.frame(x=1, y=1)

    # THEN
    offset |> validate[['Offset']]() |> expect.equal(offset)
  })
})

describe("When offset |> validate[['exists']]('Offset.NULL')",{
  it("then no exception is thrown if offset is not NULL",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- list()

    # THEN
    offset |> validate[['exists']]('Offset.NULL') |> expect.no.error()
  })
  it("then a Offset.NULL exception is thrown if offset is NULL",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Offset.NULL: Offset does not exist."

    # WHEN
    offset <- NULL

    # THEN
    offset |> validate[['exists']]('Offset.NULL') |> expect.error(expected.error)
  })
  it("then offset is return if offset is not NULL",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- list()

    # THEN
    offset |> validate[['exists']]('Offset.NULL') |> expect.equal(offset)
  })
})

describe("When offset |> validate[['has.x']]()",{
  it("then no exception is thrown if offset has a x attribute",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- data.frame(x=1)

    # THEN
    offset |> validate[['has.x']]() |> expect.no.error()
  })
  it("then a Attribute.NULL exception is thrown if offset has no x attribute",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Attribute.NULL: 'x' does not exist"

    # WHEN
    offset <- data.frame()

    # THEN
    offset |> validate[['has.x']]() |> expect.error(expected.error)
  })
  it("then offset is return if offset has x attribute",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- data.frame(x=1)

    # THEN
    offset |> validate[['has.x']]() |> expect.equal(offset)
  })
})

describe("When offset |> validate[['has.y']]()",{
  it("then no exception is thrown if offset has a y attribute",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- data.frame(y=1)

    # THEN
    offset |> validate[['has.y']]() |> expect.no.error()
  })
  it("then a Attribute.NULL exception is thrown if offset has no y attribute",{
    # GIVEN
    validate <- Offset.Validator()

    expected.error <- "Attribute.NULL: 'y' does not exist"

    # WHEN
    offset <- data.frame()

    # THEN
    offset |> validate[['has.y']]() |> expect.error(expected.error)
  })
  it("then offset is return if offset has y attribute",{
    # GIVEN
    validate <- Offset.Validator()

    # WHEN
    offset <- data.frame(y=1)

    # THEN
    offset |> validate[['has.y']]() |> expect.equal(offset)
  })
})
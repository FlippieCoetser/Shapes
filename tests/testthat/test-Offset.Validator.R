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
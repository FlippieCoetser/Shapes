describe('Shape.Utility',{
  it('exist',{
    Shape.Utility |> expect.exist()
  })
})

describe("When utilities <- Shape.Utility()",{
  it("then utilities is a list",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities |> expect.list()
  })
  it("then utilities contains 'get.with' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['get.with']] |> expect.exist()
  })
})
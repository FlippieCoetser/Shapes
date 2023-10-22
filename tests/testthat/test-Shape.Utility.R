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
  it("then utilities contains 'get.height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['get.height']] |> expect.exist()
  })
})

describe("When coordinates |> shape[['get.with']]()",{
  it("then width is the difference between the maximum and minimum x coordinates",{
    # Given
    shape <- Shape.Utility()
    coordinates <- data.frame(x = 1:10, y = 1:10)

    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()

    expected.width <- max.x - min.x

    # When
    actual.width <- coordinates |> shape[['get.width']]()

    # Then
    actual.width |> expect.equal(expected.width)
  })
})
describe('Circle.Coordinates.Generator',{
  it('exist',{
    Circle.Coordinates.Generator |> expect.exist()
  })
})

describe('When coordinates <- specifications |> Circle.Coordinates.Generator()',{
  it("Then coordinates has x and y values",{
    # Given
    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> Circle.Coordinates.Generator()

    # When
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("Then coordinates has 37 pairs of x and y values",{
    # Given
    specifications <- list()
    specifications[['radius']] <- 1

    expected.pairs <- 37

    # When
    coordinates <- specifications |> Circle.Coordinates.Generator()

    # When
    coordinates |> expect.rows(expected.pairs)
  })
})
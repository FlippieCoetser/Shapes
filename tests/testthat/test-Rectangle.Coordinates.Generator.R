describe('Rectangle.Coordinates.Generator',{
  it('exist',{
    Rectangle.Coordinates.Generator |> expect.exist()
  })
})

describe('When coordinates <- specifications |> Rectangle.Coordinates.Generator()',{
  it("Then coordinates has x and y values",{
    # Given
    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("Then coordinates has 5 pairs of x and y values",{
    # Given
    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    expected.pairs <- 5

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
})
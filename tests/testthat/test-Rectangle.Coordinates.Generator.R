describe('Rectangle.Coordinates.Generator',{
  it('exist',{
    Rectangle.Coordinates.Generator |> expect.exist()
  })
})

describe('When coordinates <- specifications |> Rectangle.Coordinates.Generator()',{
  it("Then Coordinates has x and y values",{
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
})
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
  it("Then the x values is equal to the cosine of the angle in radians times the radius",{
    # Given
    angle.converter <- Angle.Converter()

    specifications <- list()
    specifications[['radius']] <- 1

    expected.x <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> cos()) * specifications[['radius']]

    # When
    coordinates <- specifications |> Circle.Coordinates.Generator()

    # When
    coordinates[['x']] |> expect.equal(expected.x)
  })
  it("Then the y values is equal to the sine of the angle in radians times the radius",{
    # Given
    angle.converter <- Angle.Converter()

    specifications <- list()
    specifications[['radius']] <- 1

    expected.y <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> sin()) * specifications[['radius']]

    # When
    coordinates <- specifications |> Circle.Coordinates.Generator()

    # When
    coordinates[['y']] |> expect.equal(expected.y)
  })
})
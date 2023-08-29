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
  it("Then pair 1 has x = 0 and y = 0",{
    # Given
    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 2 has x = width and y = 0",{
    # Given
    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 2

    expected.x <- specifications[['width']]
    expected.y <- 0

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 3 has x = width and y = height",{
    # Given
    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 3

    expected.x <- specifications[['width']]
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 4 has x = 0 and y = height",{
    # Given
    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 4

    expected.x <- 0
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> Rectangle.Coordinates.Generator()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
})
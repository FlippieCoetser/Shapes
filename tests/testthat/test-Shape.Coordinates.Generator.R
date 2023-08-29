describe("Shape.Coordinates.Generator",{
  it("exist",{
    Shape.Coordinates.Generator |> expect.exist()
  })
})

describe("When generators <- Shape.Coordinates.Generator()",{
  it("Then generators is a list of generators",{
    # Given
    generators <- Shape.Coordinates.Generator()

    # Then
    generators |> expect.list()
  })
  it("Then generators contains a Rectangle generator",{
    # Given
    generators <- Shape.Coordinates.Generator()

    # Then
    generators[['Rectangle']] |> expect.exist()
  })
  it("Then generators contains a Circle generator",{
    # Given
    generators <- Shape.Coordinates.Generator()

    # Then
    generators[['Circle']] |> expect.exist()
  })
})

describe('When coordinates <- specifications |> generate[["Rectangle"]]()',{
  it("Then coordinates has x and y values",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("Then coordinates has 5 pairs of x and y values",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    expected.pairs <- 5

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("Then pair 1 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 2 has x = width and y = 0",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 2

    expected.x <- specifications[['width']]
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 3 has x = width and y = height",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 3

    expected.x <- specifications[['width']]
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 4 has x = 0 and y = height",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 4

    expected.x <- 0
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("Then pair 5 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Coordinates.Generator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    pair.number <- 5

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
})
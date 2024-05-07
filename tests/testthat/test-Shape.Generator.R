describe("Shape.Generator",{
  it("exist",{
    Shape.Generator |> expect.exist()
  })
})

describe("When generators <- Shape.Generator()",{
  it("then generators is a list of generators",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators |> expect.list()
  })
  it("then generators contains a 'Rectangle' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Rectangle']] |> expect.exist()
  })
  it("then generators contains a 'Triangle' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Triangle']] |> expect.exist()
  })
  it("then generators contains a 'Circle' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Circle']] |> expect.exist()
  })
  it("then generators contains a 'Trapezoid' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Trapezoid']] |> expect.exist()
  })
  it("then generators contains a 'Segment' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Segment']] |> expect.exist()
  })
})

describe("When coordinates <- specifications |> generate[['Rectangle']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 5 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    expected.pairs <- 5

    # When
    coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then pair 1 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

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
  it("then pair 2 has x = width and y = 0",{
    # Given
    generate <- Shape.Generator()

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
  it("then pair 3 has x = width and y = height",{
    # Given
    generate <- Shape.Generator()

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
  it("then pair 4 has x = 0 and y = height",{
    # Given
    generate <- Shape.Generator()

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
  it("then pair 5 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

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
  it("then coordinates is centered if specifications[['align']] <- 'center'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    specifications[['align']]  <- 'center'

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is vertically aligned if specifications[['align']] <- 'vertical'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    specifications[['align']]  <- 'vertical'

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is horizontally aligned if specifications[['align']] <- 'horizontal'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    specifications[['align']]  <- 'horizontal'

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Rectangle.NULL: Rectangle Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Rectangle']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no width",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'width' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Rectangle']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['width']] <- 20

    # Then
    specifications |> generate[['Rectangle']]() |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Circle']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Circle']]()

    # When
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 37 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    expected.pairs <- 37

    # When
    coordinates <- specifications |> generate[['Circle']]()


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then the x values is equal to the cosine of the angle in radians times the radius plus half width",{
    # Given
    angle.converter <- Angle.Converter()
    shape <- Shape.Utility()

    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    coordinates.x <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> cos()) * specifications[['radius']]
    coordinates.y <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> sin()) * specifications[['radius']]
    
    coordinates <- data.frame(x = coordinates.x, y = coordinates.y)
    
    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = height / 2)

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- specifications |> generate[['Circle']]()

    # Then
    actual.coordinates[['x']] |> expect.equal(expected.coordinates[['x']])
  })
  it("then the y values is equal to the sine of the angle in radians times the radius plus half height",{
        # Given
    angle.converter <- Angle.Converter()
    shape <- Shape.Utility()

    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    coordinates.x <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> cos()) * specifications[['radius']]
    coordinates.y <- (seq(0,360, 10) |> angle.converter[['DegreesToRadians']]() |> sin()) * specifications[['radius']]
    
    coordinates <- data.frame(x = coordinates.x, y = coordinates.y)
    
    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = height / 2)

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- specifications |> generate[['Circle']]()

    # Then
    actual.coordinates[['y']] |> expect.equal(expected.coordinates[['y']])
  })
  it("then coordinates is centered if specifications[['align']] <- 'center'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    specifications[['align']]  <- 'center'

    # When
    actual.coordinates <- specifications |> generate[['Circle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is vertically aligned if specifications[['align']] <- 'vertical'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    specifications[['align']]  <- 'vertical'

    # When
    actual.coordinates <- specifications |> generate[['Circle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is horizontally aligned if specifications[['align']] <- 'horizontal'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    specifications[['align']]  <- 'horizontal'

    # When
    actual.coordinates <- specifications |> generate[['Circle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Circle.NULL: Circle Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Circle']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Circle']]() |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Triangle']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # When
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 4 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    expected.pairs <- 4

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then pair 1 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 2 has x = base and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    pair.number <- 2

    expected.x <- specifications[['base']]
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 3 has x = base / 2 and y = height",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    pair.number <- 3

    expected.x <- specifications[['base']] / 2
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 4 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    pair.number <- 4

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Triangle']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then coordinates is centered if specifications[['align']] <- 'center'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    specifications[['align']]  <- 'center'

    # When
    actual.coordinates <- specifications |> generate[['Triangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is vertically aligned if specifications[['align']] <- 'vertical'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    specifications[['align']]  <- 'vertical'

    # When
    actual.coordinates <- specifications |> generate[['Triangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is horizontally aligned if specifications[['align']] <- 'horizontal'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    specifications[['align']]  <- 'horizontal'

    # When
    actual.coordinates <- specifications |> generate[['Triangle']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Triangle.NULL: Triangle Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Triangle']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no base",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'base' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Triangle']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['base']] <- 1

    # Then
    specifications |> generate[['Triangle']]() |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Trapezoid']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # When
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 5 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    expected.pairs <- 5

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then pair 1 has x = 0 and y = 0 if trapezoid is descending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 1 has x = difference / 2 and y = 0 if trapezoid is ascending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 0.5
    specifications[['top']]    <- 1
    specifications[['height']] <- 1

    pair.number <- 1

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    expected.x <- difference / 2
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 2 has x = bottom and y = 0 if trapezoid is descending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    pair.number <- 2

    expected.x <- specifications[['bottom']]
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 2 has x = bottom + difference / 2 and y = 0 if trapezoid is ascending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 0.5
    specifications[['top']]    <- 1
    specifications[['height']] <- 1

    pair.number <- 2

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    expected.x <- specifications[['bottom']] + difference / 2
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 3 has x = bottom - difference / 2 and y = height if trapezoid is descending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    pair.number <- 3

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    expected.x <- specifications[['bottom']] - difference / 2
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 3 has x = top and y = height if trapezoid is ascending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 0.5
    specifications[['top']]    <- 1
    specifications[['height']] <- 1

    pair.number <- 3

    expected.x <- specifications[['top']]
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 4 has x = difference / 2 and y = height if trapezoid is descending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    pair.number <- 4

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    expected.x <- difference / 2
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)    
  })
  it("then pair 4 has x = 0 and y = height if trapezoid is ascending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 0.5
    specifications[['top']]    <- 1
    specifications[['height']] <- 1

    pair.number <- 4

    expected.x <- 0
    expected.y <- specifications[['height']]

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)    
  })
  it("then pair 5 has x = 0 and y = 0 if trapezoid is descending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    pair.number <- 5

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)    
  })
  it("then pair 5 has x = difference / 2 and y = 0 if trapezoid is ascending",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 0.5
    specifications[['top']]    <- 1
    specifications[['height']] <- 1

    pair.number <- 5

    difference <- (specifications[['bottom']] - specifications[['top']]) |> abs()

    expected.x <- difference / 2
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)    
  })
  it("then coordinates is centered if specifications[['align']] <- 'center'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    corner.coordinates <- specifications |> generate[['Trapezoid']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    specifications[['align']]  <- 'center'

    # When
    actual.coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is vertically aligned if specifications[['align']] <- 'vertical'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    corner.coordinates <- specifications |> generate[['Trapezoid']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    specifications[['align']]  <- 'vertical'

    # When
    actual.coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is horizontally aligned if specifications[['align']] <- 'horizontal'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    corner.coordinates <- specifications |> generate[['Trapezoid']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    specifications[['align']]  <- 'horizontal'

    # When
    actual.coordinates <- specifications |> generate[['Trapezoid']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Trapezoid.NULL: Trapezoid Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Trapezoid']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no bottom",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'bottom' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Trapezoid']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no top",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'top' does not exist."

    # When
    specifications <- list()
    specifications[['bottom']] <- 20

    # Then
    specifications |> generate[['Trapezoid']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['bottom']] <- 20
    specifications[['top']]    <- 10

    # Then
    specifications |> generate[['Trapezoid']]() |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Segment']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Segment']]()

    # When
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 37 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    expected.pairs <- 19

    # When
    coordinates <- specifications |> generate[['Segment']]()


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then the x values is equal to the cosine of the angle in radians times the radius plus half width",{
    # Given
    angle.converter <- Angle.Converter()
    shape <- Shape.Utility()

    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    coordinates.x <- (seq(0,180, 10) |> angle.converter[['DegreesToRadians']]() |> cos()) * specifications[['radius']]
    coordinates.y <- (seq(0,180, 10) |> angle.converter[['DegreesToRadians']]() |> sin()) * specifications[['radius']]
    
    coordinates <- data.frame(x = coordinates.x, y = coordinates.y)
    
    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = 0)

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- specifications |> generate[['Segment']]()

    # Then
    actual.coordinates[['x']] |> expect.equal(expected.coordinates[['x']])
  })
  it("then the y values is equal to the sine of the angle in radians times the radius plus half height",{
        # Given
    angle.converter <- Angle.Converter()
    shape <- Shape.Utility()

    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    coordinates.x <- (seq(0,180, 10) |> angle.converter[['DegreesToRadians']]() |> cos()) * specifications[['radius']]
    coordinates.y <- (seq(0,180, 10) |> angle.converter[['DegreesToRadians']]() |> sin()) * specifications[['radius']]
    
    coordinates <- data.frame(x = coordinates.x, y = coordinates.y)
    
    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = width / 2, y = 0)

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- specifications |> generate[['Segment']]()

    # Then
    actual.coordinates[['y']] |> expect.equal(expected.coordinates[['y']])
  })
  it("then coordinates is centered if specifications[['align']] <- 'center'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    specifications[['align']]  <- 'center'

    # When
    actual.coordinates <- specifications |> generate[['Segment']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is vertically aligned if specifications[['align']] <- 'vertical'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    specifications[['align']]  <- 'vertical'

    # When
    actual.coordinates <- specifications |> generate[['Segment']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then coordinates is horizontally aligned if specifications[['align']] <- 'horizontal'",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    specifications[['align']]  <- 'horizontal'

    # When
    actual.coordinates <- specifications |> generate[['Segment']]()

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Segment.NULL: Segment Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Segment']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Segment']]() |> expect.error(expected.exception)
  })
})
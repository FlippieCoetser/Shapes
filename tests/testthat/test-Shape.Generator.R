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
  it("then generators contains a 'Line.horizontal' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Line.horizontal']] |> expect.exist()
  })
  it("then generators contains a 'Line.vertical' generator",{
    # Given
    generators <- Shape.Generator()

    # Then
    generators[['Line.vertical']] |> expect.exist()
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

describe("When coordinates <- specifications |> generate[['Line.horizontal']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    # When
    coordinates <- specifications |> generate[['Line.horizontal']]()

    # Then
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 2 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    expected.pairs <- 2

    # When
    coordinates <- specifications |> generate[['Line.horizontal']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then pair 1 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Line.horizontal']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 2 has x = length and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    pair.number <- 2

    expected.x <- specifications[['length']]
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Line.horizontal']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then an exception is thrown if specifications is NULL",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- 'Line.NULL: Line Specifications does not exist.'

    # When
    specifications <- NULL

    # Then
    specifications |> generate[['Line.horizontal']]() |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no length",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'length' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Line.horizontal']]() |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Line.vertical']]()",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    # When
    coordinates <- specifications |> generate[['Line.vertical']]()

    # Then
    coordinates[['x']] |> expect.exist()
    coordinates[['y']] |> expect.exist()
  })
  it("then coordinates has 2 pairs of x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    expected.pairs <- 2

    # When
    coordinates <- specifications |> generate[['Line.vertical']]()

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then pair 1 has x = 0 and y = 0",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    pair.number <- 1

    expected.x <- 0
    expected.y <- 0

    # When
    coordinates <- specifications |> generate[['Line.vertical']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
  })
  it("then pair 2 has x = 0 and y = length",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['length']] <- 10

    pair.number <- 2

    expected.x <- 0
    expected.y <- specifications[['length']]

    # When
    coordinates <- specifications |> generate[['Line.vertical']]()

    # Then
    coordinates[['x']][pair.number] |> expect.equal(expected.x)
    coordinates[['y']][pair.number] |> expect.equal(expected.y)
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

describe("When coordinates <- specifications |> generate[['Rectangle']](align = 'center')",{
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
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']](align = 'center')

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
    specifications |> generate[['Rectangle']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no width",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'width' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Rectangle']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['width']] <- 20

    # Then
    specifications |> generate[['Rectangle']](align = 'center') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Rectangle']](align = 'vertical')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    # When
    coordinates <- specifications |> generate[['Rectangle']]('vertical')

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
    coordinates <- specifications |> generate[['Rectangle']]('vertical')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is vertically centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']](align = 'vertical')

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
    specifications |> generate[['Rectangle']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no width",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'width' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Rectangle']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['width']] <- 20

    # Then
    specifications |> generate[['Rectangle']](align = 'vertical') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Rectangle']](align = 'horizontal')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['width']] <- 20
    specifications[['height']] <- 10

    # When
    coordinates <- specifications |> generate[['Rectangle']]('horizontal')

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
    coordinates <- specifications |> generate[['Rectangle']]('horizontal')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is horizontal centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['width']]  <- 20
    specifications[['height']] <- 10

    corner.coordinates <- specifications |> generate[['Rectangle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    # When
    actual.coordinates <- specifications |> generate[['Rectangle']](align = 'horizontal')

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
    specifications |> generate[['Rectangle']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no width",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'width' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Rectangle']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['width']] <- 20

    # Then
    specifications |> generate[['Rectangle']](align = 'horizontal') |> expect.error(expected.exception)
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

describe("When coordinates <- specifications |> generate[['Circle']](align = 'center')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Circle']](align = 'center')

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
    coordinates <- specifications |> generate[['Circle']](align = 'center')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    # When
    actual.coordinates <- specifications |> generate[['Circle']](align = 'center')

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
    specifications |> generate[['Circle']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Circle']](align = 'center') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Circle']](align = 'vertical')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Circle']](align = 'center')

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
    coordinates <- specifications |> generate[['Circle']](align = 'center')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is vertically centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    # When
    actual.coordinates <- specifications |> generate[['Circle']](align = 'vertical')

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
    specifications |> generate[['Circle']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Circle']](align = 'vertical') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Circle']](align = 'horizontal')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Circle']](align = 'horizontal')

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
    coordinates <- specifications |> generate[['Circle']](align = 'horizontal')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is horizontal centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Circle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    # When
    actual.coordinates <- specifications |> generate[['Circle']](align = 'horizontal')

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
    specifications |> generate[['Circle']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Circle']](align = 'horizontal') |> expect.error(expected.exception)
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

describe("When coordinates <- specifications |> generate[['Triangle']](align = 'center')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    # When
    coordinates <- specifications |> generate[['Triangle']](align = 'center')

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
    coordinates <- specifications |> generate[['Triangle']](align = 'center')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    # When
    actual.coordinates <- specifications |> generate[['Triangle']](align = 'center')

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
    specifications |> generate[['Triangle']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no base",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'base' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Triangle']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['base']] <- 1

    # Then
    specifications |> generate[['Triangle']](align = 'center') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Triangle']](align = 'vertical')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    # When
    coordinates <- specifications |> generate[['Triangle']](align = 'vertical')

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
    coordinates <- specifications |> generate[['Triangle']](align = 'vertical')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is vertical centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    # When
    actual.coordinates <- specifications |> generate[['Triangle']](align = 'vertical')

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
    specifications |> generate[['Triangle']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no base",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'base' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Triangle']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['base']] <- 1

    # Then
    specifications |> generate[['Triangle']](align = 'vertical') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Triangle']](align = 'horizontal')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    # When
    coordinates <- specifications |> generate[['Triangle']](align = 'horizontal')

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
    coordinates <- specifications |> generate[['Triangle']](align = 'horizontal')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is horizontal centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['base']]   <- 1
    specifications[['height']] <- 1.5

    corner.coordinates <- specifications |> generate[['Triangle']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    # When
    actual.coordinates <- specifications |> generate[['Triangle']](align = 'horizontal')

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
    specifications |> generate[['Triangle']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no base",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'base' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Triangle']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no height",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'height' does not exist."

    # When
    specifications <- list()
    specifications[['base']] <- 1

    # Then
    specifications |> generate[['Triangle']](align = 'horizontal') |> expect.error(expected.exception)
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

describe("When coordinates <- specifications |> generate[['Trapezoid']](align = 'center')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    # When
    coordinates <- specifications |> generate[['Trapezoid']](align = 'center')

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
    coordinates <- specifications |> generate[['Trapezoid']](align = 'center')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    corner.coordinates <- specifications |> generate[['Trapezoid']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    # When
    actual.coordinates <- specifications |> generate[['Trapezoid']](align = 'center')

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
    specifications |> generate[['Trapezoid']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no bottom",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'bottom' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Trapezoid']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no top",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'top' does not exist."

    # When
    specifications <- list()
    specifications[['bottom']] <- 20

    # Then
    specifications |> generate[['Trapezoid']](align = 'center') |> expect.error(expected.exception)
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
    specifications |> generate[['Trapezoid']](align = 'center') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Trapezoid']](align = 'vertical')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    # When
    coordinates <- specifications |> generate[['Trapezoid']](align = 'vertical')

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
    coordinates <- specifications |> generate[['Trapezoid']](align = 'vertical')

    # Then
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['bottom']] <- 1
    specifications[['top']]    <- 0.5
    specifications[['height']] <- 1

    corner.coordinates <- specifications |> generate[['Trapezoid']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    # When
    actual.coordinates <- specifications |> generate[['Trapezoid']](align = 'vertical')

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
    specifications |> generate[['Trapezoid']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no bottom",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'bottom' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Trapezoid']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no top",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'top' does not exist."

    # When
    specifications <- list()
    specifications[['bottom']] <- 20

    # Then
    specifications |> generate[['Trapezoid']](align = 'vertical') |> expect.error(expected.exception)
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
    specifications |> generate[['Trapezoid']](align = 'vertical') |> expect.error(expected.exception)
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

describe("When coordinates <- specifications |> generate[['Segment']](align = 'center')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Segment']](align = 'center')

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
    coordinates <- specifications |> generate[['Segment']](align = 'center')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['center']]()

    # When
    actual.coordinates <- specifications |> generate[['Segment']](align = 'center')

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
    specifications |> generate[['Segment']](align = 'center') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Segment']](align = 'center') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Segment']](align = 'vertical')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Segment']](align = 'vertical')

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
    coordinates <- specifications |> generate[['Segment']](align = 'vertical')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is vertically centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['vertical']]()

    # When
    actual.coordinates <- specifications |> generate[['Segment']](align = 'vertical')

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
    specifications |> generate[['Segment']](align = 'vertical') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Segment']](align = 'vertical') |> expect.error(expected.exception)
  })
})

describe("When coordinates <- specifications |> generate[['Segment']](align = 'horizontal')",{
  it("then coordinates has x and y values",{
    # Given
    generate <- Shape.Generator()

    specifications <- list()
    specifications[['radius']] <- 1

    # When
    coordinates <- specifications |> generate[['Segment']](align = 'horizontal')

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
    coordinates <- specifications |> generate[['Segment']](align = 'horizontal')


    # When
    coordinates |> expect.rows(expected.pairs)
  })
  it("then coordinates is horizontal centered",{
    # Given
    generate <- Shape.Generator()
    align    <- Alignment.Configurator()

    specifications <- list()
    specifications[['radius']] <- 1

    corner.coordinates <- specifications |> generate[['Segment']]()

    expected.coordinates <- corner.coordinates |> align[['horizontal']]()

    # When
    actual.coordinates <- specifications |> generate[['Segment']](align = 'horizontal')

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
    specifications |> generate[['Segment']](align = 'horizontal') |> expect.error(expected.exception)
  })
  it("then an exception is thrown if specifications has no radius",{
    # Given
    generate <- Shape.Generator()

    expected.exception <- "Attribute.NULL: 'radius' does not exist."

    # When
    specifications <- list()

    # Then
    specifications |> generate[['Segment']](align = 'horizontal') |> expect.error(expected.exception)
  })
})
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
  it("then utilities contains 'get.width' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['get.width']] |> expect.exist()
  })
  it("then utilities contains 'get.height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['get.height']] |> expect.exist()
  })
  it("then utilities contains 'translate' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['translate']] |> expect.exist()
  })
  it("then utilities contains 'translate.x' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['translate.x']] |> expect.exist()
  })
  it("then utilities contains 'translate.y' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['translate.y']] |> expect.exist()
  })
  it("then utilities contains 'shrink' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['shrink']] |> expect.exist()
  })
  it("then utilities contains 'shrink.height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['shrink.height']] |> expect.exist()
  })
  it("then utilities contains 'shrink.width' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['shrink.width']] |> expect.exist()
  })
  it("then utilities contains 'join' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['join']] |> expect.exist()
  })
})

describe("When coordinates |> shape[['get.width']]()",{
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
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['get.width']]() |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['get.width']]() |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['get.width']]() |> expect.error()
  })
})

describe("When coordinates |> shape[['get.height']]()",{
  it("then height is the difference between the maximum and minimum y coordinates",{
    # Given
    shape <- Shape.Utility()
    coordinates <- data.frame(x = 1:10, y = 1:10)

    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()

    expected.height <- max.y - min.y

    # When
    actual.height <- coordinates |> shape[['get.height']]()

    # Then
    actual.height |> expect.equal(expected.height)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['get.height']]() |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['get.height']]() |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['get.height']]() |> expect.error()
  })
})

describe("When coordinates |> shape[['translate']](offset)",{
  it("then coordinates is translated by offset",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    offset <- c(x = 1, y = 1)

    expected.coordinates <- data.frame(
      x = coordinates[['x']] + offset[['x']],
      y = coordinates[['y']] + offset[['y']]
    )

    # When
    actual.coordinates <- coordinates |> shape[['translate']](offset)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    offset <- c(x = 1, y = 1)
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    offset <- c(x = 1, y = 1)
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    offset <- c(x = 1, y = 1)
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
  it("then an exception is thrown if offset is NULL",{
    # Given
    shape <- Shape.Utility()
    coordinates <- c(x = 1, y = 1)
    
    # When
    offset <- NULL

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
  it("then an exception is thrown if offset has not x attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates <- c(x = 1, y = 1)
    
    # When
    offset <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
  it("then an exception is thrown if offset has not y attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates <- c(x = 1, y = 1)
    
    # When
    offset <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['translate']](offset) |> expect.error()
  })
})

describe("When coordinates |> shape[['translate.x']](x)",{
  it("then coordinates is translated by x",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    x <- 1

    expected.coordinates <- data.frame(
      x = coordinates[['x']] + x,
      y = coordinates[['y']]
    )

    # When
    actual.coordinates <- coordinates |> shape[['translate.x']](x)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    x <- 1
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['translate.x']](x) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    x <- 1
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['translate.x']](x) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    x <- 1
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['translate.x']](x) |> expect.error()
  })
})

describe("When coordinates |> shape[['translate.y']](y)",{
  it("then coordinates is translated by y",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    y <- 1

    expected.coordinates <- data.frame(
      x = coordinates[['x']],
      y = coordinates[['y']] + y
    )

    # When
    actual.coordinates <- coordinates |> shape[['translate.y']](y)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    y <- 1
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['translate.y']](y) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    y <- 1
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['translate.x']](y) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    y <- 1
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['translate.y']](y) |> expect.error()
  })
})

describe("When coordinates |> shape[['shrink']](amount)",{
  it("then coordinates is shrunk by amount",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,10,10,0)
    )

    amount <- 5

    expected.coordinates <- data.frame(
      x = c(0,5,5,0,0), 
      y = c(0,0,5,5,0)
    )

    # When
    actual.coordinates <- coordinates |> shape[['shrink']](amount)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['shrink']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['shrink']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['shrink']](amount) |> expect.error()
  })
})

describe("When coordinates |> shape[['shrink.height']](amount)",{
  it("then coordinates is shrunk by amount",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,10,10,0)
    )

    amount <- 5

    expected.coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,5,5,0)
    )

    # When
    actual.coordinates <- coordinates |> shape[['shrink.height']](amount)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then coordinates is not shrunk by more than the height of the shape",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,10,10,0)
    )

    amount <- 15

    expected.coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,0,0,0)
    )

    # When
    actual.coordinates <- coordinates |> shape[['shrink.height']](amount)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['shrink.height']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['shrink.height']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['shrink.height']](amount) |> expect.error()
  })
})

describe("When coordinates |> shape[['shrink.width']](amount)",{
  it("then coordinates is shrunk by amount",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,10,10,0)
    )

    amount <- 5

    expected.coordinates <- data.frame(
      x = c(0,5,5,0,0), 
      y = c(0,0,10,10,0)
    )

    # When
    actual.coordinates <- coordinates |> shape[['shrink.width']](amount)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then coordinates is not shrunk by more than the width of the shape",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(
      x = c(0,10,10,0,0), 
      y = c(0,0,10,10,0)
    )

    amount <- 15

    expected.coordinates <- data.frame(
      x = c(0,0,0,0,0), 
      y = c(0,0,10,10,0)
    )

    # When
    actual.coordinates <- coordinates |> shape[['shrink.width']](amount)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
  it("then an exception is thrown if coordinates is NULL",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- NULL

    # Then
    coordinates |> shape[['shrink.width']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not x attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(y = 1:10)

    # Then
    coordinates |> shape[['shrink.width']](amount) |> expect.error()
  })
  it("then an exception is thrown if coordinates has not y attribute",{
    # Given
    shape <- Shape.Utility()
    amount <- 1
    
    # When
    coordinates <- data.frame(x = 1:10)

    # Then
    coordinates |> shape[['shrink.width']](amount) |> expect.error()
  })
})

describe("When coordinates.one |> shape[['join']](coordinates.two)",{
  it("then coordinates.one and coordinates.two are joined",{
    # Given
    shape <- Shape.Utility()

    coordinates.one <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )

    coordinates.two <- data.frame(
      x = c(0 ,10,10,0 ,0), 
      y = c(10,10,20,20,10)
    )

    expected.coordinates <- data.frame(
      x = c(0,10,10,10,0 ,0 ,0), 
      y = c(0,0 ,10,20,20,10,0)
    )

    # When
    actual.coordinates <- coordinates.one |> shape[['join']](coordinates.two)

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
  it("then an exception is thrown if coordinates.one is NULL",{
    # Given
    shape <- Shape.Utility()
    coordinates.two <- data.frame()
    
    # When
    coordinates.one <- NULL

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
  it("then an exception is thrown if coordinates.one has not x attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates.two <- data.frame()
    
    # When
    coordinates.one <- data.frame(y = 1:10)

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
  it("then an exception is thrown if coordinates.one has not y attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates.two <- data.frame()

    
    # When
    coordinates.one <- data.frame(x = 1:10)

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
  it("then an exception is thrown if coordinates.two is NULL",{
    # Given
    shape <- Shape.Utility()
    coordinates.one <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )
    
    # When
    coordinates.two <- NULL

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
  it("then an exception is thrown if coordinates.two has not x attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates.one <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )
    
    # When
    coordinates.two <- data.frame(y = 1:10)

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
  it("then an exception is thrown if coordinates.two has not y attribute",{
    # Given
    shape <- Shape.Utility()
    coordinates.one <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )

    # When
    coordinates.two <- data.frame(x = 1:10)

    # Then
    coordinates.one |> shape[['join']](coordinates.two) |> expect.error()
  })
})
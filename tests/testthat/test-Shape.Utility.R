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
  it("then utilities contains 'shrink.height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['shrink.height']] |> expect.exist()
  })
  it("then utilities contains 'join' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['join']] |> expect.exist()
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
  it("then coordinates.one is returned if coordinates.two has length of 0",{
    # Given
    shape <- Shape.Utility()

    coordinates.one <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )

    coordinates.two <- data.frame()

    expected.coordinates <- data.frame(
      x = c(0,10,10,0 ,0), 
      y = c(0,0 ,10,10,0)
    )

    # When
    actual.coordinates <- coordinates.one |> shape[['join']](coordinates.two)

    # Then
    actual.coordinates |> expect.equal.data(expected.coordinates)
  })
})
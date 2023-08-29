describe('Coordinate.System.Converter',{
  it('exist',{
    Coordinate.System.Converter |> expect.exist()
  })
})

describe('When converters <- Coordinate.System.Converter()',{
  it("Then converters is a list",{
    # Given
    converters <- Coordinate.System.Converter()

    # Then
    converters |> expect.list()
  })
  it("Then converters contains PolarToCartesian converter",{
    # Given
    converters <- Coordinate.System.Converter()

    # Then
    converters[['PolarToCartesian']] |> expect.function()
  })
  it("Then converters contains CartesianToPolar converter",{
    # Given
    converters <- Coordinate.System.Converter()

    # Then
    converters[['CartesianToPolar']] |> expect.function()
  })
})

describe('When coordinates |> convert[["PolarToCartesian"]]()',{
  it('then a data.frame with x and y is returned',{
    # Given
    convert <- Coordinate.System.Converter()  

    coordinates <- list()
    coordinates[['radius']] <- 1
    coordinates[['angle']]  <- 0   
   
    # When
    actual.coordinates <- coordinates |> convert[['PolarToCartesian']]() 
     
    # Then
    actual.coordinates |> expect.data.frame() 

    actual.coordinates[['x']] |> expect.exist() 
    actual.coordinates[['y']] |> expect.exist() 
  })
  it('then x is equal to radius * cos(angle)',{
    # Given
    convert <- Coordinate.System.Converter()     

    coordinates <- list()
    coordinates[['radius']] <- 1
    coordinates[['angle']]  <- 0

    expected.x <- (coordinates[['angle']] |> cos()) * coordinates[['radius']] 
          
    # When
    actual.coordinates <- coordinates |> convert[['PolarToCartesian']]() 
     
    # Then
    actual.coordinates[['x']] |> expect_equal(expected.x)
  })
  it('then y is equal to radius * sin(angle)',{
    # Given
    convert <- Coordinate.System.Converter()     

    coordinates <- list()
    coordinates[['radius']] <- 1
    coordinates[['angle']]  <- 0

    expected.y <- (coordinates[['angle']] |> sin()) * coordinates[['radius']] 
          
    # When
    actual.coordinates <- coordinates |> convert[['PolarToCartesian']]() 
     
    # Then
    actual.coordinates[['y']] |> expect_equal(expected.y)
  })
})
describe('Angle.Converter',{
  it('exist',{
    Angle.Converter |> expect.exist()
  })
})

describe('When converters <- Angle.Converter()',{
  it("Then converters is a list",{
    # Given
    converters <- Angle.Converter()

    # Then
    converters |> expect.list()
  })
  it("Then converters contains DegreesToRadians converter",{
    # Given
    converters <- Angle.Converter()

    # Then
    converters[['DegreesToRadians']] |> expect.exist()
  })
  it("Then converters contains RadiansToDegrees converter",{
    # Given
    converters <- Angle.Converter()

    # Then
    converters[['RadiansToDegrees']] |> expect.function()
  })
})

describe("When degrees |> convert[['DegreesToRadians']]()",{
  it("Then radians is returned",{
    # Given
    convert <- Angle.Converter()

    expected.radians <- pi
    
    # When
    degrees <- 180
    radians <- degrees |> convert[['DegreesToRadians']]()

    # Then
    radians |> expect.equal(expected.radians)
  })
})
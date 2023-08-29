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
})
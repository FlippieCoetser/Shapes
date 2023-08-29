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
})

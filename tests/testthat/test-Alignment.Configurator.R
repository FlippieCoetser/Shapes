describe('Alignment.Configurator',{
  it('exist',{
    Alignment.Configurator |> expect.exist()
  })
})

describe("When alignment <- Alignment.Configurator()",{
  it("then alignment is a list",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment |> expect.list()
  })
  it("then alignment contains 'corner' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['corner']] |> expect.exist()
  })
  it("then alignment contains 'center' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['center']] |> expect.exist()
  })
  it("then alignment contains 'horizontal' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['horizontal']] |> expect.exist()
  })
  it("then alignment contains 'vertical' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['vertical']] |> expect.exist()
  })
})

describe("When coordinates |> align[['corner']]()",{
  it("then no offset is applied to coordinates",{
    # Given
    align <- Alignment.Configurator()
    coordinates <- data.frame(x = 1:10, y = 1:10)

    expected.coordinates <- coordinates

    # When
    actual.coordinates <- coordinates |> align[['corner']]()

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
})

describe("When coordinates |> align[['center']]()",{
  it("then coordinates are centered",{
    # Given
    shape <- Shape.Utility()
    align <- Alignment.Configurator()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    width  <- coordinates |> shape[['get.width']]()
    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = -width / 2, y = -height / 2)  

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- coordinates |> align[['center']]()

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
})

describe("When coordinates |> align[['vertical']]()",{
  it("then coordinates are vertically aligned",{
    # Given
    shape <- Shape.Utility()
    align <- Alignment.Configurator()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    height <- coordinates |> shape[['get.height']]()

    offset <- data.frame(x = 0, y = -height / 2)  

    expected.coordinates <- coordinates |> shape[['translate']](offset)

    # When
    actual.coordinates <- coordinates |> align[['vertical']]()

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
})
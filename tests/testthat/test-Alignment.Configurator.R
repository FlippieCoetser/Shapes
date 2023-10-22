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
  it("then alignment contains 'origin' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['origin']] |> expect.exist()
  })
  it("then alignment contains 'horizontal' alignment",{
    # When
    alignment <- Alignment.Configurator()

    # Then
    alignment[['horizontal']] |> expect.exist()
  })
})
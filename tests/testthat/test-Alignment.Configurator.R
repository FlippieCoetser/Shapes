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
})
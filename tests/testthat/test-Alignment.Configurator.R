describe('Alignment.Configurator',{
  it('exist',{
    Alignment.Configurator |> expect.exist()
  })
})

describe("When configurator <- Alignment.Configurator()",{
  it("then configurator is a list",{
    # When
    configurator <- Alignment.Configurator()

    # Then
    configurator |> expect.list()
  })
})
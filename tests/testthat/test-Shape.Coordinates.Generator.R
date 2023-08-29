describe("Shape.Coordinates.Generator",{
  it("exist",{
    Shape.Coordinates.Generator |> expect.exist()
  })
})

describe("When generators <- Shape.Coordinates.Generator()",{
  it("Then generators is a list of generators",{
    # Given
    generators <- Shape.Coordinates.Generator()

    # Then
    generators |> expect.list()
  })
  it("Then generators contains a Rectangle generator",{
    # Given
    generators <- Shape.Coordinates.Generator()

    # Then
    generators[['Rectangle']] |> expect.exist()
  })
})
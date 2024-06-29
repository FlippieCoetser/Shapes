describe('Offset.Model',{
  it('exist',{
    Offset.Model |> expect.exist()
  })
})

describe("When offset <- data |> Offset.Model()",{
  it('then offset is a data.frame',{
    # Given
    data <- list(x = 1, y = 2)

    # When
    offset <- data |> Offset.Model()

    # Then
    offset |> expect.data.frame()
  })
  it('then offset contains a x attribute',{
    # Given
    data <- list(x = 1, y = 2)

    # When
    offset <- data |> Offset.Model()

    # Then
    offset[['x']] |> expect.exist()
  })
  it('then offset contains a y attribute',{
    # Given
    data <- list(x = 1, y = 2)

    # When
    offset <- data |> Offset.Model()

    # Then
    offset[['y']] |> expect.exist()
  })
})
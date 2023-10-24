describe('Shape.Utility',{
  it('exist',{
    Shape.Utility |> expect.exist()
  })
})

describe("When utilities <- Shape.Utility()",{
  it("then utilities is a list",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities |> expect.list()
  })
  it("then utilities contains 'Get.Width' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['Get.Width']] |> expect.exist()
  })
  it("then utilities contains 'Get.Height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['Get.Height']] |> expect.exist()
  })
  it("then utilities contains 'Translate' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['Translate']] |> expect.exist()
  })
  it("then utilities contains 'Shrink.Height' utility",{
    # When
    utilities <- Shape.Utility()

    # Then
    utilities[['Shrink.Height']] |> expect.exist()
  })
})

describe("When coordinates |> shape[['get.with']]()",{
  it("then width is the difference between the maximum and minimum x coordinates",{
    # Given
    shape <- Shape.Utility()
    coordinates <- data.frame(x = 1:10, y = 1:10)

    max.x <- coordinates[['x']] |> max()
    min.x <- coordinates[['x']] |> min()

    expected.width <- max.x - min.x

    # When
    actual.width <- coordinates |> shape[['Get.Width']]()

    # Then
    actual.width |> expect.equal(expected.width)
  })
})

describe("When coordinates |> shape[['Get.Height']]()",{
  it("then height is the difference between the maximum and minimum y coordinates",{
    # Given
    shape <- Shape.Utility()
    coordinates <- data.frame(x = 1:10, y = 1:10)

    max.y <- coordinates[['y']] |> max()
    min.y <- coordinates[['y']] |> min()

    expected.height <- max.y - min.y

    # When
    actual.height <- coordinates |> shape[['Get.Height']]()

    # Then
    actual.height |> expect.equal(expected.height)
  })
})

describe("When coordinates |> shape[['Translate']](offset)",{
  it("then coordinates is Translated by offset",{
    # Given
    shape <- Shape.Utility()

    coordinates <- data.frame(x = 1:10, y = 1:10)

    offset <- c(x = 1, y = 1)

    expected.coordinates <- data.frame(
      x = coordinates[['x']] + offset[['x']],
      y = coordinates[['y']] + offset[['y']]
    )

    # When
    actual.coordinates <- coordinates |> shape[['Translate']](offset)

    # Then
    actual.coordinates |> expect.equal(expected.coordinates)
  })
})
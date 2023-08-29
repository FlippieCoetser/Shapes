Circle.Coordinates.Generator <- \(specifications) {
  angle <- seq(0,360, 10)
  radius <- 1 |> rep(length(angle))

  data.frame(
    x = 1:length(angle),
    y = 1:length(radius)
  )
}
Rectangle.Coordinates.Generator <- \(specifications) data.frame(
  x = c(0,specifications[['width']],specifications[['width']],0,0),
  y = c(0,0,specifications[['height']],specifications[['height']],0)
)
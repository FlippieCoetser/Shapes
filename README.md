# Shapes R-Package

Generate Shape Coordinates with ease.

## Generic Development Process

1. Define User Requirements
2. Create Conceptual Design (wire-frames or proof of concept code)
3. Define Acceptance Criteria
4. Create a new Branch
5. Follow a TDD (Test Driven Development) to implement Design
6. Merge Branch to Main

> Note: After each Merge, identify Abstraction and Generalization opportunities. Implement them in a separate branch and merge them after the test passes.

This process was followed iteratively in this repository. See the User Requirements, Conceptual Design and Acceptance Criteria list using the links below.

## Sequence of User Stories Implemented:

1. [Generate Rectangle Coordinates](https://github.com/FlippieCoetser/Shapes/issues/1)
2. [Convert Radians to Degrees and Back](https://github.com/FlippieCoetser/Shapes/issues/4)
3. [Convert Polar Coordinates to Cartesian Coordinates and Back](https://github.com/FlippieCoetser/Shapes/issues/5)
4. [Generate Circle Coordinates](https://github.com/FlippieCoetser/Shapes/issues/2)
5. [Consolidate Shape Coordinates Generators](https://github.com/FlippieCoetser/Shapes/issues/9)

All branches associated with user stories have been left active.

Also, notice the last iteration focused on abstraction. Abstraction combines related functions or operations into a unified component, simplifying their access and use by grouping them under a broader theme or purpose.

### Features

Generate Shape Coordinates for the following shapes:

1. Rectangle

```r
generate <- Shapes::Shape.Coordinates.Generator()

specifications <- list()
specifications[['width']]  <- 1
specifications[['height']] <- 0.5
specifications[['align']]  <- 'center'

rectangle <- specifications |> generate[['Rectangle']]()
```

2. Circle

```r
generate <- Shapes::Shape.Coordinates.Generator()

specifications <- list()
specifications[['radius']] <- 1
specifications[['align']]  <- 'center'

circle <- specifications |> generate[['Circle']]()
```

The align parameter can be one of the following:

1. corner: The Left Bottom Corner of shapes will be at the origin (0,0)
2. center: The center of shapes will be at the origin (0,0)
3. horizontal: The shapes will be centred horizontally with the bottom at y = 0
4. vertical: The shapes will be centred vertically with the left side at x = 0

> Note: The default align is corner when not specified

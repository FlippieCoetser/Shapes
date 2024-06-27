# Shapes R-Package

This package is used to generates x, y coordinate pairs for basic shapes:

1. Rectangle
2. Triangle
3. Circle
4. Trapezoid
5. Segment

Structural validation of input specifications is done before generating the coordinates.

## Installation

This package is not available on CRAN. Use `devtools` to either install from GitHub or build from source and install locally.

### Install from GitHub

1. Use the following command to install the package from GitHub:

```r
devtools::install_github("https://github.com/FlippieCoetser/Shapes")
```

### Build from Source

1. Clone the repository to your local machine.

```bash
git clone https://github.com/FlippieCoetser/Shapes.git
```

2. Navigate to the directory where the repository was cloned.

3. Build the package.

```r
devtools::build()
```

4. Install `.tar.gz` file.

```r
install.packages("path_to_file/tar_gz_file", repos = NULL, type = "source")
```

### Load the Package

There are two ways to load the package: using the `library` function or the package namespace.

1. Using the `library` function.

```r
library(Shapes)
generate <- Generator()
validate <- Validator()
```

2. Using the package namespace.

```r
generate <- Shapes::Generator()
validate <- Shapes::Validator()
```

### Shape Generator Usage

Generate Shape Coordinates for the following shapes:

1. Rectangle

```r
specifications <- list()
specifications[['width']]  <- 1
specifications[['height']] <- 0.5

rectangle <- specifications |> generate[['Rectangle']]()
```

2. Triangle

```r
specifications <- list()
specifications[['base']]   <- 1
specifications[['height']] <- 1.5

triangle <- specifications |> generate[['Triangle']]()
```

3. Circle

```r
specifications <- list()
specifications[['radius']] <- 1

circle <- specifications |> generate[['Circle']]()
```

4. Trapezoid

```r
specifications <- list()
specifications[['bottom']] <- 1
specifications[['top']]    <- 0.5
specifications[['height']] <- 1

trapezoid <- specifications |> generate[['Trapezoid']]()
```

5. Segment

```r
specifications <- list()
specifications[['radius']] <- 1

segment <- specifications |> generate[['Segment']]()
```

> Note: An optional align parameter can be passed to the generator function.
>
> The align parameter can be one of the following:
>
> 1.  corner: The Left Bottom Corner of shapes will be at the origin (0,0)
> 2.  center: The center of shapes will be at the origin (0,0)
> 3.  horizontal: The shapes will be centred horizontally with the bottom at y = 0
> 4.  vertical: The shapes will be centred vertically with the left side at x = 0

Generate Shape Coordinates for the following shapes:

1. Centered Aligned Rectangle

```r
specifications <- list()
specifications[['width']]  <- 1
specifications[['height']] <- 0.5

rectangle <- specifications |> generate[['Rectangle']](align = 'center')
```

### Shape Validator Usage

Validate specifications of shapes and throw exception with meaningful message, for example:

1. Define a specification with missing parameters.

```r
specifications <- list()
specifications[['width']] <- 1
```

2. Validate the specifications.

```r
specifications |> validate[['Rectangle']]()
```

3. The following exception will be thrown:

```r
"Error: Attribute.NULL: 'height' does not exist."
```

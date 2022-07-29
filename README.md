# ***useweaR*** an R package for use-wear analysis

Integrates surface analysis (with [geodiv](https://cran.r-project.org/web/packages/geodiv/index.html)) and interactive 3D visualisation (with [plotly](https://plotly.com/r/)) on 3D confocal microscopy surfaces

## Install and load package

Install the R package

```
devtools::install_github("zoometh/useweaR")
```

And load the package

```
library(useweaR)
```

## Read and plot the surface with Plotly

```
library(dplyr)

xyz <- read_dat()
plotly_surface_3d(xyz, export.plot = FALSE)
```

Will open an interactive 3D Plotly viewer

<p align="center">
  <img alt="img-name" src="https://raw.githubusercontent.com/zoometh/rockart/main/www/use-wear-plotly.png" width="700">
</p>

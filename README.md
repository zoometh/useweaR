# ***useweaR*** an R package for use-Wear analysis

Uses Plotly and geodiv packages to visualize and compute surface analysis on a Confocal 3D surface

## Install and load package

Install the R package

```
devtools::install_github("eamena-oxford/useweaR")
```

And load the package

```
library(useweaR)
```

## Read and plot the surface with Plotly

```
xyz <- read_dat()
plotly_surface_3d(xyz, export.plot = FALSE)
```

Will open an interactive 3D Plotly viewer

<p align="center">
  <img alt="img-name" src="https://raw.githubusercontent.com/zoometh/rockart/main/www/use-wear-plotly.png" width="700">
</p>

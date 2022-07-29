#' Create a 3D surface with Plotly
#' @name plotly_surface_3d
#' @description 3D interface or save HTML widgets
#'
#' @param xyz a dataframe with X, Y, and Z columns for the surface
#' @param scale the scale of the axis (mm, cm, etc.)
#' @param marker a dataframe with X, Y, and Z columns of additional points. NA by default
#' @param size.markers,color.markers,opacity.markers grahical parameters
#' @param export.plot if TRUE export, if FALSE display
#' @param xyz.name name of the output plot. Only useful when export.plot is TRUE
#' @param dirOut name of the output folder. Only useful when export.plot is TRUE
#'
#' @return A dataframe
#'
#' @examples
#'
#' xyz <- read_dat()
#' plotly_surface_3d(xyz, export.plot = FALSE)
#'
#' @export

plotly_surface_3d <- function(xyz = NA,
                              scale = "\u03BCm",
                              markers = NA,
                              size.markers = 10,
                              color.markers = '#FF0000',
                              opacity.markers = 0.3,
                              export.plot = TRUE,
                              xyz.name = "surf3d.html",
                              dirOut = "C:/Rprojects/Rdev/3dlithic/results/"){

  # url.www <- "https://raw.githubusercontent.com/zoometh/rockart/main/www/"
  # xyz <- read.csv(paste0(url.www, "/confoc_3d.xyz"), sep = " ", header = F)
  axx <- list(
    title = paste("X", scale)
  )
  axy <- list(
    title = paste("Y", scale)
  )
  axz <- list(
    title = paste("Z", scale)
  )

  ## surface
  surf3d <- plotly::plot_ly(x = xyz$X, y = xyz$Y, z = xyz$Z,
                            intensity = xyz$Z, type = 'mesh3d',
                            colorbar = list(title = "Z \u03BCm"))  %>%
    plotly::layout(title = "ConFocal surface",
                   scene = list(xaxis = axx, yaxis = axy, zaxis = axz,
                                aspectmode = 'data'),
                   plot_bgcolor = 'rgb(0, 0, 0)',
                   paper_bgcolor = 'rgb(0, 0, 0)',
                   font = list(color = "white"))
  if(!is.na(markers)){
    surf3d <- surf3d %>%
      plotly::add_trace(type = "scatter3d", mode="markers",
                x = markers$X, y = markers$Y, z = markers$Z,
                marker = list(size = size.markers,
                              color = color.markers,
                              opacity = opacity.markers)
      )
  }

  if(export.plot){
    htmlwidgets::saveWidget(as_widget(surf3d), paste0(dirOut, xyz.name))
    print(paste0("'", xyz.name, "' has been saved in '", dirOut, "'"))
  } else {
    print(surf3d)
  }
}



# ## surface with a user-drawn marker
# surf3d_mark <- plot_ly()%>%
#   add_trace(type = "scatter3d", mode="markers",
#             x = 1282.68, y = 1246.93, z = -9.86,
#             marker = list(size = 10,
#                           color = '#FF0000',
#                           opacity = .3)
#   ) %>%
#   add_trace(x = xyz$V1, y = xyz$V2, z = xyz$V3,
#             intensity = xyz$V3, type = 'mesh3d',
#             colorbar = list(title = "Z \u03BCm")) %>%
#   layout(title = "ConFocal surface",
#          scene = list(xaxis = axx, yaxis = axy, zaxis = axz,
#                       aspectmode = 'data'))
# surf3d_mark

# ## surface with calculated markers
# z.max <- xyz[xyz$V3 == max(xyz$V3), ]
# z.min <- xyz[xyz$V3 == min(xyz$V3), ]
# z.intervals <- rbind(z.max, z.min)
# surf3d_marks <- plot_ly()%>%
#   add_trace(type = "scatter3d", mode="markers",
#             x = c(z.intervals$V1), y = c(z.intervals$V2), z = c(z.intervals$V3),
#             marker = list(size = 5,
#                           color = c('#0000FF', '#00FF00'))
#   ) %>%
#   add_trace(x = xyz$V1, y = xyz$V2, z = xyz$V3,
#             intensity = xyz$V3, type = 'mesh3d',
#             colorbar = list(title = "Z \u03BCm")) %>%
#   layout(title = "ConFocal surface",
#          scene = list(xaxis = axx, yaxis = axy, zaxis = axz,
#                       aspectmode = 'data'))
# surf3d_marks

## export in HTML

# # creates https://zoometh.github.io/rockart/surf3d
# saveWidget(as_widget(surf3d_mark), "surf3d_mark.html")
# # creates https://zoometh.github.io/rockart/surf3d_mark
# saveWidget(as_widget(surf3d_marks), "surf3d_marks.html")

#' Compute surface analysis
#' @name geodiv_surface_analysis
#' @description 3D interface or save HTML widgets
#'
#' @param xyz a dataframe with X, Y, and Z columns for the surface
#' @param indices analysis to perform (see geodiv package)
#'
#' @return A dataframe
#'
#' @examples
#'
#' xyz <- read_dat()
#' df <- geodiv_surface_analysis(xyz)
#'
#'
#' @export
geodiv_surface_analysis <- function(xyz = NA,
                                    indices = c("sq", "sa", "sku", "ssk")){

  # xyz <- read.table("confoc_3d.xyz", header = FALSE, sep = "")
  xyz <- as.matrix(xyz)

  if("sq" %in% indices){
    df <- data.frame(sq = geodiv::sq(xyz))
    df[nrow(df) + 1, ] <- 'Root mean square height'
    }
  if("sa" %in% indices){
    df1 <- data.frame(sa = geodiv::sa(xyz))
    df1[nrow(df1) + 1, ] <- 'Average roughness'
    df <- cbind(df, df1)
  }
  if("sku" %in% indices){
    df1 <- data.frame(sku = geodiv::sku(xyz))
    df1[nrow(df1) + 1, ] <- 'Kurtosis'
    df <- cbind(df, df1)
    }
  if("ssk" %in% indices){
    df1 <- data.frame(ssk = geodiv::ssk(xyz))
    df1[nrow(df1) + 1, ] <- 'Skewness'
    df <- cbind(df, df1)
  }
  return(df)
}

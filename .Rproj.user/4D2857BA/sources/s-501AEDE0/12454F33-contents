#' Create a map, whether static or interactive leaflet, from a GeoJSON file
#' @name read_dat
#' @description clean a .dat file coming from the Confocal and export it to .xyz
#'
#' @param map.name the path to a .dat from the ConFocal
#' @param col.xyz indices of the X, Y, and Z columns to read
#' @param xyz.write is TRUE, write a TSV of these columns
#' @param xyz.name name of the TSV output. Only useful if xyz.write is TRUE
#' @param dirOut name of the output folder. Only useful if xyz.write is TRUE
#'
#' @return A dataframe
#'
#' @examples
#'
#' xyz <- read_dat()
#'
#' @export
read_dat <- function(file.path = "https://raw.githubusercontent.com/zoometh/Rdev/master/3dlithic/inst/extdata/confoc_3d.dat",
                     col.xyz = c(1, 2, 3),
                     xyz.write = FALSE,
                     xyz.name = "confoc_3d.xyz",
                     dirOut = paste0(system.file(package = "usewearR"), "/results/")){
  file.data <- read.table(file.path, header = FALSE, sep = "")
  xyz <- file.data[, col.xyz]
  colnames(xyz) <- c("X", "Y", "Z")
  if(xyz.write){
    write.table(file.data, paste0(dirOut, xyz.name),
                sep = " ", row.names = FALSE, col.names = FALSE)
    print(paste0(xyz.name, "saved in: ", dirOut))
  }
  return(xyz)
}


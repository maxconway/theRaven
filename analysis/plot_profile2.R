plot_profile2 <- function(file){
  require(akima) ; require(rgl)
  source('resshape_data.R')
  res = resshape_data(file)
  surface3d(res$distance,res$time,res$concentration)
}
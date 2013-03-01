plot_profiles <- function(files,at,mol){
  require('scatterplot3d')
  require('TeachingDemos')
  source('resshape_data.R')
  plot(0,xlim=c(0,500),ylim=c(0,1000),xlab='distance (micrometers)',ylab='molecules/2.5micrometers',type='n')
  for(file in files){
    res = resshape_data(file)
    subs1 = res[res$time==at,]
    subs2 = res[res$molecule==mol,]
    lines(subs2$distance,subs2$concentration,type='l')
  }
}
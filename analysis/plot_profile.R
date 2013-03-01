plot_profile <- function(file,mol){
require('scatterplot3d')
source('resshape_data.R')
res = resshape_data(file)
#with(subset(res,time==8460),plot(distance,concentration),'.',main='at end')
with(res[res$molecule==mol,],scatterplot3d(distance,time,concentration,pch='o',main=paste(file,' --- ',mol))
}
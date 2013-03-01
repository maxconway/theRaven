plot_profile <- function(file){
require('scatterplot3d')
source('resshape_data.R')
res = resshape_data(file)
#with(subset(res,time==8460),plot(distance,concentration),'.',main='at end')
with(res,scatterplot3d(distance,time,concentration,pch='o',main=file))
}
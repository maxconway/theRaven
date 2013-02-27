plot_profile <- function(file){
library('reshape2')
library('scatterplot3d')
pbcd_profile = read.table(file,header=FALSE)
colnames(pbcd_profile) = c('time',seq(from=50,to=500,by=50))
m = melt(pbcd_profile,id.vars="time")
res = dcast(data=m,formula = time + variable ~ .)
colnames(res) = c('time','distance','concentration')
with(subset(res,time==8460),plot(distance,concentration),'.',main='at end')
with(res,scatterplot3d(distance,time,concentration,pch='o',main='3d'))

}
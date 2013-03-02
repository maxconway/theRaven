resshape_data <- function(file){
  require(reshape2)
  pbcd_profile = read.table(file,header=FALSE)
  colnames(pbcd_profile) = c('molecule','time',seq(from=2.5,to=500,by=2.5))
  m = melt(pbcd_profile,id.vars=c("time",'molecule'))
  res = dcast(data=m,formula = time + variable ~ molecule + .)
  colnames(res)[2]='distance'
  res[2] = as.numeric(levels(res$distance))[res$distance]
  return(res)
}
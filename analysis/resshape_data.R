resshape_data <- function(file){
  require(reshape2)
  pbcd_profile = read.table(file,header=FALSE)
  colnames(pbcd_profile) = c('time',seq(from=0.5,to=500,by=0.5))
  m = melt(pbcd_profile,id.vars="time")
  res = dcast(data=m,formula = time + variable ~ .)
  colnames(res) = c('time','distance','concentration')
  return(res)
}
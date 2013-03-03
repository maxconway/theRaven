resshape_data <- function(file){
  require(reshape2)
  pbcd_profile = read.table(file,header=FALSE)
  colnames(pbcd_profile) = c('molecule','time',seq(from=2.5,to=500,by=2.5))
  m = melt(pbcd_profile,id.vars=c("time",'molecule'))
  res = dcast(data=m,formula = time + variable ~ molecule + .,fun.aggregate=mean)
  colnames(res)[2]='distance'
  res[2] = as.numeric(levels(res$distance))[res$distance]
    res$Bicoid = 100*with(res,1*pbcd+1*pbcd1+2*pbcd2+3*pbcd3+4*pbcd4+5*pbcd5+6*pbcd6+6*(pbcd6phb1+pbcd6phb2))
    res$Hunchback = 100*with(res,1*pbcd6phb1+2*pbcd6phb2)
    res$Caudal = 100*with(res,pcad)
    res$Nanos = 100*with(res,1*pnos+1*boundmhb+1*boundmbcd)
  return(res)
}
files <- list.files(path="./results", pattern="*.result", all.files=T, full.names=F)
for (file in files) {
  res=resshape_data(paste('./results/',file,sep=''))
  res=cbind(rep(sub('.result','',file),length(res)),res)
  colnames(res)[1] = 'model'
  result=rbind(result,res)
#  write.table(res,file=sub('./results/','./results_clean/',file),row.names=TRUE,col.names=TRUE,quote=FALSE,sep=',')
}
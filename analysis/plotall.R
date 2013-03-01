files <- list.files(path="./results", pattern="*.result", all.files=T, full.names=T)
for (file in files) {
  res=resshape_data(file)
  write.table(res,file=sub('./results/','./results_clean/',file),row.names=TRUE,col.names=TRUE,quote=FALSE,sep=',')
  with(res,scatterplot3d(distance,time,concentration,pch='o',main=file))
}
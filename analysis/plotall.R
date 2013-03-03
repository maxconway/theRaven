b = resshape_data(file='results/Highdif-c.result')
plot(c_adjusted$distance,c_adjusted$pbcd,'l')
lines(b_adjusted$distance,b_adjusted$pbcd,'l')
wireframe(pbcd ~ distance * time,b,drape=TRUE,shade=T,pretty=T,scales = list(arrows=FALSE, col = "black"))
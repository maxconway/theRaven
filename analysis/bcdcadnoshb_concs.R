model = resshape_data('./results/Cadnoshb-transc.result')

plot(0,ylim=c(0,14000),xlim=c(0,500),main='Fig.7: Bicoid, Nanos, Caudal, Hunchback',xlab='distance (μm)',ylab='molecules/μm')

text=c('Bicoid','Nanos','Caudal','Hunchback')
legend('topright',text,col=c('blue','green','red','pink'),pch=c('-','-'))

with(model[model$time==8460,],lines(distance,Bicoid,'l',col='blue'))
with(model[model$time==8460,],lines(distance,Nanos,'l',col='green'))
with(model[model$time==8460,],lines(distance,Caudal,'l',col='red'))
with(model[model$time==8460,],lines(distance,Hunchback,'l',col='pink'))
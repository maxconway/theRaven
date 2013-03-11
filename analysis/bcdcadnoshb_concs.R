model = resshape_data('./results/Cadnoshb-transc3e4t5.result')

plot(0,ylim=c(0,1000000),xlim=c(0,500),main='Fig.7: Bicoid, Nanos, Caudal, Hunchback',xlab='distance (μm)',ylab='molecules/μm')

text=c('Bicoid','Nanos','Caudal','Hunchback')
legend('topright',text,col=c('blue','green','red','pink'),pch=c('-','-'))

with(model[model$time==8460,],lines(distance,Bicoid*10^4,'l',col='blue'))
with(model[model$time==8460,],lines(distance,Nanos*10^4,'l',col='green'))
with(model[model$time==8460,],lines(distance,Caudal*10^4,'l',col='red'))
with(model[model$time==8460,],lines(distance,Hunchback*10^4,'l',col='pink'))
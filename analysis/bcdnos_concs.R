model = resshape_data('./results/Middifsl-c-nos.result')

plot(0,ylim=c(0,14000),xlim=c(0,500),main='Fig.7: Bicoid, Nanos',xlab='distance (μm)',ylab='molecules/μm')

text=c('Bicoid','Nanos')
legend('topright',text,col=c('blue','green'),pch=c('-','-'))

with(model[model$time==8460,],lines(distance,Bicoid,'l',col='blue'))
with(model[model$time==8460,],lines(distance,Nanos,'l',col='green'))
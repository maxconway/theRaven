model = resshape_data('./results/Bcd-nos.result')
model1 = resshape_data('./results/Middifsl-ce2t1.result')

plot(0,ylim=c(0,5000000),xlim=c(0,500),main='Fig.5: Bicoid, Nanos',xlab='distance (μm)',ylab='molecules/μm')

text=c('literature','Bicoid','Bicoid no Nanos','Nanos')
legend('topright',text,col=c('black','blue','lightblue','green'),pch=c('-','-'))

with(model[model$time==8460,],lines(distance,Bicoid*10^4,'l',col='blue'))
with(model1[model1$time==8460,],lines(distance,Bicoid*10^2,'l',col='lightblue'))
with(model[model$time==8460,],lines(distance,Nanos*10^4,'l',col='green'))



flyex = read.table(file='bicoid-cycle13',header=T,sep=' ')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$Bicoid = flyex$intensity*1.9*10^4

flyex$stddev = flyex$stddev*1.9*10^4

with(flyex,lines(distance,Bicoid,'l',col='black'))
with(flyex,lines(distance,Bicoid+stddev,'l',col='grey'))
with(flyex,lines(distance,Bicoid-stddev,'l',col='grey'))
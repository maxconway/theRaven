flyex = read.table(file='bicoid-cycle13',header=T,sep=' ')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$Bicoid = flyex$intensity/100
flyex$stddev = flyex$stddev/100

##
png('4-bcdnos',width=1024,height=768)

flyex_scale = 3.2*10^4

model = resshape_data('./results/Middif-nos-e2t10.result')

plot(0,ylim=c(0,4*flyex_scale),xlim=c(0,500),main='Fig.7: Bicoid, Nanos',xlab='distance (μm)',ylab='molecules (μm⁻¹)')
with(flyex,polygon(c(distance,rev(distance)),c((Bicoid+stddev)*flyex_scale,rev((Bicoid-stddev)*flyex_scale)),col='pink',border=NA))

text=c('literature','Bicoid','Nanos')
legend('topright',text,col=c('pink','deeppink','blue'),pch=c('▊','-','-'))

with(model[model$time==8460,],lines(distance,Bicoid*10^2,'l',col='deeppink'))
with(model[model$time==8460,],lines(distance,Nanos*10^2,'l',col='blue'))
dev.off()

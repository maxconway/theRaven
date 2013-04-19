flyex = read.table(file='flyex-13',header=T,sep='\t')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$normcount = flyex$intensity/100
flyex$stddev = flyex$stddev/100

##
png('4-bcdcad.png',width=600,height=400)

flyex_scale_bcd = 8.4*10^4
flyex_scale_cad = 4.4*10^4

model = resshape_data('./results/Midcad1-e3t10.result')

plot(0,ylim=c(0,2*flyex_scale_bcd),xlim=c(0,500),ylab='molecules (μm⁻¹)')
with(flyex[flyex$type=='bcd-bg',],polygon(c(distance,rev(distance)),c((normcount+stddev)*flyex_scale_bcd,rev((normcount-stddev)*flyex_scale_bcd)),col='pink',border=NA))
with(flyex[flyex$type=='cad-bg',],polygon(c(distance,rev(distance)),c((normcount+stddev)*flyex_scale_cad,rev((normcount-stddev)*flyex_scale_cad)),col='palegreen',border=NA))

text=c('Bicoid, FlyEx ± σ','Caudal, FlyEx ± σ','Bicoid','Caudal')
legend('topright',text,col=c('pink','palegreen','deeppink','green'),pch=c('▊','▊','-','-'))

with(model[model$time==8460,],lines(distance,Bicoid*10^3,'l',col='deeppink'))
with(model[model$time==8460,],lines(distance,Caudal*10^3,'l',col='green'))
dev.off()


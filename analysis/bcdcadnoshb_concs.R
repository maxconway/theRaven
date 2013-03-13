flyexbcd = read.table(file='bicoid-cycle13',header=T,sep=' ')
flyexbcd$time = rep(x=8460,times=length(flyexbcd))
flyexbcd$distance = flyexbcd$xcoord*5
flyexbcd$Bicoid = flyexbcd$intensity/100
flyexbcd$bcdstddev = flyexbcd$stddev/100

flyexcad = read.table(file='caudal-cycle13',header=T,sep=' ')
flyexcad$time = rep(x=8460,times=length(flyexcad))
flyexcad$distance = flyexcad$xcoord*5
flyexcad$Caudal = flyexcad$intensity/100
flyexcad$cadstddev = flyexcad$stddev/100

flyex_scale_bcd = 2.0*10^5
flyex_scale_cad = 2.0*10^5


model = resshape_data('./results/Midcadnoshb-e4t10.result')

png('5:bcdnoscadhb',width=640)

plot(0,ylim=c(0,2*max(flyex_scale_bcd,flyex_scale_cad)),xlim=c(0,500),main='Fig.5: Bicoid, Nanos, Caudal, Hunchback',xlab='distance (μm)',ylab='molecules (μm⁻¹)')

text=c('Bicoid, literature','Caudal, literature','Bicoid','Nanos','Caudal','Hunchback')
legend('topright',text,col=c('lightpink','lightgreen','hotpink','blue','green','indianred'),pch=c('▊','▊','-','-'))

with(flyexbcd,polygon(c(distance,rev(distance)),c((Bicoid+bcdstddev)*flyex_scale_bcd,rev((Bicoid-bcdstddev)*flyex_scale_bcd)),col='lightpink',border=NA))
with(flyexcad,polygon(c(distance,rev(distance)),c((Caudal+cadstddev)*flyex_scale_cad,rev((Caudal-cadstddev)*flyex_scale_cad)),col='lightgreen',border=NA))

with(model[model$time==8460,],lines(distance,Bicoid*10^4,'l',col='hotpink'))
with(model[model$time==8460,],lines(distance,Nanos*10^4,'l',col='blue'))
with(model[model$time==8460,],lines(distance,Caudal*10^4,'l',col='green'))
with(model[model$time==8460,],lines(distance,Hunchback*10^4,'l',col='red'))

dev.off()
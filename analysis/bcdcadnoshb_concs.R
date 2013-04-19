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

flyex = read.table(file='flyex-13',header=T,sep='\t')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$normcount = flyex$intensity/100
flyex$stddev = flyex$stddev/100

flyex_scale_hb = 2.2*10^5
flyex_scale_bcd = 6.8*10^4
flyex_scale_cad = 4*10^4


model = resshape_data('./results/Midcadnoshbp3-e3t10.result')
model1 = resshape_data('./results/Midcadnoshbp-e3t10.result')

png('6-bcdnoscadhb.png',width=500,height=500)

plot(0,ylim=c(0,1.2*max(flyex_scale_bcd,flyex_scale_cad,flyex_scale_hb)),xlim=c(0,500),xlab='distance (μm)',ylab='molecules (μm⁻¹)')

text=c('Bicoid, FlyEx ± σ','Caudal, FlyEx ± σ','Hunchback, literature','Bicoid','Nanos','Caudal','Hunchback')
legend('topright',text,col=c('pink','palegreen','lightcoral','deeppink','blue','green','indianred'),pch=c('▊','▊','▊','-','-','-','-'))

with(flyex[flyex$type=='hb-bg',],polygon(c(distance,rev(distance)),c((normcount+stddev)*flyex_scale_hb,rev((normcount-stddev)*flyex_scale_hb)),col='lightcoral',border=NA))
with(flyexbcd,polygon(c(distance,rev(distance)),c((Bicoid+bcdstddev)*flyex_scale_bcd,rev((Bicoid-bcdstddev)*flyex_scale_bcd)),col='pink',border=NA))
with(flyexcad,polygon(c(distance,rev(distance)),c((Caudal+cadstddev)*flyex_scale_cad,rev((Caudal-cadstddev)*flyex_scale_cad)),col='palegreen',border=NA))


with(model[model$time==8460,],lines(distance,Bicoid*10^3,'l',col='deeppink'))
with(model[model$time==8460,],lines(distance,Nanos*10^3,'l',col='blue'))
with(model[model$time==8460,],lines(distance,Caudal*10^3,'l',col='green'))
with(model1[model1$time==8460,],lines(distance,Hunchback*10^3,'l',col='red'))

dev.off()
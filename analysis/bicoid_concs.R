require('scatterplot3d')
require('TeachingDemos')
require('lattice')

#needs:
#flyex
#3 rates
#increasing rate during development
#directed gradient at: fertilization, cycle 3
flyex = read.table(file='flyex-13',header=T,sep='\t')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$normcount = flyex$intensity/100
flyex$stddev = flyex$stddev/100

##
png('2-diffusion-rates.png',width=500,height=500)

flyex_scale = 0.76*10^5
plot(1,col='white',ylab='molecules (μm⁻¹)',ylim=c(0,3*flyex_scale),xlim=c(0,500),main='Fig.2: Diffusion rates',xlab='distance (μm)')
with(flyex[flyex$type=='bcd-nbg',],polygon(c(distance,rev(distance)),c((normcount+stddev)*flyex_scale,rev((normcount-stddev)*flyex_scale)),col='lightgrey',border=NA))
text=c('literature','D=7.4μm²/s','D=4μm²/s','D=0.3μm²/s','Increasing translation rate, D=4μm²/s','mRNA diffusion from fertilization, D=4μm²/s','mRNA diffusion from cycle 3, D=4μm²/s')
legend('topright',text,col=c('grey','darkblue','dodgerblue','aquamarine','red','darkred','deeppink'),pch=c('▊','-','-','-','-','-','-'))

high = resshape_data('./results/Highdif-e2t10.result')
medium = resshape_data('./results/Middif-e2t10.result')
low = resshape_data('./results/Lowdif-e2t10.result')

with(high[high$time==8460,],lines(distance,Bicoid*10^2,'l',col='darkblue'))
with(medium[medium$time==8460,],lines(distance,Bicoid*10^2,'l',col='dodgerblue'))
with(low[low$time==8460,],lines(distance,Bicoid*10^2,'l',col='aquamarine'))

changing_trans = resshape_data('./results/Middif-c-e2t10.result')
gradient0 = resshape_data('./results/Middifs-e2t10.result')
gradient3 = resshape_data('./results/Middifsl-e2t10.result')

with(changing_trans[changing_trans$time==8460,],lines(distance,Bicoid*10^2,'l',col='red'))
with(gradient0[gradient0$time==8460,],lines(distance,Bicoid*10^2,'l',col='darkred'))
with(gradient3[gradient3$time==8460,],lines(distance,Bicoid*10^2,'l',col='deeppink'))

dev.off()

##
model = resshape_data('./results/Middif-e2t10.result')
wireframe(Bicoid*10^2 ~ distance * time,model,par.settings=list(axis.line = list(col = "transparent")),colorkey=NULL,drape=TRUE,shade=T,pretty=T,scales = list(arrows=FALSE, col = "black"),main='Fig.3 diffusion of 4μm²/s, changing translation rate',xlab='distance (μm)',ylab='time (s)',zlab=list('molecules (μm⁻¹)',rot=90))








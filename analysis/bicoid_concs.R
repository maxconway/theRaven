require('scatterplot3d')
require('TeachingDemos')
require('lattice')

#needs:
#flyex
#3 rates
#increasing rate during development
#directed gradient at: fertilization, cycle 3
flyex = read.table(file='bicoid-cycle13',header=T,sep=' ')
flyex$time = rep(x=8460,times=length(flyex))
flyex$distance = flyex$xcoord*5
flyex$Bicoid = flyex$intensity/100
flyex$stddev = flyex$stddev/100

##
png('2:diffusion-rates.png',width=640)

flyex_scale = 1.8*10^5
with(flyex,plot(distance,Bicoid*flyex_scale,'l',ylab='molecules (μm⁻¹)',col='black',ylim=c(0,3*flyex_scale),main='Fig.2: Diffusion rates'),xlab='distance (μm)')
with(flyex,polygon(c(distance,rev(distance)),c((Bicoid+stddev)*flyex_scale,rev((Bicoid-stddev)*flyex_scale)),col='lightgrey',border=NA))
text=c('literature','7.4μm²/s','4μm²/s','0.3μm²/s','Increasing translation rate','mRNA diffusion from fertilization','mRNA diffusion from cycle 3')
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
model = resshape_data('./results/Middif-c-e2t10.result')
wireframe(Bicoid*10^2 ~ distance * time,model,drape=TRUE,shade=T,pretty=T,scales = list(arrows=FALSE, col = "black"),main='Fig.3 diffusion of 4μm²/s, changing translation rate',xlab='distance (μm)',ylab='time (s)',zlab=list('molecules (μm⁻¹)',rot=90))








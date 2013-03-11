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
flyex$Bicoid = flyex$intensity*40*10

flyex$stddev = flyex$stddev*40*10

##
with(flyex,plot(distance,Bicoid,'l',col='black',ylim=c(0,80000),main='Fig.2: Diffusion rates'),xlab='distance (μm)',ylab='molecules/μm')
with(flyex,lines(distance,Bicoid+stddev,'l',col='grey'))
with(flyex,lines(distance,Bicoid-stddev,'l',col='grey'))
legend('topright',c('literature','7.4μm²/s','4μm²/s','0.3μm²/s'),col=c('black','darkblue','dodgerblue','aquamarine'),pch=c('-','-','-','-'))

high = resshape_data('./results/highdif.result')
medium = resshape_data('./results/middif.result')
low = resshape_data('./results/lowdif.result')

with(high[high$time==8460,],lines(distance,Bicoid,'l',col='darkblue'))
with(medium[medium$time==8460,],lines(distance,Bicoid,'l',col='dodgerblue'))
with(low[low$time==8460,],lines(distance,Bicoid,'l',col='aquamarine'))
##
with(flyex,plot(distance,Bicoid,'l',col='black',ylim=c(0,80000),main='Fig.3: Dynamic models at diffusion = 4μm²/s'),xlab='distance (μm)',ylab='molecules/μm')
with(flyex,lines(distance,Bicoid+stddev,'l',col='grey'))
with(flyex,lines(distance,Bicoid-stddev,'l',col='grey'))
text=c('literature','Increasing translation rate','mRNA diffusion from fertilization','mRNA diffusion from cycle 3')
legend('topright',text,col=c('black','red','olivedrab','forestgreen'),pch=c('-','-','-','-'))

changing_trans = resshape_data('./results/Middif-c.result')
gradient0 = resshape_data('./results/middifs.result')
gradient3 = resshape_data('./results/middifsl.result')

with(changing_trans[changing_trans$time==8460,],lines(distance,Bicoid,'l',col='red'))
with(gradient0[gradient0$time==8460,],lines(distance,Bicoid,'l',col='olivedrab'))
with(gradient3[gradient3$time==8460,],lines(distance,Bicoid,'l',col='forestgreen'))
##
with(flyex,plot(distance,Bicoid,'l',col='black',ylim=c(0,80000),main='Fig.4: Complete model'),xlab='distance (μm)',ylab='molecules/μm')
with(flyex,lines(distance,Bicoid+stddev,'l',col='grey'))
with(flyex,lines(distance,Bicoid-stddev,'l',col='grey'))

model = resshape_data('./results/Middifsl-c.result')

with(model[model$time==8460,],lines(distance,Bicoid,'p',col='blue'))

##
model = resshape_data('./results/Middifsl-c.result')
wireframe(Bicoid ~ distance * time,model,drape=TRUE,shade=T,pretty=T,scales = list(arrows=FALSE, col = "black"))








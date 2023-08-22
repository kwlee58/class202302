
## @knitr setup
opts_chunk$set(echo=FALSE, fig.path='figure/Rfig-', cache.path='cache-jss725/', dev='tikz', cache=TRUE, out.width='.49\\linewidth', aniopts='controls,autoplay,loop', fig.show='animate', results='asis', fig.width=5, fig.height=5)
render_sweave() # use boring Sweave environments
set_header(highlight = '') # do not use the Sweave.sty package
pdf.options(family = 'Palatino')
options(width = 84, digits=3, prompt='R> ', continue = "+  ")
library(animation); library(formatR)
set.seed(31415)  # for reproducibility
knit_hooks$set(custom.plot = hook_plot_custom)


## @knitr rotation
palette(c("black", "red"))
op = par(mar = rep(0, 4))
plot(x <- c(1:4, 4:1), y <- rep(2:1, each = 4), ann = F,
    type = "n", axes = F, xlim = c(0.55, 4.45), ylim = c(0.55,
        2.45), xaxs = "i", yaxs = "i")
rect(x - 0.45, y - 0.45, x + 0.45, y + 0.45, border = "darkgray")
s = seq(0, 360, length = 8)
for (i in 1:8) {
    text(x[i], y[i], "Animation", srt = s[i], col = i,
        cex = 0.5 + 40 * i/360)
}
text(x, y - 0.45, paste("00:0", 1:8, sep = ""), adj = c(0.5,
    -0.2), col = "darkgray", cex = 0.75, font = 2)
arrows(c(1:3 + 0.35, 4:2 - 0.35), rep(2:1, each = 3),
    c(1:3 + 0.65, 4:2 - 0.65), rep(2:1, each = 3), length = 0.15,
    col = "darkgray")
arrows(4, 1.55, 4, 1.45, length = 0.1, col = "darkgray")
par(op)
palette("default")


## @knitr grad-desc-a
ani.options(interval = 0.2, nmax = 40)
par(mar=c(4,4,2,.1),mgp=c(2,.9,0))
grad.desc()

## @knitr grad-desc-b
ani.options(interval = 0.2, nmax = 50)
par(mar=c(4,4,2,.1),mgp=c(2,1,0))
f2 = function(x, y) sin(1/2 * x^2 - 1/4 * y^2 + 3) * 
    cos(2 * x + 1 - exp(y))
grad.desc(f2, c(-2, -2, 2, 2), c(-1, 0.5), gamma = 0.3, 
    tol = 1e-04)


## @knitr sampling-methods-a
ani.options(interval = 1, nmax = 20)
par(mar=rep(.5,4))
sample.simple()

## @knitr sampling-methods-b
par(mar=rep(.5,4))
sample.strat(col = c("bisque", "white")) 


## @knitr sampling-methods-c
par(mar=rep(.5,4))
sample.cluster(col = c("bisque", "white"))

## @knitr sampling-methods-d
par(mar=rep(.5,4))
sample.system() 


## @knitr buffon-needle
set.seed(365)
ani.options(interval = .1, nmax = 50)
par(mar = c(3, 2.5, 1, 0.2), pch = 20, mgp = c(1.5, 0.5, 0)) 
buffon.needle() 


## @knitr boot-iid
set.seed(365)
ani.options(interval = .5, nmax = 40)
par(mar = c(3, 2.5, .1, 0.1), mgp = c(1.5, 0.5, 0)) 
boot.iid(faithful$eruptions, main=c('',''),breaks=15) 


## @knitr ObamaSpeech
ani.options(interval = 0.5,nmax=40)
data('ObamaSpeech')
par(mar = c(3, 2.5, .1, 0.1), mgp = c(1.5, 0.5, 0)) 
moving.block(dat = ObamaSpeech, FUN = function(..., dat = dat, 
    i = i, block = block) {
    plot(..., x = i + 1:block, xlab = "paragraph index", ylim = range(dat), 
        ylab = sprintf("ObamaSpeech[%s:%s]", i + 1, i + block))
}, type = "o", pch = 20)


## @knitr schema
library('animation')
oopt <- ani.options(interval = 0.2, nmax = 10)
for (i in 1:ani.options("nmax")) {
    ## draw your plots here, then pause for a while with
    ani.pause() 
}
ani.options(oopt)


## @knitr brownian-motion-source
brownian.motion


## @knitr brownian-motion
set.seed(321)
ani.options(interval = 0.1,nmax=50)
par(mar = c(3, 3, .1, 0.1), mgp = c(2, 0.5, 0), tcl = -0.3, 
        cex.axis = 0.8, cex.lab = 0.8)
brownian.motion(pch = 21, cex = 4, col = "red", bg = "yellow",xlim=c(-12,12),ylim=c(-12,12))


## @knitr usage-saveHTML
usage(saveHTML) 


## @knitr saveHTML
saveHTML({
    ani.options(interval = 0.05, nmax = 50)
    par(mar = c(4, 4, .1, 0.1), mgp = c(2, 0.7, 0))
    brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow")
}, img.name = "bm_plot", ani.height=300, ani.width=550,
    title = "Demonstration of the Brownian Motion", 
    description = c("Random walk on the 2D plane: for each point", 
        "(x, y), x = x + rnorm(1) and y = y + rnorm(1)."))


## @knitr Rweb-demo
system.file('misc', 'Rweb', 'demo.html', package = 'animation')


## @knitr saveLatex-usage
usage(saveLatex, width=.7)


## @knitr saveGIF-usage
usage(saveGIF)
usage(saveSWF)
usage(saveVideo)


## @knitr ani-record
oopt <- ani.options(nmax = 50, interval = .1)
x <- cumsum(rnorm(n=ani.options('nmax')))
ani.record(reset=TRUE)
par(bg = 'white', mar=c(4,4,.1,.1))
plot(x, type = 'n')
for (i in 1:length(x)) {
points(i, x[i])
ani.record()
}
ani.replay()
ani.options(oopt)


## @knitr rgl-animation
library(animation) # adapted from demo('rgl_animation')
data(pollen)
uM = matrix(c(-0.37, -0.51, -0.77, 0, -0.73, 0.67, -0.1, 0, 0.57, 0.53, -0.63, 0, 0, 0, 0, 1), 4, 4)
library(rgl)
open3d(userMatrix = uM, windowRect = c(0, 0, 400, 400))
plot3d(pollen[, 1:3])
zm = seq(1, 0.05, length = 20)
par3d(zoom = 1)  # change the zoom factor gradually later
for (i in 1:length(zm)) {
    par3d(zoom = zm[i]); Sys.sleep(.05)
    rgl.snapshot(paste(fig_path(i), 'png', sep = '.'))
}


## @knitr demo-rgl
file.show(system.file('demo', 'rgl_animation.R', package='animation'))
file.show(system.file('demo', 'flowers.R', package='animation'))


## @knitr sim-qqnorm-source
sim.qqnorm


## @knitr sim-qqnorm-a
set.seed(127)
ani.options(nmax = 30)
par(mar = c(3, 3, 1, 0.1), mgp = c(1.5, 0.5, 0), tcl = -0.3) 
sim.qqnorm(20,last.plot = expression(abline(0, 1)),asp=1,xlim=c(-3,3),ylim=c(-3,3))

## @knitr sim-qqnorm-b
par(mar = c(3, 3, 1, 0.1), mgp = c(1.5, 0.5, 0), tcl = -0.3) 
sim.qqnorm(100,last.plot = expression(abline(0, 1)),asp=1,xlim=c(-3.3,3.5),ylim=c(-3.3,3.5))


## @knitr clt-ani-a
set.seed(721)
ani.options(interval = .5, nmax = 50)
par(mar = c(3, 3, .2, 0.1), mgp = c(1.5, 0.5, 0), tcl = -0.3) 
clt.ani(FUN=runif, mean=.5, sd=sqrt(1/12))

## @knitr clt-ani-b
par(mar = c(3, 3, .2, 0.1), mgp = c(1.5, 0.5, 0), tcl = -0.3) 
clt.ani(FUN=rcauchy, mean=NULL)


## @knitr gene-expr-data
set.seed(130)
library('hddplot')
data('Golub')
data('golubInfo')
ani.options(nmax=10)
par(mar = c(3, 3, 0.2, 0.7), mgp = c(1.5, 0.5, 0))
res=cv.nfeaturesLDA(t(Golub), cl=golubInfo$cancer,k=5,cex.rg=c(0,3),pch=19)


## @knitr gene-results


## @knitr accuracy
res$accuracy
res$optimum


## @knitr reproduce-jss725
install.packages(c('hddplot', 'rgl', 'tikzDevice', 'animation', 'knitr'))
library(knitr)
knit('jss725.Rnw')



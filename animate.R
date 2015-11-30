library(animation)
source("cardioidr.R")

fwd <- seq(1.5, 1.99, 0.0025)
rev <- rev(fwd)
rev <- rev[2:(length(rev) - 1)]
trace.animate <- function () {
  lapply(c(fwd, rev), function(i) print(cardioid(72, i)))
}

saveGIF(trace.animate(), interval=0.1, movie.name="anim.gif")

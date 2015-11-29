# Just fooling around with a pattern I found here:
# http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/nov/26/solving-for-xmas-how-to-make-mathematical-christmas-cards

library(ggplot2)
cardioid <- function(num_pts, stride) {
  radian_indices <- seq(0, 2*pi, length.out=num_pts + 1)[1:num_pts]
  pts <- data.frame(x = cos(radian_indices), y = sin(radian_indices))
  startx <- pts$x[1:num_pts]
  starty <- pts$y[1:num_pts]
  end_indices <- (1:num_pts * stride) %% num_pts
  end_indices[which(end_indices == 0)] = num_pts
  endx <- pts$x[end_indices]
  endy <- pts$y[end_indices]
  df2 <- data.frame(x = startx, xend= endx, y = starty, yend = endy)
  p <- ggplot(pts, aes(x = x, y = y)) + geom_point()
  p <- p + geom_segment(data=df2, mapping=aes(x=x, y=y, xend=xend,yend=yend))
  return(p)
}

cardioid(72, 2)




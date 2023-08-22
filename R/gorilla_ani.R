library(animation)

ani.options(interval = 1)
set.seed(1)
rect(0, 0, 1, 1, col = "yellow")
points(c(0.2, 0.3, 0.4), 
       rep(0.5, 3), 
       type = "p",
       pch = 21, bg = "white", cex = 5, lwd = 5)
points(c(0.6, 0.7, 0.8), 
       rep(0.5, 3), 
       type = "p",
       pch = 21, bg = "black", cex = 5, lwd = 5)
dev.copy(png, file = paste0("./pics/gorilla/gorilla1.png"), width = 640, height = 640)
dev.off()
ani.pause()
plot.new()
for (i in 2:18){
  rect(0, 0, 1, 1, col = "yellow")
    points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
           sample(seq(0.1, 0.9, by = 0.05), size = 3), 
           type = "b",
           pch = 21, bg = "white", cex = 5, lwd = 5)
    points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
           sample(seq(0.1, 0.9, by = 0.05), size = 3), 
           type = "b",
           pch = 21, bg = "black", cex = 5, lwd = 5)
    if(i > 8 && i < 12){
      points(0.3 * i - 2.5, 3.5 - 0.3 * i, pch = 21, bg = "grey", cex = 5)
    }
    ani.pause()
    dev.copy(png, file = paste0("./pics/gorilla/gorilla", i, ".png"), width = 640, height = 640)
    dev.off()
}
plot.new()
rect(0, 0, 1, 1, col = "yellow")
  points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         type = "p",
         pch = 21, bg = "white", cex = 5, lwd = 5)
  points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         type = "p",
         pch = 21, bg = "black", cex = 5, lwd = 5)
  dev.copy(png, file = paste0("./pics/gorilla/gorilla19.png"), width = 640, height = 640)
  dev.off()
ani.pause()
plot.new()
rect(0, 0, 1, 1, col = "yellow")
dev.copy(png, file = paste0("./pics/gorilla/gorilla20.png"), width = 640, height = 640)
dev.off()

ani.options(interval = 1)
set.seed(1)
rect(0, 0, 1, 1, col = "yellow")
points(c(0.2, 0.3, 0.4), 
       rep(0.5, 3), 
       type = "p",
       pch = 21, bg = "white", cex = 5, lwd = 5)
points(c(0.6, 0.7, 0.8), 
       rep(0.5, 3), 
       type = "p",
       pch = 21, bg = "black", cex = 5, lwd = 5)
dev.copy(png, file = paste0("./pics/gorilla/gorilla_col1.png"), width = 640, height = 640)
dev.off()
ani.pause()
start_color <- hcl(h = 60, c = 100, l = 90)  # yellow
end_color <- hcl(h = 120, c = 100, l = 90) # green
plot.new()
for (i in 2:20){
  colors <- colorRampPalette(c(start_color, end_color))(20)
  rect(0, 0, 1, 1, col = colors[i])
  points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         type = "b",
         pch = 21, bg = "white", cex = 5, lwd = 5)
  points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         sample(seq(0.1, 0.9, by = 0.05), size = 3), 
         type = "b",
         pch = 21, bg = "black", cex = 5, lwd = 5)
  if(i > 8 && i < 12){
    points(0.3 * i - 2.5, 3.5 - 0.3 * i, pch = 21, bg = "grey", cex = 5)
  }
  ani.pause()
  dev.copy(png, file = paste0("./pics/gorilla/gorilla_col", i, ".png"), width = 640, height = 640)
  dev.off()
}
plot.new()
rect(0, 0, 1, 1, col = end_color)
points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
       sample(seq(0.1, 0.9, by = 0.05), size = 3), 
       type = "p",
       pch = 21, bg = "white", cex = 5, lwd = 5)
points(sample(seq(0.1, 0.9, by = 0.05), size = 3), 
       sample(seq(0.1, 0.9, by = 0.05), size = 3), 
       type = "p",
       pch = 21, bg = "black", cex = 5, lwd = 5)
dev.copy(png, file = paste0("./pics/gorilla/gorilla_col21.png"), width = 640, height = 640)
dev.off()
ani.pause()
plot.new()
rect(0, 0, 1, 1, col = end_color)
dev.copy(png, file = paste0("./pics/gorilla/gorilla_col22.png"), width = 640, height = 640)
dev.off()



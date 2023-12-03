W22_2 <- c(760, 239)
W22_1 <- c(644, 198)
W21_2 <- c(422, 144)
W21_1 <- c(333, 126)
W20_2 <- c(220, 68)
W20_1 <- c(90, 49)
W19_2 <- c(88, 47)
W19_1 <- c(95, 38)
W18_2 <- c(87, 43)
W17_2 <- c(110, 47)
W17_1 <- c(105, 37)
W16_2 <- c(63, 28)
W16_1 <- c(44, 19)
WW <- cbind(W16_1, W16_2, W17_1, W17_2, W18_2, W19_1, W19_2, W20_1, W20_2, W21_1, W21_2, W22_1, W22_2)
semesters <- c("16/1", "16/2", "17/1", "17/2", "18/2", "19/1", "19/2", "20/1", "20/2", "21/1", "21/2", "22/1", "22/2")
colnames(WW) <- semesters
apply(WW, MARGIN = 2, proportions) %>% 
  `*`(100) %>% 
  round(1)
mosaicplot(WW)
source("./R/mosaic_gg.R")
library(ggplot2)
m_list <- mosaic_gg(as.table(WW))
m <- m_list$m
df <- m_list$df
p_df <- m_list$p_df
str(p_df)
y_min <- min(p_df$y_breaks)
y_max <- sort(unique(p_df$y_breaks[p_df$y_breaks < 0.99]), decreasing = TRUE)[1]
m_list$m +
  geom_text(aes(x = center, y = 1.05),
            family = "KoPubWorldDotum Medium",
            label = p_df[, 2]) + 
  theme_bw() +
  scale_y_continuous(breaks = c(0, y_min, y_max, 1),
                     labels = format(c(0, y_min, y_max, 1) * 100, digits = 2, nsmall = 1)) +
  labs(x = "학기별 수강 인원 누적(%)", y = "내가 남보다 vs 남이 나보다(%)") + 
  ggtitle("The more, the better?") + 
  scale_fill_brewer(name = "", 
                    labels = c("내가 남보다", "남이 나보다"),
                    type = "qual", 
                    palette = "Set2", 
                    direction = 1) +
  theme(axis.title.x = element_text(family = "KoPubWorldDotum Light"),
        axis.title.y = element_text(family = "KoPubWorldDotum Light"),
        legend.text = element_text(family = "KoPubWorldDotum Light"),
        plot.title = element_text(size = 20, hjust = 0.5, family = "KoPubWorldDotum Bold"))
ggsave("./pics/Which_world_mosaic_ggplot.png", width = 16, height = 8, dpi = 72)

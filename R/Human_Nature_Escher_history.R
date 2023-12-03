library(magrittr)
W19_1 <- c(119, 19)
W18_2 <- c(120, 17)
W18_1 <- c(98, 24)
W17_2 <- c(120, 31)
W17_1 <- c(91, 39)
WW <- cbind(W17_1, W17_2, W18_1, W18_2, W19_1)
semesters <- c("17/1", "17/2", "18/1", "18/2", "19/1")
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
  labs(x = "학기별 응답 인원 누적(%)", y = "천사 vs 악마(%)") + 
  ggtitle("Circle Limit IV") + 
  scale_fill_brewer(name = "", 
                    labels = c("악마", "천사"),
                    type = "qual", 
                    palette = "Set2", 
                    direction = -1) +
  theme(axis.title.x = element_text(family = "KoPubWorldDotum Light"),
        axis.title.y = element_text(family = "KoPubWorldDotum Light"),
        legend.text = element_text(family = "KoPubWorldDotum Light"),
        plot.title = element_text(size = 20, hjust = 0.5, family = "KoPubWorldDotum Bold"))
ggsave("./pics/Human_Nature_Escher_mosaic_ggplot.png", width = 8, height = 6, dpi = 300)

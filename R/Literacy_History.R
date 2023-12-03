W22_2 <- c(839, 164)
W22_1 <- c(734, 108)
W21_2 <- c(510, 66)
W21_1 <- c(419, 32)
W20_2 <- c(277, 16)
W20_1 <- c(113, 16)
W19_2 <- c(119, 33)
W19_1 <- c(135, 13)
W18_2 <- c(127, 4)
W18_1 <- c(156, 15)
W17_2 <- c(146, 13)
W17_1 <- c(139, 15)
W16_2 <- c(81, 9)
W16_1 <- c(60, 1)
W15_2 <- c(51, 6)
W15_1 <- c(48, 3)
W14_1 <- c(60, 11)
W10_2 <- c(55, 13)
WW <- cbind(W10_2, W14_1, W15_1, W15_2, W16_1, W16_2, W17_1, W17_2, W18_1, W18_2, W19_1, W19_2, W20_1, W20_2, W21_1, W21_2, W22_1, W22_2)
semesters <- c("10/01", "14/1", "15/1", "15/2",  "16/1", "16/2", "17/1", "17/2", "18/1", "18/2", "19/1", "19/2", "20/1", "20/2", "21/1", "21/2", "22/1", "22/2")
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
  labs(x = "학기별 응답 인원 누적(%)", y = "IV 등급 vs III 등급 이하") + 
  ggtitle("문해력 등급") + 
  scale_fill_brewer(name = "", 
                    labels = c("IV", "III 이하"),
                    type = "qual", 
                    palette = "Set2", 
                    direction = 1) +
  theme(axis.title.x = element_text(family = "KoPubWorldDotum Light"),
        axis.title.y = element_text(family = "KoPubWorldDotum Light"),
        legend.text = element_text(family = "KoPubWorldDotum Light"),
        plot.title = element_text(size = 20, hjust = 0.5, family = "KoPubWorldDotum Bold"))
ggsave("./pics/Literacy_history_ggplot.png", width = 16, height = 8, dpi = 72)

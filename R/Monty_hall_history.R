library(magrittr)
M22_1 <- c(530, 290)
M21_2 <- c(312, 229)
M21_1 <- c(289, 149)
M20_2 <- c(183, 84)
M20_1 <- c(112, 31)
M19_2 <- c(89, 50)
M19_1 <- c(82, 49)
M18_2 <- c(83, 47)
M18_1 <- c(120, 47)
M17_2 <- c(111, 53)
M17_1 <- c(90, 37)
M16_2 <- c(70, 14)
M16_1 <- c(41, 15)
MH <- cbind(M16_1, M16_2, M17_1, M17_2, M18_2, M18_2, M19_1, M19_2, M20_1, M20_2, M21_1, M21_2, M22_1)
semesters <- c("16/1", "16/2", "17/1", "17/2", "18/1", "18/2", "19/1", "19/2", "20/1", "20/2", "21/1", "21/2", "22/1")
colnames(MH) <- semesters
apply(MH, MARGIN = 2, proportions) %>% 
  `*`(100) %>% 
  round(1)
mosaicplot(MH)
source("./R/mosaic_gg.R")
library(ggplot2)
library(extrafont)
m_list <- mosaic_gg(as.table(MH))
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
  labs(x = "학기별 수강 인원 누적(%)", y = "고수한다 vs 바꾼다(%)") + 
  ggtitle("Monty Hall Show") + 
  scale_fill_brewer(name = "", 
                    labels = c("고수한다", "바꾼다"),
                    type = "qual", 
                    palette = "Set2", 
                    direction = 1) +
  theme(axis.title.x = element_text(family = "KoPubWorldDotum Light"),
        axis.title.y = element_text(family = "KoPubWorldDotum Light"),
        legend.text = element_text(family = "KoPubWorldDotum Light"),
        plot.title = element_text(size = 20, hjust = 0.5, family = "KoPubWorldDotum Bold"))
ggsave("./pics/Monty_Hall_mosaic_ggplot.png", width = 16, height = 8, dpi = 72)

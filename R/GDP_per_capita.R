library(readxl)
GDP <- read_excel("./data/GDP_per_capita_kr.xlsx",
           range = "B1:B63")
GDP <- as.vector(GDP)
names(GDP) <- "GDP"
GDP <- GDP$GDP
Year <- 1960:2021
GDP_df <- data.frame(Year, GDP)
str(GDP_df)
par(family = "KoPubWorldDotum Medium",
    mar = c(5.1, 6.1, 4.1, 2.1))
plot(GDP ~ Year, data = GDP_df, 
     type ="b", 
     pch = 17, 
     lwd = 1, 
     xlim= c(1960, 2022),
     ylim = c(0, 37000),
     ann = FALSE,
     axes = FALSE)
axis(side = 1, 
     at = c(1960, 1977, 1989, 1994, 1998, 2006, 2017, 2021),
     labels = c(1960, 1977, 1989, 1994, 1998, 2006, 2017, 2021),
     las = 1)
axis(side = 2, 
     at = seq(0, 35000, by = 5000), 
     labels = format(seq(0, 35000, by = 5000), big.mark = ","),
     las = 2)
abline(h = seq(0, 35000, by = 5000), lty = 3)
abline(v = c(1960, 1977, 1989, 1994, 1998, 2006, 2017, 2021), lty = 3)
box("plot")
event_indx <- 
  match(c(1960, 1977, 1989, 1994, 1998, 2006, 2017, 2021), Year)
text(x = Year[event_indx],
     y = GDP[event_indx],
     labels = format(GDP[event_indx], big.mark = ","),
     pos = c(3, 1, 2, 2, 4, 2, 2, 3))
text(x = c(1998, 2009, 2020),
     y = GDP[c(39, 50, 61)],
     labels = c("IMF\n외환위기", "서브프라임\n금융위기", "코로나19\n대유행"),
     col = "red",
     pos = 1)
title(ylab = "1인당 GDP(달러)", line = 4)
title(xlab = "연도")
title(main = "1인당 GDP의 변화",
      cex.main = 1.8,
      family = "KoPubWorldDotum Bold")
dev.copy(png, file = "./pics/GDP_per_capita_kr.png", width = 720, height = 480)
dev.off()

TED_data <-
function(RData = "./red_and_black_201128_data.RData",
         data, 
         startrow,
         endrow,
         date){
  load(RData)
  ted <- read.xlsx(data, 
                   sheetIndex = 1, 
                   startRow = startrow, 
                   endRow = endrow, 
                   colIndex = 1:6,
                   header = FALSE,
                   encoding = "UTF-8",
                   stringsAsFactors = FALSE)
  names(ted) <- c("serial_no", "title", "name", "id", "time", "contents")
  str(ted)
  class(ted$id) <- "character"
  ted$group <- class_roll$group[match(ted$id, class_roll$id)]
  ted[, c("serial_no", "id", "name", "group")] 
  ted_data <- left_join(class_roll[, c("id", "name", "group")], ted, 
                        by = c("id", "name", "group"))
  dup_id <- ted_data$id %>% 
  duplicated %>% 
  which
  if(length(dup_id) > 0) {
    ted_data <- ted_data[-dup_id, ]
  }
  ted_data$submit <- ifelse(is.na(ted_data$time), "미제출", "제출")
  ted_data$hours_passed <- as.numeric(difftime(Sys.time(), ted_data$time, units = 'days'))
## 학교 정보시스템이 GMT로 표기되어 있어서 9시간의 타임갭을 감안하여야 함.
ted_data$days <- as.numeric(difftime(date, ted_data$time, units = 'days'))
ted_data$hours <- as.numeric(difftime(date, ted_data$time, units = 'hours'))
ted_data$bird <- factor(ifelse(ted_data$days >= 1, "Early", "Late"), 
                        labels = c("마감일 이전 제출", "마감일 제출"))
ted_data$n_chars <- ted_data$contents %>% nchar
str(ted_data)
ted_data}

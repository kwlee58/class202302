library(magrittr)
load("./R/red_and_black_230307_data.RData")
id_wrong_gr <- c("20232903", 
                 "20236104", 
                 "20232304", 
                 "20232603", 
                 "20191011", 
                 "20235127", 
                 "20234115",
                 "20192845",
                 "20233220",
                 "20221614",
                 "20232540",
                 "20236137",
                 "20236147",
                 "20191222",
                 "20233001",
                 "20236150",
                 "20233727",
                 "20233636",
                 "20236769",
                 "20203539",
                 "20217092",
                 "20221097",
                 "20236165",
                 "20203349",
                 "20191537",
                 "20231099")
length(id_wrong_gr)
class_roll <- data.frame(class_roll)
list_df <- class_roll[class_roll$id %in% id_wrong_gr, c("id", "name", "group")] 
list_df[order(list_df$name), ]
list_df$group2 <- ifelse(list_df$group == "Red", "Black", "Red")
list_df[order(list_df$name), ]
class_roll$group2 <- class_roll$group
class_roll[class_roll$id %in% id_wrong_gr, "group2"] <- 
  ifelse(class_roll[class_roll$id %in% id_wrong_gr, "group2"] == "Red", "Black", "Red")
class_roll[class_roll$id %in% id_wrong_gr, c("id", "name", "group", "group2")]
class_roll$group_bak <- class_roll$group
class_roll$group <- class_roll$group2
class_roll <- rbind(class_roll, c("경영대학", "경영학과", "2", "20202938", "김철민", "학생", "", "010-9243-8622", "Red", "2020", "Red", "Red"))
saveRDS(class_roll, file = "./R/class_roll_230404.RDS")

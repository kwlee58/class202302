load("./R/red_and_black_200524_data.RData")
ls()
class_roll_order <- class_roll[order(class_roll$name), ]
class_roll_order[c("id", "name", "cell_no")] 
class_roll_order[class_roll_order$id == "20142709", "cell_no"] <- "010-2851-1314"
cbind(class_roll_order[c(seq(1, 23, by = 2), seq(26, 168, by = 2)), c("id", "name", "cell_no")], 
      class_roll_order[c(seq(2, 24, by = 2), seq(27, 169, by = 2)), c("id", "name", "cell_no")], row.names = NULL)

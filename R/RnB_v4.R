red_and_black <-
function(k){
  set.seed(k)
  id_red <- sample(1:N_new, size = red_new)
  class_roll[class_roll$id %in% id_new, "group"] <- 
    factor(ifelse(1:N_new %in% id_red, "Red", "Black"), 
           levels = c("Red", "Black")) 
#  class_roll <- subset(class_roll, class_roll$id  %in% id_new)
## 학번
  class_roll$id_2 <-
    class_roll$id %>%
    substr(1, 4) %>%
    ifelse(. <= 2016, "2016", .)
  X1 <- class_roll %$%
    table(.$group, .$id_2) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## 학번 홀짝
  X2 <- class_roll$id %>%
    as.numeric %>%
    `%%`(2) %>%
    factor(levels = c(1, 0), labels = c("홀", "짝")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## 학적 상태
  X3 <- class_roll$status %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## e-mail 서비스업체
  X4 <- class_roll$email %>%
    strsplit("@", fixed = TRUE) %>%
    sapply("[", 2) %>%
    `==`("naver.com") %>%
    ifelse("네이버", "기타서비스") %>%
    factor(levels = c("네이버", "기타서비스")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## 전화번호의 분포
  cut_label <- paste(paste0(0:9, "000"), paste0(0:9, "999"), sep = "~")
  X5 <- class_roll$cell_no %>%
    substr(start = 8, stop = 11) %>%
    sapply(as.numeric) %>%
    cut(labels = cut_label, 
        breaks = seq(0, 10000, by = 1000)) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## 성씨 분포
  f_name <- class_roll$name %>%
    substring(first = 1, last = 1) 
  X6 <- f_name %>%
    `%in%`(c("김", "이", "박")) %>%
    ifelse(f_name, "기타") %>%
    factor(levels = c("김", "이", "박", "기타")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## Sum of Chi_Squares
  Xsum <- X1 + X2 + X3 + X4 + X5 + X6
  Xsum

## Results
#  list(Values = c(X1, X2, X3, X4, X5, X6), Xsum = Xsum)
}

red_and_black <-
function(k){
  set.seed(k)
  N <- nrow(class_roll) 
  class_roll$group <- 
    sample(1:N) %%
    2 %>%
    factor(levels = c(0, 1), labels = c("Red", "Black"))

## 학번 홀짝
  X2 <- class_roll$id %>%
    as.numeric %>%
    `%%`(2) %>%
    factor(levels = c(1, 0), labels = c("홀", "짝")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname
  
## 출생 시기 
  X3 <- class_roll$yob %>%
    cut(breaks = c(-Inf, 1980, 1995, Inf), 
        labels =c ("X세대", "Y세대", "Z세대" )) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## e-mail 서비스업체
  isp <- class_roll$email %>%
    strsplit("@", fixed = TRUE) %>%
    sapply("[", 2) %>%
    strsplit("[.]", fixed = FALSE) %>%
    sapply("[", 1)
  X4 <- isp %>%
    `%in%`(c("naver", "gmail")) %>%
    `!` %>%
    ifelse("기타서비스", isp) %>%
    factor(levels = c("naver", "gmail", "기타서비스"),
           labels = c("네이버", "구글", "기타서비스")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname

## 성별
  X5 <- class_roll$gender %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname
    
## 성씨 분포
  f_name <- class_roll$name %>%
    substring(first = 1, last = 1) 
  X6 <- f_name %>%
    `%in%`(c("김", "이")) %>%
    ifelse(f_name, "기타") %>%
    factor(levels = c("김", "이", "기타")) %>%
    table(class_roll$group, .) %>%
    chisq.test(simulate.p.value = TRUE) %>%
    `[[`(1) %>%
    unname
  

## Sum of Chi_Squares
  Xsum <- X2 + X3 + X4 + X5 + X6
  Xsum

## Results
#  list(Values = c(X1, X2, X3, X4, X5, X6, X7), Xsum = Xsum)
}

paste_pp <-
function(tbl) {
t(matrix(paste0(format(prop.table(tbl) * 100, digits = 2, nsmall = 1), "%"), nrow = dim(tbl)[1], dimnames = dimnames(tbl)))
}

split.apply <- function(n)
{
  tree <<- rbind(tree,
                 data.frame(node=(2*n):(2*n+1),
                            attribute=NA, value=NA, class=NA, count=NA,
                            `names<-`(rep(list(NA), length(clabs)),
                                      paste("p", clabs, sep="."))))

  av <- data[[tree$attribute[tree$node==n]]]
  cond <- !is.na(av) & (if (is.numeric(av))
                          av<=as.numeric(tree$value[tree$node==n])
                        else av==tree$value[tree$node==n])
  nodemap[nodemap==n & cond] <<- 2*n
  nodemap[nodemap==n & !cond] <<- 2*n+1
}

split.apply(n)

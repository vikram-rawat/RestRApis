
# calculate fibonacci -----------------------------------------------------

calc_fib = function(n) {
  if (n < 0L) stop("n should be >= 0")
  if (n == 0L) return(0L)
  if (n == 1L || n == 2L) return(1L)
  x = rep(1L, n)
  
  for (i in 3L:n) {
    x[[i]] = x[[i - 1]] + x[[i - 2]]
  }
  
  return(x[[n]])
}
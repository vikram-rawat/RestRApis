
# fib handlers ----------------------------------------------------------------

fib_handler = function(request, response) {
  n = as.integer(request$parameters_query[["n"]])
  if (length(n) == 0L || is.na(n)) {
    raise(HTTPError$bad_request())
  }
  response$set_body(as.character(calc_fib(n)))
  response$set_content_type("text/plain")
}
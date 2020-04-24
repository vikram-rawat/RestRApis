

# load library ------------------------------------------------------------

library("RestRserve", character.only = TRUE)
library("data.table", character.only = TRUE)

# set default -------------------------------------------------------------

setDTthreads(1L)

# source files ------------------------------------------------------------

source(file = "functions/basic_func.R")
source(file = "functions/route_handlers.R")

# data --------------------------------------------------------------------


# middleware --------------------------------------------------------------

cors_middle <-
  CORSMiddleware$new(
    routes = "/", 
    match = "partial",
    id = "CORSMiddleware"
    )

# main app ----------------------------------------------------------------

app <- Application$new(middleware = list(cors_middle))

app$add_get(path = "/fib", FUN = fib_handler)

# request = Request$new(path = "/fib", parameters_query = list(n = 10))
# response = app$process_request(request)
#
# cat("Response status:", response$status)
# #> Response status: 200 OK
# cat("Response body:", response$body)
# #> Response body: 55

app$add_openapi(path = "/openapi.yaml", file_path = "docs/open_api.yml")

app$add_swagger_ui(path = "/doc",
                   path_openapi = "/openapi.yaml",
                   use_cdn = TRUE)

backend = BackendRserve$new()

backend$start(app, http_port = 9001)
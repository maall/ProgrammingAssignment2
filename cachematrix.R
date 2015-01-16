## a pair of functions that cache the inverse of a matrix with the solve function


## This function creates a special "matrix" object that can cache its inverse,
##also makes a few functions and then returns them to the user in a list.

makeCacheMatrix<-function(x=matrix()){
  matrix <- NULL
  set <- function(y) {
    x <<- y
    matrix <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) matrix <<- solve
  getmatrix <- function() matrix
  getevn<- function() environment()
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix,
       getevn = getevn)
}


## This function computes the inverse of a matrix
## or if the inverse has already been calculated retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  matrix <- x$getmatrix()
  if(!is.null(matrix)) {
    message("getting cached data")
    return(matrix)
  }
  data <- x$get()
  matrix <- solve(data, ...)
  x$setmatrix(matrix)
  matrix
}
        ## Return a matrix that is the inverse of 'x'

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## as in the example this function
# 1. set value of the matrix
# 2. get value of the matrix
# 3. set the value of the inverse
# 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsovle <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## Write a short comment describing this function
# this function calculates the inverxe of the "matrix". As in the example code it checks first if the 
# the inverse has been calculated already. In that case a message is printed.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <-solve(data, ...)
  x$setsolve(m)
  m
}

#####################

example.data <- rnorm (10*10, 0, 10)
example.matrix<- matrix(example.data, ncol = 10)

example.object <- makeCacheMatrix(example.matrix)
# calculating the inverse
cacheSolve(example.object)
# getting the inverse from the cache
cacheSolve(example.object)

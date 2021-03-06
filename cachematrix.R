## The following functions compute and cache the inverse of a
## matrix so that it only needs to be solved once.

## The function makeCacheMatrix takes a matrix argument, caches
## data of the matrix and and its inverse , and returns a list 
## object with functions for reading and writing the cached data.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The function cacheSolve takes the list object generated by
## makeCacheMatrix and returns the inverse of the matrix. If
## the inverse is already cached, then it returns the cached data.
## Otherwise, it calculates the inverse and caches the output.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}

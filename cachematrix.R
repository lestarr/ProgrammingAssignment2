## Put comments here that give an overall description of what your
## functions do

## caches a matrix in a different environment
makeCacheMatrix <- function(x = matrix()) {
  mInv <- NULL
  set <- function(m1) {
    m <<- m1
    mInv <<- NULL
  }
  get <- function() m
  setInv <- function(inv) mInv <<- inv
  getInv <- function() mInv
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


## returns saved inversed matrix if there was any otherwise does the invertion and saves it to the cached matrix. returns inversed matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		  mInv <- x$getInv()
  if(!is.null(mInv)) {
    message("getting cached data")
    return(mInv)
  }
  data <- x$get()
  mInversed <- solve(data, ...)
  x$setInv(mInversed)
  mInversed
}

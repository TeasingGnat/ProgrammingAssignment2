## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates 4 variables the 'get' variables store functions
## where as the 'set' variables store data notable 'setmatrix' stores 
## the inverse when calculated

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function (y) {
    x <<- y
    m <<- NULL
  }
  get <-function() x
  setmatrix <- function(solve) m<<- solve
  getmatrix <- function() m
  list (set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## Write a short comment describing this function
## taking the four variables above this asks whether there is data with getmatrix
## if there is it grabs that data  
## otherwise the inverse is calculated
## it then prints the matrix

cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setmatrix(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
n <- matrix(1:4,2,2)
h <- makeCacheMatrix(n)
cacheSolve(h)
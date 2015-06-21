## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates 4 variables the 'get' variables store functions
## where as the 'set' variables store data notable 'setmatrix' stores 
## the inverse when calculated

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL  ## sets default for m as NULL
  set <- function (y) { ## opens the function for set that is specific to this function
    x <<- y
    m <<- NULL
  }
  get <-function() x ## 
  setmatrix <- function(solve) m<<- solve ## inverts the matrix
  getmatrix <- function() m ## gets the information stored
  list (set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## Write a short comment describing this function
## taking the four variables above this asks whether there is data with getmatrix
## if there is it grabs that data  
## otherwise the inverse is calculated
## it then prints the matrix

cacheSolve <- function(x, ...) {
  m <- x$getmatrix() ## sets m as the getmatrix
  if(!is.null(m)){ ## checks whether there is data in there if yes fetches it
    message("getting cached data")
    return(m)
  }
  data <- x$get() ## if there is no data above calculates it and stores it then prints it.
  m <- solve(data,...)
  x$setmatrix(m)
  m
  ## Return a matrix that is the inverse of 'x'
}
## this additional code just shows that the above has worked.
n <- matrix(1:4,2,2)
h <- makeCacheMatrix(n)
cacheSolve(h)
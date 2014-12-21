## Programming in R - Assignment 2
## *******
## This function caching the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
# Declare and define a function named makeCacheMatrix
inverse<-NULL # Assign like NULL the "inverse" variable when Inverse not has been calculated yet
set<-function(y){  # defines function to set a matrix
  x<<-y            # super-assignment operator (<<-)
  inverse<<-NULL
}
get<-function() x                               # defines function to get the matrix
setinverse <- function(solve) inverse <<- solve # defines function for inside and outside
getinverse <- function() inverse                # appoints function for inside

list(set = set, get = get,                      # Makes a list with the four variables for set and get
     setinverse = setinverse,                   # data matrix inside and outside function
     getinverse = getinverse)
}

## This function computes the inverse of a matrix returned by function above

# cacheSolve is the function that cached inverse data matrix
cacheSolve <- function(x, ...) {
  inverse<-x$getinverse()                       ## Return a matrix that is the inverse of 'x'
  if(!is.null(inverse)){
    message("getting cached data")              # shows a message indicating when data is cached
    return(inverse)                             # shows the data cached
  }
  # if yet not has been calculated the Inverse, then do
  data_matrix<-x$get()                          # assign the data matrix to the variable    
  inverse<-solve(data_matrix)                   # calculates the inverse matrix
  x$setinverse(inverse)                         # assigns the "inverse" matrix to'x'
  inverse                                       # shows the "inverse" matrix
}


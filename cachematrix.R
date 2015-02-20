## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix", which is really a list containing a function to
# 1. set the values of the matrix
# 2. get the values of the matrix
# 3. set the values of the inversed matrix
# 4. get the values of the inversed matrix
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## The following function calculates the inverse (by using solve) with the above function and checks whether it 
## has already been calculated before. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m    
    
}



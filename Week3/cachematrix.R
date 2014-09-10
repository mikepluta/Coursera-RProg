##
## Coursera R Programming
## Course ID: rprog-007
## Student: Mike Pluta
## Email: mike.pluta@gmail.com
## Assignment: Programming Assignment 2: Lexical Scoping

## From the assignment text:
##
## Matrix inversion is usually a costly computation and their may be some
## benefit to caching the inverse of a matrix rather than compute it
## repeatedly (there are also alternatives to matrix inversion that we will
## not discuss here). Your assignment is to write a pair of functions that
## cache the inverse of a matrix.
##
## Write the following functions:
##
## makeCacheMatrix: This function creates a special "matrix" object that can
## cache its inverse.
##
## cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already been
## calculated (and the matrix has not changed), then the cachesolve should
## retrieve the inverse from the cache.
##
## Computing the inverse of a square matrix can be done with the solve
## function in R. For example, if X is a square invertible matrix, then
## solve(X) returns its inverse.
##
## For this assignment, assume that the matrix supplied is always invertible.

## This function creates a special "matrix" object that can cache its inverse.
## Internally, this 'special' object is implemented as a list of functions
## to do the following:
##
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse of the matrix
## 4. Get the value of the inverse of the matrix

makeCacheMatrix <- function( x = matrix() ) {
    invMatrix <- NULL ## Initialize the storage for the inverse of the matrix

    ## Define the function to set the value of the matrix
    ## clear the storage of the inverse of the matrix
    set <- function(y) {
        x <<- y
        invMatrix <<- NULL
    }

    ## Define the function to get the value of the matrix
    get <- function() x

    ## Define the function to set the value of the inverse of the matrix
    setinverse <- function(inverse) invMatrix <<- inverse

    ## Define the function to get the value of the inverse of the matrix
    getinverse <- function() invMatrix

    ## Store the object's functions in a list
    list( set=set, get=get, setinverse=setinverse, getinverse=getinverse )
}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been
## calculated (and the matrix has not changed), then the cacheSolve should
## retrieve the inverse from the cache. If this is the first time the inverse
## is being called for, calculate the inverse of the matrix with solve() and
## store the result in cache for future retreval.

cacheSolve <- function( x, ... ) {

    ## pull what has been stored in cache for the inverse of the matrix
    ## if NOT NULL, return it
    inverse <- x$getinverse()
    if ( !is.null(inverse) ) {
        message( "using cached data.")
        return( inverse )
    }

    ## if NULL is pulled from cache, get the value of tbe matrix, calculate
    ## the value of the inverse of the matrix, store the inverse of the
    ## matrix into the cache for future retreaval and return the inverse of
    ## matrix
    matrixData <- x$get()
    inverse <- solve(matrixData)
    message( "calculating matrix inverse." )
    x$setinverse(inverse)
    inverse
}

## Test harness
##
## myMatrix <- rbind( c( .5, 1 ), c( 1, 1.5 ) )
## cacheMatrixObject <- makeCacheMatrix( myMatrix )
## cacheMatrixObject$get()
###      [,1] [,2]
### [1,]  0.5  1.0
### [2,]  1.0  1.5
##
## cacheSolve( cacheMatrixObject )
### calculating matrix inverse.
###      [,1] [,2]
### [1,]   -6    4
### [2,]    4   -2
##
## cacheSolve( cacheMatrixObject )
### getting cached data.
###      [,1] [,2]
### [1,]   -6    4
### [2,]    4   -2


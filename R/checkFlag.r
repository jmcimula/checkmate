#' Check if an argument is a flag
#'
#' A flag a a single logical value.
#'
#' @templateVar fn Flag
#' @template na-handling
#' @template checker
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @export
#' @examples
#'  test(TRUE, "flag")
#'  test(1, "flag")
checkFlag = function(x, na.ok = FALSE) {
  qassert(na.ok, "B1")
  if(length(x) != 1L)
    return("Must have length 1")
  if (is.na(x))
    return(ifelse(na.ok, TRUE, "May not be NA"))
  if(!is.logical(x))
    return("Must be a logical")
  return(TRUE)
}

#' @rdname checkFlag
#' @export
assertFlag = function(x, na.ok = FALSE, .var.name) {
  makeAssertion(checkFlag(x, na.ok), vname(x, .var.name))
}

#' @rdname checkFlag
#' @export
testFlag = function(x, na.ok = FALSE) {
  isTRUE(checkFlag(x, na.ok))
}
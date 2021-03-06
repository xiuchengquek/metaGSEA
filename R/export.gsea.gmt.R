#' Export a gmt file
#' Genesets for BROAD's GSEA are usually represented either as \code{gmt} files, or
#' \code{gmx} files. These can be opened in \code{excel}, and the \code{gmt} contains the first row
#' being the geneset name, and subsequent rows containing genes within each
#' geneset. These genes do not have to be the same length in each geneset.
#' 
#' See the detailed file specification, and the \code{\link{import.gsea.gmt}}
#' function.
#' 
#' @param x A list of genesets. \code{x} must have names which are the geneset names,
#'   and the elements are character vectors.
#' @param f the file name
#' @param description a character vector for the description column. it is recycled if its too short.
#'   The order must match up with the rows of \code{x}.
#' @return none. it creates a gmt file.
#' @author Mark Cowley, 2009-04-29
#' @seealso \code{\link{import.gsea.gmt}}
#' @references
#'   \url{http://www.broadinstitute.org/cancer/software/genepattern/tutorial/gp_fileformats.html#gmt}
#' @keywords file IO
#' @export
export.gsea.gmt <- function(x, f, description=rep("na", length(x))) {
	if( length(description) != length(x) )
		description <- description[recycle(description, length(x))]

	for( i in 1:length(x) ) {
		tmp <- c(names(x)[i], description[i], x[[i]])
		tmp <- paste(tmp, collapse="\t")
		x[[i]] <- tmp
	}
	x <- unlist(x)
	writeLines(x, f)
}

#' Set working directory function
#'
#' This function is shorthand to set the working directory to the active document's path.
#' It should be used as a beginning argument in a script before loading any data that's
#' in the same folder as the script.
#' @keywords set working directory active document path
#' @export

autowd <- function(upDir = 0, quietly = TRUE) {
	if(!requireNamespace("dirtools", quietly = TRUE)) {
		stop("Package \"Haffi921/dirtools\" needed for this function to work. \nTo install do:\n  library(\"devtools\")\n  install_github(\"Haffi/dirtools\")")
	}

	wd <- dirtools::get_this_dir()

	if(upDir > 0) {
		for(i in 1:upDir) {
			wd <- dirname(wd)
		}
	}

	if(!quietly) {
		print(paste("Changing directory to:", wd))
	}

	setwd(wd)
}

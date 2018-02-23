#' Set working directory function
#'
#' This function is shorthand to set the working directory to the active document's path.
#' It should be used as a beginning argument in a script before loading any data that's
#' in the same folder as the script.
#' @keywords set working directory active document path
#' @export


# autowd <- function() {
#   ## We need two solutions:
#   ### One when user is using rStudio
#   ### and one where the user is not using rStudio
#   isRStudio <- Sys.getenv("RSTUDIO") == "1"
#
#   if (isRStudio) {
#   	## This function needs the rStudioAPI package to run
#   	if (!requireNamespace("rstudioapi", quietly = TRUE)) {
#   		stop("Package \"rstudioapi\" needed for this function to work in RStudio.
#   				 Please install it.",
#   				 call. = FALSE)
#   	}
#
#   	## Setting the the working directory
#   	## to the path of the active document
#   	fileDir <- rstudioapi::getActiveDocumentContext()$path # Get active document's path
#   	setwd(dirname(fileDir)) # Setting the working directory
#   }
#   else {
#   	switch (Sys.info()[['sysname']],
#   		Windows = {
#   			setwd(shell("cd", intern = T))
#   			},
#   		Linux = ,
#   		Darwin = {
#   			setwd(system("pwd", intern = T))
#   			},
#   		{
#   			stop("Could not determine operating system.",
#   					 call. = FALSE)
#   		}
#   	)
#   }
# }



autowd <- function() {
	if(!requireNamespace("dirtools", quietly = TRUE)) {
		stop("Package \"Haffi921/dirtools\" needed for this function to work. \nTo install do:\n  library(\"devtools\")\n  install_github(\"Haffi/dirtools\")")
	}

	setwd(dirname(dirtools::get_path()))
}

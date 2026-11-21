#' Identification of negative and positive words on a text
#'
#' Using vectors with target words for positive
#'
#' @param file_path Single word vector created from provided text
#' @param positive Refers to the vector containing positive target words. D TRUE, vector used will be the deafult. If FALSE, us
#' @param negative Single word vector created from provided text

#' #' @return Detected negative words and
#'
#' #' @examples
#' tmp <- tempfile(fileext = ".txt")
#' writeLines("Today was great, but I can't sleep.", tmp)
#' simpletext(tmp)

#' @export
textmood <- function(file_path,
                     negative = negative_target,
                     positive = positive_target) {

    if (!file.exists(file_path)) {
      stop("File not found: ", file_path)
    }
  matches <- matchloop(file_path)
  positive_count <- length(matches$positive)
  negative_count <- length(matches$negative)
  ratio <- if (negative_count == 0 | positive_count == 0) NA else positive_count / negative_count
  return (list(positive = positive_count, negative = negative_count, ratio = ratio))
}

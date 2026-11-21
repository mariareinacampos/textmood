#' Identification of negative and positive words on a text
#'
#' Using target word vectors to identify positive or negaitve words whitin a text.
#'
#' @param file_path Single word vector created from provided text
#' @param positive Refers to the vector containing positive target words. If left unmentioned it will be TRUE and function will use the vector described in data. If user wants, they can provide another vector with target words.
#' @param negative Refers to the vector containing negative target words. If left unmentioned it will be TRUE and function will use the vector described in data. If user wants, they can provide another vector with target words.
#'
#' @return List containing two vectors: one with identified positive words and another with the negative ones.
#' @export
textmood <- function(file_path,
                     negative = negative_target,
                     positive = positive_target) {

    if (!file.exists(file_path)) {
      stop("File not found: ", file_path)
    }
  matches <- matchloop(file_path)
  positive_matches <- matches$positive
  negative_matches <- matches$negative
  positive_count <- length(positive_matches)
  negative_count <- length(negative_matches)
  return (list(positive = positive_count, positive_matches = positive_matches, negative = negative_count, negative_matches = negative_matches, ratio = ratio))
}


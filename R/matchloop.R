#' Identification of negative and positive words on a text
#'
#' Using two refference vectors, this functions identifies positive and negative words within a given text by a loop.
#'
#' @param file_path File path to the text you want to analyze

#' #' @return One list containing two character vectors. 'Positive' contains identified positive words in the text and 'negative' contains identified negative words.
#'
#' #' @examples
#' tmp <- tempfile(fileext = ".txt")
#' writeLines("Today was great, but I can't sleep.", tmp)
#' simpletext(tmp)

#' @export
#'

matchloop <- function(file_path){

  if (!file.exists(file_path)) {
    stop("File not found: ", file_path)
  }

  word_vector <- simpletext(file_path)


  positive_matches <- c()

  for(i in positive_target){
    positive_match <- grep(paste0("^",i), word_vector, ignore.case = TRUE, value = TRUE)
    positive_matches <- c(positive_matches, positive_match)
  }

  # To see results from the positive matches run this: print(positive_matches)

  negative_matches <- c()

  for(i in negative_target){
    negative_match <- grep(paste0("^",i), word_vector, ignore.case = TRUE, value = TRUE)
    negative_matches <- c(negative_matches, negative_match)
  }

  # To see results from the negative matches run this: print(negative_matches)

  return(list("positive" = positive_matches, "negative" = negative_matches))


}



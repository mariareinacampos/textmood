#' SimpleText
#'
#' Reads a tab-delimited text file, converts everything to lowercase,
#' standardises apostrophes, removes punctuation and splits the text into
#' individual words.
#'
#' @param file_path A character string with the path to a `.txt` file.
#'
#' @return A character vector with one word per element. Apostrophes inside
#'   words (e.g. "can't") are kept.
#'
#' @examples
#' tmp <- tempfile(fileext = ".txt")
#' writeLines("Today was great, but I can't sleep.", tmp)
#' simpletext(tmp)
#'
#' @export
simpletext <- function(file_path) {

  if (!file.exists(file_path)) {
    stop("File not found: ", file_path)
  }

  # Read the file; header = FALSE so the first line is data, not column names
  df <- read.delim(file_path, header = FALSE)

  # Flatten into one string, then lowercase
  text <- paste(unlist(df, use.names = FALSE), collapse = " ")
  text <- tolower(text)

  # Make every apostrophe variant a straight '
  apostrophes <- c("\u2018", "\u2019", "\u02bc")
  for (a in apostrophes) {
    text <- gsub(a, "'", text, fixed = TRUE)
  }

  # Remove punctuation (the apostrophe is deliberately not in this list)
  punctuation <- c(".", ",", ";", ":", "!", "?", "-", "\"", "(", ")")
  for (p in punctuation) {
    text <- gsub(p, "", text, fixed = TRUE)
  }

  # Split into words and drop empty strings
  words <- strsplit(text, " ", fixed = TRUE)[[1]]
  words[words != ""]
}

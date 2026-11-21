#' SimpleText
#'
#' Reads a tab-delimited text file, converts everything to lowercase,
#' standardises apostrophes, removes punctuation and splits the text into
#' individual words.
#'
#' @param file_path A character string with the path to a `.txt` file.
#'
#' @return A character vector with one word per element. Apostrophes inside words (e.g. "can't") are kept.
#'
#' @export
simpletext <- function(file_path) {

  if (!file.exists(file_path)) {
    stop("File not found: ", file_path)
  }

  # Read the file; header = FALSE so the first line is data, not column names
  df <- read.delim(file_path, header = FALSE)

  # Flatten into one string
  # Convert text to lowercase
  text <- paste(unlist(df, use.names = FALSE), collapse = " ")
  text <- tolower(text)

  # In case there are different apostrophe symbols used, I am replacing all the variants with ' so they are all the same and then I don't have issues with matching words in the second function.
  apostrophes <- c("\u2018", "\u2019", "\u02bc")
  for (a in apostrophes) {
    text <- gsub(a, "'", text, fixed = TRUE)
  }

  # Remove punctuation symbols.
  # Apostrophe is not included as it is needed to match text words with words inside negative and positive vectors.
  punctuation <- c(".", ",", ";", ":", "!", "?", "-", "\"", "(", ")")
  for (p in punctuation) {
    text <- gsub(p, "", text, fixed = TRUE)
  }

  # Split into words with the strsplit function so it generates a list that contains a vector with the individual words of the text.
  # The [[1]] end makes that the output of the function is the first item of the list (the vector with the individual words). So then it stores the individual word vector as 'words'.
  # Then the second line eliminates potential double spaces in the texts so they are not stored in the vectors as words.
  words <- strsplit(text, " ", fixed = TRUE)[[1]]
  words <- words[words != ""]
  return(words)
}

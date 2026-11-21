#Example on how a user should run the code to use the function/package "textmood" to analyse how negative or positive is a text.

#Install the package from my GitHub user handle with the name of the repository where it is
install.packages("remotes")
remotes::install_github("mariareinacampos/textmood")

#Import the package into your library
library(textmood)

#Run the function on a text. If you do define the arguments 'positive' (for a positive word vector) or 'negative' (for a negatve word vector). The function will use by default the ones I have defined and included inside the data file of the package.
textmood('/Users/maria.reina.campos/Downloads/Example_negative.txt')

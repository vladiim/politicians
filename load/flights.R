load.cleanFlights <- function(d) {
  names(d) <- helpers.lowerfy(names(d))
  d
}

load.flights2014 <- function() {
  load.cleanFlights(read.csv('data/flights_2014_output.csv',
    header = TRUE, sep = ',', stringsAsFactors = FALSE))
}

load.flights1213 <- function() {
  load.cleanFlights(read.csv('data/flights_2012_2013output.csv',
    header = TRUE, sep = ',', stringsAsFactors = FALSE))
}

transform.flights <- function() {
  d        <- rbind.fill(load.flights2014(), load.flights1213())
  d$amount <- as.double(gsub('-', '', gsub(',', '', gsub('\\$', '', d$amount))))
  d$amount <- ifelse(is.na(d$amount), 0, d$amount)
  d$date   <- as.Date(d$date, format = '%d/%m/%Y')
  d
}

transform.politicianByAmount <- function() {
  transform.flights() %>%
    group_by(politician) %>%
    summarise(amount = sum(amount)) %>%
    arrange(desc(amount))
}

transform.dateAmount <- function() {
  transform.flights() %>%
    group_by(date) %>%
    summarise(amount = sum(amount))
}

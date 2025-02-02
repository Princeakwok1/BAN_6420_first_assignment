# Generate a list of 400 workers with dynamic data
set.seed(123)  # For reproducibility
workers <- data.frame(
  name = paste("Worker", 1:400),
  salary = sample(5000:35000, 400, replace = TRUE),
  gender = sample(c("Male", "Female"), 400, replace = TRUE)
)

# Function to generate payment slips
generate_payment_slips <- function(workers) {
  payment_slips <- vector("list", length = nrow(workers))
  index <- 1  # Track valid entries
  
  for (i in 1:nrow(workers)) {
    tryCatch({
      level <- NA
      if (workers$salary[i] > 10000 & workers$salary[i] < 20000) {
        level <- "A1"
      } else if (workers$salary[i] > 7500 & workers$salary[i] < 30000 & workers$gender[i] == "Female") {
        level <- "A5-F"
      }
      
      if (!is.na(level)) {  # Only add workers who meet the conditions
        payment_slips[index] <- paste(workers$name[i], "(Level", level, "): Salary $", workers$salary[i])
        index <- index + 1
      }
    }, error = function(e) {
      print(paste("Error processing worker", workers$name[i], ":", e$message))
    })
  }
  
  return(payment_slips[1:(index - 1)])  # Remove empty entries
}

# Generate and display payment slips
payment_slips <- generate_payment_slips(workers)
print(payment_slips)

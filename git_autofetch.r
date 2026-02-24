# --- Git Background Worker ---
# This script fetches updates every 5 minutes 
# without interrupting your main R session.
# Install gert first with: install.packages("gert")
# Check your status visually in the console: gert::git_status()

message("Starting Git Background Fetcher...")

while(TRUE) {
  # Perform the fetch using the gert package
  tryCatch({
    gert::git_fetch()
    message(paste("Fetched updates at:", Sys.time()))
  }, error = function(e) {
    message("Fetch failed. Check internet connection or Git credentials.")
  })
  
  # Wait for 5 minutes (300 seconds)
  Sys.sleep(300)
}

#Run this R script as a "Background Jobs"
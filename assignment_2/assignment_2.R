# author: edelsonc created: 08/28/16
# script runs the assignment two for EDA

# the url will be saved and used to both download the xml and recorded the data
# providence
xml_url <- "http://www.cs.washington.edu/research/xmldatasets/data/courses/reed.xml"
xml_file <- "~/Desktop/Data_Science/EDA/assignment_2/reed.xml"
download.file(xml_url, xml_file)

# Data providence is recorded and saved in a separate text file for later reference
ReedCoursesProvidence <- paste("Downloaded from", xml_url, "At", Sys.time(), sep = " ")
write(ReedCoursesProvidence, "~/Desktop/Data_Science/EDA/assignment_2/ReedProvidence.txt")

# load the XML library to use the xmlToDataFrame function parse our xml
library("XML")
xml_dataframe <- xmlToDataFrame(xml_file)

# using the unique command with the length first creates a list of titles only
# containing unique values and then returns the length of the list
num_courses <- length(unique(xml_dataframe$title))  # returns 394

# use the sapply function to return a boolean vector
isnull <- sapply(xml_dataframe$instructor, is.element, el="")

# applying sum to a boolean returns the number of TRUEs since TRUE=1
empty_instructor <- sum(isnull)  # returns 15

num_instructors <- length(unique(xml_dataframe$instructor)) - 1  # 135
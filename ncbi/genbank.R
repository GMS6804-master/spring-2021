
install.packages('rvest')

library(rentrez)
library(rvest)
require(RCurl)
library(readr)


# short read archives
entrez_db_summary("sra")
entrez_db_searchable("sra")

# Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scraped
url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'


#Using CSS selectors to scrape the rankings section
rank_data_html <- html_nodes(webpage,'.text-primary')

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)

#Let's have a look at the rankings
head(rank_data)

# download multiple NCBI files
# https://felixfan.github.io/download-files/

require(RCurl)

# identify files to download
url = "ftp://ftp.ncbi.nih.gov/genbank/release.notes/"
filenames = getURL(url, ftp.use.epsv = FALSE, dirlistonly = TRUE)
filenames <- strsplit(filenames, "\r\n")
filenames = unlist(filenames)
filenames

# download all files
for (filename in filenames) {
  download.file(paste(url, filename, sep = ""), paste(getwd(), "/ncbi/genbank_notes/", filename,
                                                      sep = ""))
}

# create data set
  df <- data.frame(date=as.Date(character()),
                   release=character(), 
                   bases=character(), 
                   sequences=character(),
                   stringsAsFactors=FALSE) 


# open files and extract data
filenames=list.files(paste0(getwd(), "/ncbi/genbank_notes/"))
for (i in length(filenames)) {
  tmp=read_file(paste0(getwd(), "/ncbi/genbank_notes/",filenames[i],sep = ""))
  tmp_clean <- strsplit(tmp, "\r\n")
  test <- unlist(lapply(tmp_clean, function(x) x[!x %in% ""]))
  test.tmp=test[1:10]
  test.tmp1=trimws(test.tmp, "l")
  
  # date
  date_tmp=test.tmp1[2]
  
  # release
  release_tmp=test.tmp1[3]
  
  # bases
  base_tmp=test.tmp1[5]
  
  # sequences
  seq_tmp=test.tmp1[5]
  
  }



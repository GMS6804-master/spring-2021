
# install.packages('rvest')

library(rentrez)
library(rvest)
require(RCurl)
library(readr)
library(stringr)

# short read archives
entrez_db_summary("sra")
entrez_db_searchable("sra")

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
                                                      sep = ""))}

# create data set
  df <- data.frame(date=character(),
                   release=character(), 
                   bases=character(), 
                   sequences=character(),
                   stringsAsFactors=FALSE) 


# open files and extract data
filenames=list.files(paste0(getwd(), "/ncbi/genbank_notes/"))
for (i in 1:length(filenames)) {
  tmp=read_file(paste0(getwd(), "/ncbi/genbank_notes/",filenames[i],sep = ""))
  tmp_clean <- strsplit(tmp, "\r\n")
  test <- unlist(lapply(tmp_clean, function(x) x[!x %in% ""]))
  test.tmp=test[1:10]
  test.tmp1=trimws(test.tmp, "l")
  
  # date
  date_tmp=test.tmp1[2]
  
  # release
  release_tmp=filenames[i]
  release_tmp2=str_split(release_tmp, "[.]")[[1]][1]
  release_tmp3=as.numeric(gsub("gb","",release_tmp2))
  
  
  # bases
  base_tmp=str_split(test.tmp1[5],",")[[1]][2]
  base_tmp2=str_split(trimws(base_tmp, "l")," ")[[1]][1]
  
  # sequences
  seq_tmp=str_split(test.tmp1[5], ",")[[1]][1]
  seq_tmp2=str_split(trimws(seq_tmp, "l")," ")[[1]][1]
  
  # populate df
  df[i,1]=date_tmp
  df[i,2]=release_tmp3
  df[i,3]=base_tmp2
  df[i,4]=seq_tmp2
  
  # format the data
  df$bases=as.numeric(df$bases)
  df$sequences=as.numeric(df$sequences)
  df$release=as.numeric(df$release)
  
  newdata <- df[order(df$release),]
  
  }

save(newdata,file="ncbi.rda")

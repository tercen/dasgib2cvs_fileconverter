#select file

in_file_name <- file.choose()

# original filname
get_name_parts <- function(a_file_name) {
  basename <- basename(a_file_name)
  # get last "."
  ext <- tail(strsplit(basename, "\\.")[[1]], n=1L)
  prefix <- strsplit(basename, "_")[[1]][1]
  # path
  path_sans_base_and_ext <-substr(a_file_name, start=1, stop = (nchar(a_file_name)-nchar(basename))) 
  basename_sans_ext <- substr(start = 1, stop = (nchar(basename)-nchar(ext)-1), basename)
  path_without_ext <- paste0(path_sans_base_and_ext, basename_sans_ext)
  return(list(basename = basename, path_sans_base_and_ext=path_sans_base_and_ext, path_without_ext = path_without_ext, ext = ext, prefix = prefix))
}


# filename
file_part <- get_name_parts(in_file_name)
print (paste("filename is", file_part$basename))

print (paste("processing filename", file_part$basename))

print("reading started...")
print("...it may take some time..")
print("...please wait...")

lines <- readLines(in_file_name, encoding = "UTF-8" )
track_idx <- grep( pattern="TrackData[[:digit:]]", lines)
empty_idx <- grep( pattern="^$", lines) # empty lines
track_line <- lines[track_idx]

get_end <- function(idx, empty_idx) {
  end_idx <- empty_idx[empty_idx >= idx][1]
}
track_end_idx<- unlist(lapply(track_idx, get_end, empty_idx))

track_name <- lines[track_idx]
track_name <- gsub(pattern="\\[|\\]|Data|\\\"", replacement="", track_name)
track_name <- paste0(file_part$prefix,"-",track_name )

track_file_name <- paste0(file_part$path_sans_base_and_ext, track_name, ".", file_part$ext)

print(paste("found track at", track_idx, track_line))

print("splitting file into different track")
  
  # calculate number of tracks
  num_tracks  = length(track_idx)
  # write pieces
  print(paste("splitting", file_part$basename, "into", num_tracks, "tracks"))
  
  for (i in 1:num_tracks) {
    start_index <- track_idx[i]
    end_index   <- track_end_idx[i]
    
    print (paste(track_name[i], "rows from",  start_index, "to", end_index))
    
    text= lines[(start_index+1):(end_index-1)]
    data <- read.delim(text=text, sep=";", check.names = FALSE)
    track_id <- track_name[i]
    data <- cbind(track_id,data)
    
    if (file.exists(track_file_name[i])) file.remove(track_file_name[i])
    # writeLines(con=track_file_name[i], text= lines[start_index:end_index])
    # write.table(data, file = track_file_name[i], sep=";", na ="", row.names = FALSE, quote = FALSE, fileEncoding = "UTF-8")
    write.table(data, file = track_file_name[i], sep=",", na ="", row.names = FALSE)
    }
  
print ("conversion finished")

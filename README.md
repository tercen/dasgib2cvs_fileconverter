# dasgip2cvs file converter

#### Description
`dasgip2cvs` converts a DASGIP bioreactor track file by selecting all track information within the DASGIP file and outputting them separately into individual track files

##### Usage

__How to run on Windows OS__
```
git clone https://github.com/tercen/dasgip2csv_fileconverter
cd dasgip2csv_fileconverter
```

* Double click `dasgip2cvs_fileconverter.Rproj` file
* This opens RStudio (you require to have RStudio and R installed)
* A dialog appears for the user to choose a file to convert
* A message saying its completed is given.
* A you have output files created for each track in the directory where the input file was located

__Input file__

Takes a DASGIP file as input

__Output file__

For each track the name is the same name as the input file but with a `track_id` and a time-stamp


##### Details

It converts a DAS GIP bioreactor run file by extracting track information in the file as separate files. if there are two tracks in a track file then there will be two track files produced. An extra column with the `track_id` is added to the generated files.

You require RStudio and R installed.

#### References

##### See Also

#### Examples

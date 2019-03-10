# dasgip2cvs file converter

#### Description
`dasgip2cvs` converts a DASGIP bioreactor track file by selecting all track information within the DASGIP file and outputting them separately into individual track files

##### Usage

__How to run on Windows OS__
```
git clone https://github.com/tercen/dasgip2csv_fileconverter
cd dasgip2csv_fileconverter
run-win.bat
```

* A dialog appears for the user to choose a file to convert
* A black command DOS shell appears and indicates the progress of the conversion
* Hit any key to close the black command DOS shell


__Input file__

Takes a DASGIP file as input

__Output file__

For each track the name is the same name as the input file but with a `track_id` and a time-stamp


##### Details

It converts a DAS GIP bioreactor run file by extracting track information in the file as separate files. if there are two tracks in a track file then there will be two track files produced. An extra column with the `track_id` is added to the generated files.

The `run.bat` file uses RScript.exe whose location is defined by the variable `RSCRIPT_EXE`, by default it points to the RScript.exe in the Tercen Desktop installation directory.

#### References

##### See Also

#### Examples

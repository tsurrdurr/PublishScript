## General
Simple publishing mechanism for Windows. Copies only the things that are in the target folder, so instead of listing files to copy you just initially copy them and they renew with every publish script execution.  
If some new files have to be added to regular release, you have to manually copy desired files to target folder.

## Usage

Syntax for using the script:  
`publisher.bat [source_folder] [target_folder]`  

## Changes control
The script creates CSV file `lastresult.txt` that stores values of amount of last copied and last omitted files.  
If these values change, this might mean that some files are added or removed from source folder and you have to either manually add them to target folder or remove unnecessary files from target folder.   

## Multiple scripts
Keep in mind that when you create .bat file that executes the code above, the `lastresult.txt` is stored in its directory. So if you have several projects to publish, be sure to put these scripts in separate folders so they don't overwrite each other's .txt files.
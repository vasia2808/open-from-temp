set currentDirectory=%cd%

set tempDirectoryName=%file%
set tempDirectoryName=%tempDirectoryName::=%
set tempDirectoryName=%tempDirectoryName:\=%

set temp=%temp%\%tempDirectoryName%
set tempFile=%temp%\%fileName%
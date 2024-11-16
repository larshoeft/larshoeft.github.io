#! /bin/sh

for file in $(find $1 -type f -name "*.svg") ; do 
 rsvg-convert --dpi-x=270 --dpi-y=270 "$file" --output="${file%.svg}.png"
done


for file in $(find $1 -type f -name "*.tex") ; do 
 latexmk -cd -xelatex  "$file"
 latexmk -c -cd  "$file"
 pdftoppm "${file%.tex}.pdf" "${file%.tex}" -rx 270 -ry 270 -png -singlefile
done
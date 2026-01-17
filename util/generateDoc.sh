mkdir -p dist
which pdfroff >/dev/null 2>&1
if [ $? -eq 0 ]
then
	motor=pdfroff
else
	motor=pdflatex
fi
pandoc --pdf-engine=${motor} --toc-depth=3  -N  README.MD -o dist/README.pdf
for  d in $(find doc -name "*.md")
do
    pandoc --pdf-engine=${motor} --toc-depth=3  -N  $d -o dist/$(basename $d .md).pdf 
done



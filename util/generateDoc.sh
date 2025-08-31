pandoc --pdf-engine=pdfroff --toc-depth=3  -N  README.MD -o dist/README.pdf
for  d in $(find doc -name "*.md")
do
    pandoc --pdf-engine=pdfroff --toc-depth=3  -N  $d -o dist/$(basename $d .md).pdf --verbose
done



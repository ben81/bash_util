pandoc --pdf-engine=pdfroff --toc-depth=1 README.MD -o dist/README.pdf
for  d in $(find doc -name "*.md")
do
    pandoc --pdf-engine=pdfroff --toc-depth=1 $d -o dist/$(basename $d .md).pdf
done



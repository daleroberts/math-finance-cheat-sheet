all: math-finance-cheat-sheet.pdf thumb.png

clean:
	rm -f *.log *.aux *.pdf *.png

thumb.png: math-finance-cheat-sheet.pdf
	convert -verbose -alpha off -resize 450x634 -quality 85 -border 1 -bordercolor black -border 1 -bordercolor white $< thumb.png
	convert -verbose -background white thumb-0.png thumb-1.png -size 2x2 xc:white +swap -gravity center +append thumb.png
	rm thumb-0.png thumb-1.png

math-finance-cheat-sheet.pdf: math-finance-cheat-sheet.tex
	pdflatex $<

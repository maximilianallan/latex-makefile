#source file
file=draft
TEXOPTS=-file-line-error -halt-on-error -output-directory=build

pdf:
	pdflatex $(TEXOPTS) ${file}
	bibtex build/${file}
	pdflatex $(TEXOPTS) ${file}
	pdflatex $(TEXOPTS) ${file}
	mv build/${file}.pdf .

dvi:
	latex $(TEXOPTS) ${file}
	bibtex build/${file}
	latex $(TEXOPTS) ${file}
	latex $(TEXOPTS) ${file}
	mv build/${file}.dvi .

words:
	pdftotext ${file}.pdf - | wc -w

clean:
	rm build/*

mrproper: clean
	rm ${file}.pdf

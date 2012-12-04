#source file
file=draft

pdf:
	pdflatex -file-line-error -halt-on-error -output-directory=build ${file}
	bibtex build/${file}
	pdflatex -file-line-error -halt-on-error -output-directory=build ${file}
	pdflatex -file-line-error -halt-on-error -output-directory=build ${file}
	mv build/${file}.pdf .

dvi:
	latex ${file}
	bibtex ${file}
	latex ${file}
	latex ${file}

words:
	pdftotext ${file}.pdf - | wc -w

clean:
	rm build/*

mrproper: clean
	rm ${file}.pdf

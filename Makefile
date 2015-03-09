default: pdf

main.dvi: *.tex *.bib komlogo-new.eps obr.png obr2.png stamp.png trade.png Makefile
	rm -f *.toc
	latex main
	bibtex main
	latex main
	latex main

main.ps: main.dvi
	dvips main.dvi

main.pdf: *.tex *.bib komlogo-new.pdf obr.pdf obr2.pdf stamp.pdf trade.pdf Makefile
	rm -f *.toc
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

dvi: main.dvi

ps: main.ps

pdf: main.pdf

all: ps pdf

clean: 
	rm -f *.{log,aux,toc,bbl,blg,slo,srs}

dist-clean:
	rm -f *.{log,aux,dvi,toc,bbl,blg,slo,srs} main.ps main.pdf

booklet: main.ps
	cat main.ps | psbook | psnup -2 >main-booklet.ps


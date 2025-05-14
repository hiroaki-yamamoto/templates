all: main.pdf

main.pdf main.bbl main.blg main.log main.out main.aux: main.tex
	xelatex -shell-escape main
	pbibtex main
	xelatex -shell-escape main

clean:
	rm -rf main.pdf main.bbl main.blg main.log main.out main.aux

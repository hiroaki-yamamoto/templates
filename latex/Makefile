all: main.pdf

main.dvi: main.tex
	xelatex main

main.aux: main.dvi
	pbibtex main

main.pdf: main.dvi main.aux main.bbl
	dvipdfmx -f ptex-ipa main

clean:
	rm -rf main.pdf \
		*.xbb *.aux *.dvi *.log *.bbl *.blg *.toc *.out **/*.xbb **/*.aux \
		**/*.dvi **/*.log **/*.bbl **/*.blg **/*.toc **/*.out

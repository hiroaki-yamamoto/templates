.PHONY: all
all: ./out/main.pdf

./out/main.pdf: main.tex
	mkdir -p $(dir $@)
	xelatex --output-directory=$(dir $@) -shell-escape $^
	pbibtex $(basename $@)
	xelatex --output-directory=$(dir $@) -shell-escape $^
	xelatex --output-directory=$(dir $@) -shell-escape $^

release: ./out/main.pdf
	rm -rf $(filter-out $(wildcard ./out/*.pdf), $(wildcard ./out/*))

clean:
	rm -rf ./out

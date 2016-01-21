.PHONY: clean all watch ignore-report add-report
FILE=report
TEX=$(FILE).tex
PDF=$(FILE).pdf
TEXMAKE=latexmk -pdf

all: $(PDF)

$(PDF): ignore-report $(TEX)
	$(TEXMAKE) $(TEX)

watch: ignore-report
	$(TEXMAKE) -pvc $(TEX)

ignore-report:
	git update-index --assume-unchanged $(PDF)

add-report: $(PDF)
	git update-index --no-assume-unchanged $(PDF)
	git add $(PDF)
	git update-index --assume-unchanged $(PDF)

clean:
	rm -rf *.aux *.bbl *.blg *dvi *.log *.out *.synctex.gz *.toc *.lot *.lof

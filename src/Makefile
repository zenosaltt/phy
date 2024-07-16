# before compiling, TITLE may be overwritten from CLI by typing 'make FILE=<type_here_your_pdf_file_name>'
TITLE=output
extensions=(*.aux *.log *.sta *.fdb_latexmk *.fls *.synctex.gz *.maf *.out *.toc *.mtc*)

all: main.tex
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf

	@[ ! -d junk ] && mkdir junk || exit 0
	@mv *.aux *.log *.sta *.fdb_latexmk *.fls *.synctex.gz *.maf *.out *.toc *.mtc* junk 2>/dev/null || exit 0

# post-compilation clear (this keeps $(TITLE).pdf)
clear: junk
	@rm -rf junk

# clear everything
purge:
	@[ -d junk ] && rm -rf junk || exit 0
	@rm *.pdf 2>/dev/null || exit 0

.PHONY: all clear purge
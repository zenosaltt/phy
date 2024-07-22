# before compiling, TITLE may be overwritten from CLI by typing 'make FILE=<type_here_your_pdf_file_name>'
TITLE=output
BUILD_DIR=../build

all: main.tex
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf

	@[ -e $(TITLE).pdf ] && ( [ -d $(BUILD_DIR) ] && ( mv $(TITLE).pdf $(BUILD_DIR) ) || ( mkdir $(BUILD_DIR) ; mv $(TITLE).pdf $(BUILD_DIR) ) )

	@[ ! -d junk ] && mkdir junk || exit 0
	@./sscript.sh

# post-compilation clear (this keeps $(TITLE).pdf)
clear: junk
	@rm -rf junk

# clear everything
purge:
	@[ -d junk ] && rm -rf junk || exit 0
	@[ -d build ] && rm -rf build || exit 0

.PHONY: all clear purge
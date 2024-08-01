# before compiling, TITLE may be overwritten from CLI by typing 'make FILE=<type_here_your_pdf_file_name>'
TITLE=output
BUILD_DIR=../build
JUNK_DIR=junk

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
	@[ -d $(JUNK_DIR) ] && rm -rf $(JUNK_DIR) || exit 0
	@[ -d $(BUILD_DIR) ] && rm -rf $(BUILD_DIR) || exit 0

.PHONY: all clear purge
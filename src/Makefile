# before compiling, TITLE may be overwritten from CLI by typing 'make FILE=<type_here_your_pdf_file_name>'
TITLE=output
BUILD_DIR=../build
JUNK_DIR=junk
EXTENSIONS_HANDLER=handle_exts.sh

# WARNING: filesys. dependent
FIG_NAME=none
PDF_TERMINAL=~/Downloads

all: main.tex
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf
	@pdflatex main.tex && mv main.pdf $(TITLE).pdf

	@[ -e $(TITLE).pdf ] && ( [ -d $(BUILD_DIR) ] && ( mv $(TITLE).pdf $(BUILD_DIR) ) || ( mkdir $(BUILD_DIR) ; mv $(TITLE).pdf $(BUILD_DIR) ) )

	@[ ! -d $(JUNK_DIR) ] && mkdir $(JUNK_DIR) || exit 0
	@./$(EXTENSIONS_HANDLER)

# post-compilation clear (this keeps $(TITLE).pdf)
clear: $(JUNK_DIR)
	@rm -rf $(JUNK_DIR)

# clear everything
purge:
	@[ -d $(JUNK_DIR) ] && rm -rf $(JUNK_DIR) || exit 0
	@[ -d $(BUILD_DIR) ] && rm -rf $(BUILD_DIR) || exit 0

.PHONY: all clear purge
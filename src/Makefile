# before compiling, TITLE may be overwritten from CLI by typing 'make FILE=<type_here_your_pdf_file_name>'
TITLE=output

# edit this if the main .tex file has a different name
MAIN=main

# directory where the pdf file will be moved after compilation
BUILD_DIR=../build

# bin
JUNK_DIR=junk

EXTENSIONS_HANDLER=handle_exts.sh


# apparently, two pdflatex compilation steps are needed to resolve references and display indexes correctly
# alternative: latexmk -pdf main.tex
# still don't know which one is better and faster (de gustibus I suppose)
all: $(MAIN).tex
	@pdflatex $< && mv $(MAIN).pdf $(TITLE).pdf
	@pdflatex $< && mv $(MAIN).pdf $(TITLE).pdf

#	@latexmk -pdf $(MAIN).tex && mv $(MAIN).pdf $(TITLE).pdf

	@[ -e $(TITLE).pdf ] && ( [ -d $(BUILD_DIR) ] && ( mv $(TITLE).pdf $(BUILD_DIR) ) || ( mkdir $(BUILD_DIR) ; mv $(TITLE).pdf $(BUILD_DIR) ) )

	@[ ! -d $(JUNK_DIR) ] && mkdir $(JUNK_DIR) || exit 0
	@./$(EXTENSIONS_HANDLER)

# manual cleanup which removes junk files gathered after compilation
clear: $(JUNK_DIR)
	@rm -rf $(JUNK_DIR)

# clear everything: remove junk dir and build dir
purge:
	@[ -d $(JUNK_DIR) ] && rm -rf $(JUNK_DIR) || exit 0
	@[ -d $(BUILD_DIR) ] && rm -rf $(BUILD_DIR) || exit 0

# move junk files from src to junk directory manually.
# useful when compilation fails and junk files remain in src
# TODO: solve this problem in a more elegant way
tidy:
	@[ ! -d $(JUNK_DIR) ] && mkdir $(JUNK_DIR) || exit 0
	@./$(EXTENSIONS_HANDLER) || exit 0
	@mv *.pdf $(JUNK_DIR) || exit 0

.PHONY: all clear purge tidy
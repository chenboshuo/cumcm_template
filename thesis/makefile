# .INTERMEDIATE : tree
.PHONY : all clean help todo release sections/tree.txt
RED=\033[0;31m
NC=\033[0m # No Color
file_name=release
time_out=3m
timeout_prompt="\n\n ${RED} TIME OUT:${NC} process was killed because of timeout\n"
latex_command="xelatex -halt-on-error"
## make all : regenerate all results.
all: todo release print ebook

## make todo: make build/todo.pdf
todo: build/todo.pdf
	rm -f todo.tex

## make release: make release version(without todo,cover) to build
release: build/$(file_name).pdf
	rm -f $(file_name).tex

## make print : make print version(without todo) to build
print: build/print.pdf
	rm -f print.tex

## make ebook : make the ebook version(with todo)
ebook: build/ebook.pdf
	rm -f ebook.tex

todo.tex : build tree
	echo "\documentclass[withoutpreface,bwprint,draft]{cumcmthesis}" > todo.tex
	awk 'FNR>10' main.tex >> todo.tex

ebook.tex : build tree
	echo "\documentclass[withoutpreface,bwprint,ebook,draft]{cumcmthesis}" > ebook.tex
	awk 'FNR>10' main.tex >> ebook.tex

print.tex: build tree
	echo "\PassOptionsToPackage{disable}{todonotes}" > print.tex
	echo "\documentclass{cumcmthesis}" >> print.tex
	awk 'FNR>10' main.tex >> print.tex

$(file_name).tex : build tree
	echo "\PassOptionsToPackage{disable}{todonotes}" > $(file_name).tex
	echo "\documentclass[withoutpreface,bwprint]{cumcmthesis}" >> $(file_name).tex
	awk 'FNR>10' main.tex >> $(file_name).tex

## make *.pdf : generate the pdf files
build/%.pdf: %.tex
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) bibtex ./build/$(basename $<) || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)

## make tree: update the file tree
tree: sections/tree.txt

sections/tree.txt: $(shell find ../src/ -type f)
	cd ../src && \
		git ls-tree -r --name-only HEAD ../src/ |\
		(tree --fromfile > ../thesis/sections/tree.txt)

## make clean: clean the temp files
clean:
	# git ls-files --others | xargs gio trash
	git clean -fXd

## make build: create directory build
build:
	mkdir build

## make help : show this message.
help :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' \
		| column -t -s ':'

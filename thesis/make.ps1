function build {
  param (
    $fileName
  )

  xelatex -output-directory="./build" $fileName".tex"
  bibtex ./build/$fileName
  xelatex -output-directory="./build" $fileName".tex"
  xelatex -output-directory="./build" $fileName".tex"
}

function add_extra {
  param (
    $fileName
  )

  Get-Content main.tex |
  Select-Object -Skip 8 |
  Out-File $fileName -Append
}

# encoding
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

# make build directory
mkdir build

# make trees
cd ../src
tree |Out-File ../thesis/sections/tree.txt
cd ../thesis

# make todo
echo "\documentclass[withoutpreface,bwprint]{cumcmthesis} %去掉封面与编号页" |
  Out-File todo.tex
add_extra todo.tex
build todo
rm todo.tex

# make ebook
echo "\documentclass[withoutpreface,bwprint,ebook]{cumcmthesis} %去掉封面与编号页" |
  Out-File ebook.tex
add_extra ebook.tex
build ebook
rm ebook.tex

# make print version
echo "\PassOptionsToPackage{disable}{todonotes} \documentclass{cumcmthesis}" |
  Out-File print.tex
add_extra print.tex
build print
rm print.tex

# make release version
echo "\PassOptionsToPackage{disable}{todonotes} \documentclass[withoutpreface,bwprint]{cumcmthesis}" |
  Out-File release.tex
add_extra release.tex
build release
rm release.tex


Read-Host

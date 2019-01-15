#!/bin/bash

main=${1:-tex/main}
output_dir=latex_out

pdflatex_opt="-interaction=nonstopmode -output-directory ${output_dir} ${main}.tex"

mkdir -p ${output_dir}
pdflatex ${pdflatex_opt} && {
  biber -output-directory ${output_dir} ${main}
  makeglossaries -d ${output_dir} ${main}
  pdflatex ${pdflatex_opt}
  pdflatex ${pdflatex_opt}
  exit 0
} || {
  echo "==> Erros occured during pdflatex"
  exit 1
}
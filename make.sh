#!/bin/bash
CURR_DIR=`pwd`
CONF=$CURR_DIR/.conf
BUILD_DIR=$CURR_DIR/build
STYLES_DIR=$CURR_DIR/styles
TEMPLATE=$STYLES_DIR/latex-template.tex
MARKDOWNS=`find $CURR_DIR/contents -name "section_[0-9]*_*.md" | sort -t_ -k2 -n`
MARKDOWN_INPUT=$BUILD_DIR/input.tex
FILTERS_DIR=$CURR_DIR/lua-filters
TEX=main.tex
REF=ref.bib
TARGET=main.pdf

cp $TEMPLATE $BUILD_DIR/$TEX
cp $CURR_DIR/ref.bib $BUILD_DIR/ref.bib

# sed -i '' -E 's/([a-zA-Z0-9\}])([`‘’])s/\1'\''s/g' $BUILD_DIR/ref.bib
cd $BUILD_DIR

if [ -f $CONF ]
then
    # https://stackoverflow.com/questions/50262468/using-awk-sed-to-find-and-replace-key-value-pair-from-file-to-other
    # idea: change each line to sed command
    sed '/^[[:blank:]]*$/d;/^\#.*/d;s|^|s/%|;s|=|%/|;s|$|/|' $CONF | sed -i -f - $BUILD_DIR/main.tex
fi

if [ -f $BUID_DIR/input.tex ]
then
    cp $BUILD_DIR/input.tex $BUILD_DIR/.input.tex.bak
fi

pandoc --natbib \
    --wrap=none \
    -L $FILTERS_DIR/centerimgs.lua \
    -f markdown+smart+autolink_bare_uris+table_captions+auto_identifiers+pipe_tables+simple_tables+markdown-implicit_figures \
    -o $MARKDOWN_INPUT \
    $MARKDOWNS

latexmk -pdfxe -f -synctex=1 \
    -interaction=nonstopmode main

latexmk -c
rm *.bbl *.synctex.gz *.xdv

cd $CURR_DIR

# echo $MARKDOWNS
# echo $FILTERS_DIR
# echo $MARKDOWN_INPUT
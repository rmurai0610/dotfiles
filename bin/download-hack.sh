font_url='https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip'; font_name=${font_url##*/}; wget ${font_url} && unzip ${font_name} -d ~/.fonts && fc-cache -fv ;
rm -rf Hack.zip

if [ ! -d reveal.js/ ]; then
    wget https://github.com/hakimel/reveal.js/archive/2.6.2.tar.gz
    tar -xvf 2.6.2.tar.gz
    mv reveal.js-2.6.2/ reveal.js/
    rm 2.6.2.tar.gz
fi

cat markdown/*.md > slides.md

docker run -v `pwd`:/source jagregory/pandoc -t revealjs -s /source/slides.md \
  | sed "s/simple.css/default.css/g" \
  | sed "s/007020/40B261/g" \
  | sed "s/06287e/88A8F9/g" \
  | sed "s/4070a0/8EC3F9/g" \
  | sed "s/902000/FFB412/g" \
  > index.html

docker run -v `pwd`:/source jagregory/pandoc  -s /source/slides.md -o /source/functional-programming.pdf  --latex-engine=xelatex
docker run -v `pwd`:/source jagregory/pandoc  -s /source/slides.md -o /source/functional-programming.epub  --latex-engine=xelatex
docker run -v `pwd`:/source jagregory/pandoc  -s /source/slides.md -o /source/functional-programming.mobi  --latex-engine=xelatex
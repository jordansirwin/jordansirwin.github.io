echo "Compiling less"
lessc ../content/self/self.less \
  > ../content/self/self.css

echo "Building _site"
jekyll serve \
  --config ../_config.yml,../_config-dev.yml \
  -w -s .. \
  -d ../_site
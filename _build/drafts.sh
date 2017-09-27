echo "Compiling less"
lessc ../content/self/self.less \
  > ../content/self/self.css

lessc ../content/self/self.less -x \
  > ../content/self/self.min.css

echo "Building and Hosting _site"
jekyll serve \
  --drafts \
  --config ../_config.yml,../_config-dev.yml \
  -w -s .. \
  -d ../_site
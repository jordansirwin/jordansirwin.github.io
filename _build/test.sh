echo "Compiling less"
lessc ../content/self/self.less \
  > ../content/self/self.css

echo "Building _site"
jekyll serve -w -s .. -d ../_site
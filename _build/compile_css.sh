echo "Compiling less"

lessc --version

# assume running from root of site
lessc ./content/self/self.less \
  > ./content/self/self.css

lessc ./content/self/self.less -x \
  > ./content/self/self.min.css

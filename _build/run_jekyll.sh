echo "Running Jekyll"

# must be running from root of site
bundle exec jekyll serve \
  --config ./_config.yml,./_config-dev.yml \
  -w -s ./ \
  -d ./_site \
  --host 0.0.0.0
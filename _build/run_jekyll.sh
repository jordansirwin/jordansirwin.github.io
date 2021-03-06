#!/bin/bash

echo "Running Jekyll"

ARGS="$@"
DRAFTS='te'

echo 'Args:' $ARGS

# if --drafts was passed, include it
if [[ $ARGS == *"--drafts"* ]]; then
  DRAFTS='--drafts'
fi

echo 'Drafts Option:' $DRAFTS

# must be running from root of site
bundle exec jekyll serve \
  --config ./_config.yml,./_config-dev.yml \
  -w -s ./ \
  -d ./_site \
  --host 0.0.0.0 \
  --watch \
  $DRAFTS
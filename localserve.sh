#!/bin/bash
# Run site preview with local Jekyll
cd docs
bundle exec jekyll serve --livereload --incremental --config _config-local.yml
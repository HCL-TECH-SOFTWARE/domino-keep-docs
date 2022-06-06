@ECHO OFF
REM Run site preview with local Jekyll
CD docs
CALL bundle install
CALL bundle exec jekyll serve --livereload --incremental --config _config-local.yml
IF ERRORLEVEL 1 GOTO error
GOTO end

:error
ECHO.
ECHO Doesn't look like Jekyll is installed
ECHO please install using instructions from 
ECHO https://jekyllrb.com/docs/installation/windows/
ECHO.
ECHO.

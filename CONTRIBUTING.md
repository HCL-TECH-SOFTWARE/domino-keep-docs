## Contributing

Bug fixes and enhancements are welcome.

### Raising Issues

If there are inaccuracies in any pages, please include links to the relevant page (either the rendered page or the source file) and a screenshot, preferably annotated. All open source projects are supported in addition to day jobs, so we appreciate information that helps us quickly locate the problem and apply the fix. The easier it is to fix, the quicker it's likely to be resolved.

### Local Testing

Please test all changes locally before submitting. Like many GitHub Pages site, it uses Jekyll and Bundler. If you do not have the pre-requisite software installed (Ruby and Bundler), follow the [GitHub guide](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll).

Once you have the pre-requisites, open a Terminal window at the root of the repo. You can use Bundler to load the gems required, by issuing the command `bundle install`. Once all the gems are available locally, issue the command `bundle exec jekyll serve` to build the site. The output in the Terminal window will show you the base URL for the site. In the unlikely scenario where you have more than one GitHub Pages site running locally at the same time, append `--port=4001` to run on an alternate port, changing the port number as required.

### Pull Requests

Once an enhancement fix has been tested locally, you're welcome to submit a Pull Request.

If you raise a pull-request without having signed the CLA, you will be prompted to do so automatically.
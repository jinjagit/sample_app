# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).


## Issues, observations & workarounds

1. Initial Heroku deploy failed, with error "You must use Bundler 2 or greater with this lockfile", even though I _had_ used bundler 2.0.1 to run <code>bundle install -- without production</code>. Fix: delete Heroku app, delete local rails app, and delete respective GitHub repository, then uninstall bundler / reinstall version 1.17.3, then work through tutorial again, up to, and beyond, Heroku deploy.

2. Running <code>rails db:migrate</code> gave multiple warnings related to fileutils gem: 'warning: already initialized constant FileUtils::<constant>'. Resolved by following solution [here](https://stackoverflow.com/questions/51334732/rails-5-2-0-with-ruby-2-5-1-console-warning-already-initialized-constant) (uninstall / reinstall gem).

3. Local <code>rails server</code> command would now fail with "Could not load the 'listen' gem. Add ''gem 'listen'' to the development group of your Gemfile (LoadError)", even though I _had_ that gem in the specified place in the Gemfile. Fix ([from StackOverflow](https://stackoverflow.com/questions/38663706/loaderror-could-not-load-the-listen-gem-rails-5)): run <code>bundle config --delete without</code>, then </code>bundle install</code>. At this point, the local rails server started just fine. I then found I could revert to </code>bundle install --without production</code>.

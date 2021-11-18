# Test task for SmartPension
Author [Lizaveta Muromskaya](https://www.linkedin.com/in/lizaveta-muromskaya)

=> [Task](#task) | [Installation](#installation) | [Usage](#usage) | [Testing](#testing) |

## Task ##

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided) 

e.g.: ./parser.rb webserver.log

b. Returns the following:

+ list of webpages with most page views ordered from most pages views to less page views e.g.:

/home 90 visits /index 80 visits etc... > 

+ list of webpages with most unique page views also ordered e.g.:

/about/2 8 unique views /index 5 unique views etc...


## Installation ##

1. [Clone this repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)

2. Install [ruby v3.0.2](https://www.ruby-lang.org/en/documentation/installation/)

3. Run bundle install
```bash
bundle install
```

## Usage ##
1. [Install app](#installation)

2. Run app
```bash
ruby parser.rb webserver.log
```

3. An example of the output
![alt text](https://github.com/lizamuromskaya/logparser/blob/main/example.png)

## Testing ##
Run code style tests with [rubocop](https://github.com/rubocop/rubocop)
```bash
bundle exec rubocop
```
Run unit tests with [RSpec](https://rspec.info/)
```bash
bundle exec rspec
```
Check test coverage with [simplecov](https://github.com/simplecov-ruby/simplecov)
```bash
open coverage/index.html
```

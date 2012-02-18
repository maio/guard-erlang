# Guard::Erlang

Guard::Erlang automatically compile your erlang file & run Module:test() from ebin

Guard::Erlang watch your *.erl and compile whit changed.

Guard::Erlang watch your ebin/*.beam and run Module:test() whit test/0 exist.

Run all action is execute "erl -pa ebin -make"

## Installation

Add this line to your application's Gemfile:

    gem 'guard-erlang'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-erlang

## Usage

    mkdir -p project/ebin && cd project
    bundle guard init erlang
    guard

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

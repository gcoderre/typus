# Typus: Admin Panel for Ruby on Rails applications

**Typus** is a control panel for [Ruby on Rails][rails] applications to allow
trusted users edit structured content.

It’s not a CMS with a full working system but it provides a part of the
system: authentication, permissions and basic look and feel for your
websites control panel. So using [Rails][rails] with **Typus** lets you
concentrate on your application instead of the bits to manage the system.

**Typus** is the "old latin" word for **type** which stands for:

> A category of people or things having common characteristics.

You can try a demo [here][typus_demo].

## Key Features

- Built-in Authentication and Access Control Lists.
- CRUD and custom actions for your models on a clean interface.
- Internationalized interface ([See available translations][typus_locales])
- Customizable and extensible templates.
- Integrated [paperclip][paperclip] and [dragonfly][dragonfly] attachments viewer.
- Works with `Rails 3.1.X`.

## Installing

Add **Typus** to your `Gemfile`

    gem 'typus'

    # Bundle edge Typus instead:
    # gem 'typus', :git => 'git://github.com/typus/typus.git'

Update your bundle, run the generator and start the application server:

    $ bundle install
    $ rails generate typus
    $ rails server

and go to <http://0.0.0.0:3000/admin>.

## Testing

To test clone the git repo and run the following commands:

    $ git clone git://github.com/typus/typus.git
    $ bundle install --path vendor/bundle
    $ bundle exec rake

## Links

- [Documentation](https://github.com/typus/typus/wiki)
- [Issues](https://github.com/typus/typus/issues)
- [Source Code][typus] and [RubyGems][typus_gem]
- [Mailing List](http://groups.google.com/group/typus)
- [Contributors List](http://github.com/typus/typus/contributors)
- [Travis Builds](http://travis-ci.org/#!/typus/typus)

## License

Typus is released under the MIT license.

[typus]: http://github.com/typus/typus
[typus_demo]: http://demo.typuscmf.com/
[typus_demo_code]: https://github.com/typus/demo
[typus_locales]: https://github.com/typus/typus/tree/master/config/locales
[typus_gem]: http://rubygems.org/gems/typus
[paperclip]: http://rubygems.org/gems/paperclip
[dragonfly]: http://rubygems.org/gems/dragonfly
[rails]: http://rubyonrails.org/
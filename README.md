# SafeRailsConsole

## Usage

Gemfile:

```ruby
gem 'safe_rails_console'
```

Then `bundle install` and add `*_readonly` section to database.yml:

```yaml
common: &common
  adapter:   mysql2
  encoding:  utf8
  reconnect: false
  pool:      5

development:
  <<: *common
  database: youapp_development
  username: root
  password: 
  host:     localhost

# Like this !!!
development_readonly:
  <<: *common
  database: youapp_development
  username: readonly
  password: 
  host:     localhost
```

Finally:

```bash
$ rails console --sandbox
```

Will point to `development_readonly` database! Rocks!

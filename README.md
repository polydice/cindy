# Cindy

A lightweight and flexible Ruby SDK for Sendy, a self-hosted email newsletter app.

## Installation

Add this line to your application's Gemfile:

    gem 'cindy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cindy

## Usage

The API of Cindy was basically implemented after Sendy's API doc.

### Client

To use Cindy, first create a client instance:

```ruby
c = Cindy.new "http://sendy.co/demo/", "QywLZqDddP2P//d6ntekf+GY82nLrHke"
```

There're two parameters for initialize method:

1. API Endpoint - The URL for Sendy installation.
2. API Key - Optional, only for subscription status methods.

### Subscribe / Unsubscribe

Then you can subscribe or unsubscribe from a list:

```ruby
> c.subscribe 1, "foo@bar.com", "Foo Bar"
=> true
> c.unsubscribe 1, "foo@bar.com"
=> false
```

The parameters are:

1. List ID - You can find them under list management page.
2. Email - Email to subscribe or unsubscribe from the list
3. Name - Optional, used only for subscribe

### Subscription Status

To check subscription status for Email address:

```ruby
> c.subscription_status 3, "foo@bar.com"
=> "Unsubscribed"
```

The parameters are list ID and Email.

### Active Subscriber Count

To get active subscriber count of a list:

```ruby
> c.active_subscriber_count 5
=> 1660
```

The only required parameter here is list ID.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

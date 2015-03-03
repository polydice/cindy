# Cindy

A lightweight and flexible Ruby SDK for [Sendy](http://sendy.co), a self-hosted email newsletter app.

## Usage

The API of Cindy was basically implemented after [Sendy's API documentation](http://sendy.co/api).

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
> c.subscribe list_id, "foo@bar.com", "My Name"
=> true
> c.unsubscribe list_id, "foo@bar.com"
=> false
```

### Subscription Status

To check subscription status for Email address:

```ruby
> c.subscription_status list_id, "foo@bar.com"
=> "Unsubscribed"
```

### Active Subscriber Count

To get active subscriber count of a list:

```ruby
> c.active_subscriber_count list_id
=> 1660
```

### Create Campaign

To create new campaign:

```ruby
> c.create_campaign from_name: "foo", from_email: "foo@bar.com", reply_to: "foo@bar.com", subject: "Hello, world", html_text: "<h1>Hello, world</h1>"
=> Campaign created
```

### More Reference

Check [Sendy's API documentation](http://sendy.co/api) to learn more about parameters and possible responses.

## License

MIT License. Copyright 2013-2015 Polydice, Inc. http://polydice.com/
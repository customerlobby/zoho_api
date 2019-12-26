# ZohoApi

A Ruby wrapper for the Zoho REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zoho_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoho_api

## Usage

### Configuration

Before you can make calls to Zoho you must configure the library with a valid client_id, client_secret and redirect_uri.

There are two ways to configure the gem. You can pass a hash of configuration options when you create
a client, or you can use a configure block.

Using client method with access and refresh tokens:
```ruby
client = ZohoApi.client(client_id: "YOUR_CLIENT_ID_HERE",
                        client_secret: "YOUR_CLIENT_SECRET_HERE",
                        redirect_uri: "YOUR_REDIRECT_URI_HERE",
                        access_token: "YOUR_ACCESS_TOKEN_HERE",
                        refresh_token: "YOUR_REFRESH_TOKEN_HERE")
```

Using configure block with access and refresh tokens
```ruby
ZohoApi.configure do |config|
  config.client_id = "YOUR_CLIENT_ID_HERE"
  config.client_secret = "YOUR_CLIENT_SECRET_HERE"
  config.redirect_uri = "YOUR_REDIRECT_URI_HERE"
  config.access_token = "YOUR_ACCESS_TOKEN_HERE"
  config.refresh_token = "YOUR_REFRESH_TOKEN_HERE"
end

client = ZohoApi.client
```

Using client method with auth_code:
```ruby
client = ZohoApi.client(client_id: "YOUR_CLIENT_ID_HERE",
                        client_secret: "YOUR_CLIENT_SECRET_HERE",
                        redirect_uri: "YOUR_REDIRECT_URI_HERE",
                        auth_code: "YOUR_AUTH_CODE_HERE")
```

Using configure block with auth_code
```ruby
ZohoApi.configure do |config|
  config.client_id = "YOUR_CLIENT_ID_HERE"
  config.client_secret = "YOUR_CLIENT_SECRET_HERE"
  config.redirect_uri = "YOUR_REDIRECT_URI_HERE"
  config.auth_code = "YOUR_AUTH_CODE_HERE"
end

client = ZohoApi.client

```

### Token Apis

Generate access and refresh tokens from auth_code
```ruby
client.fetch_tokens
```
Generate access token from refresh token
```ruby
client.renew_token
```

*Note: You don't need to refresh client's access and refresh tokens after hitting these apis*


### Customer Apis (Zoho Invoice)

Get specific contact details
```ruby
client.contact('CONTACT_UUID')
```
Get all the contacts
```ruby
client.contacts
```
Get contacts by page
 ```ruby
 # default value of page is 1
 # default value of per_page is 200  
client.clients(page: 2, per_page: 10)
```

### Invoice Apis (Zoho Invoice)

Get specific invoice details
```ruby
client.invoice('INVOICE_UUID')
```
Get all the invoices
```ruby
client.invoices
```
Get invoices by page
 ```ruby
 # default value of page is 1
 # default value of per_page is 200  
client.invoices(page: 2, per_page: 10)
```


## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


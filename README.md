# varnish-client

varnish-client is a HTTP client of Varnish.
This is a fork of mono0x/varnish-client .
This fork supports "BAN" method for Varnish 3.x.

# Install

Add the following line to Gemfile.

    gem 'varnish-client', :git => 'https://github.com/morimorihoge/varnish-client.git'

Install the gem.

    $ bundle install

Download ban_purge.vcl.

    $ sudo wget https://raw.github.com/morimorihoge/varnish-client/master/ban_purge.vcl

Add the following line to the main VCL file.

    include "/path/to/ban_purge.vcl";

# Getting started

Here is an example of purge and fetch the cache.

    require 'varnish/client'
    varnish = Varnish::Client.new('localhost', 6081, 'http://example.com')
    # ban
    varnish.ban '^/date/2011/'
    varnish.ban '.*'
    # fetch
    varnish.fetch '/index'
    varnish.fetch '/mobile', 'User-Agent' => 'iPhone'


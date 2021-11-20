# RubyKodiClient

RubyKodiClient is a work-in-progress client for [Kodi JSON API v12](https://kodi.wiki/view/JSON-RPC_API/v12) written in ruby.

Currently implemented are the following Methods:
* Addons
* Application
* AudioLibrary
* Favourites
* Files
* GUI
* Input
* Player
* Profiles
* System

## Installation
from [rubygems](https://rubygems.org/gems/kodi_client) using
```shell
gem install kodi-client
```
or from the sources using
```shell
gem build kodi-client.gemspec
```
and then execute
```shell
gem build kodi-client-x.x.x.gemspec
```

## Enable Kodi Remote Control
In order to use JKodi Wrapper, Kodi remote control must be enabled. To do so perform the following steps:

1.) Go to Settings
![Settings](https://github.com/cf86/JKodiWrapper/blob/master/screenshots/Settings.png)

2.) Open the Services Menu
![Service](https://github.com/cf86/JKodiWrapper/blob/master/screenshots/Service.png)

3.) Select the Control Tab
![Control](https://github.com/cf86/JKodiWrapper/blob/master/screenshots/Control.png)

4.) Enable Remote control
![Remote Access](https://github.com/cf86/JKodiWrapper/blob/master/screenshots/RemoteAccess.png)

## Usage

To create a client you need at least the ip and port of the kodi server
```ruby
client = KodiClient.connect('127.0.0.1', 8080)
```
optional you can also provide authentication and if required, TLS 
```ruby
client = KodiClient.connect('127.0.0.1', 8080).auth('kodi', 'password').use_tls
```
once a client is created, all methods are available, e.g.
```ruby
client = KodiClient.connect('127.0.0.1', 8080).auth('kodi', 'password').use_tls
application = client.application
gui = client.gui
```
with the method aquired, all calls can be executed, for example to quit kodi
```ruby
client = KodiClient.connect('127.0.0.1', 8080).auth('kodi', 'password').use_tls
application = client.application
application.quit
```
or to play a movie
```ruby
client = KodiClient.connect('127.0.0.1', 8080).auth('kodi', 'password').use_tls
player = client.player
# the file can be a local path on the server, or e.g. an upnp file url
player.player_open('path/to/file')
```
some calls just return a simple `OK` result, some also return some data, the full response is always returned
in a `KodiResponse`, which contains any `error` and any `result` as specified in the documentation.
```ruby
client = KodiClient.connect('127.0.0.1', 8080).auth('kodi', 'password').use_tls
player = client.player
# the file can be a local path on the server, or e.g. an upnp file url
player.player_open('path/to/file')
# movie started, now we can seek (assuming it is player 1) to 50% of the movie
response = player.seek(1, 50.0)
# seek returns percentage, time and total time
response.result.percentage # => 50.0
response.result.time # => { 'hours' => 1, 'minutes' => 30, 'seconds' => 0}, 'milliseconds' => 0 }
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'kodi_client'
  spec.version       = '0.7.0'
  spec.authors       = ['Christian Feier']
  spec.email         = ['christian.feier@gmail.com']

  spec.summary       = 'A work-in-progress client for Kodi JSON API v2.'
  spec.description   = 'A client for the Kodi JSON API v12, currently implemented methods are Addons, Application, AudioLibrary '\
                       'Favourites, Files, GUI, Input, Player, Profiles and System (more will be added with the time). '\
                       'For more information how to use it and how to activate Remote Control in Kodi, '\
                       'please check the github page https://github.com/cfe86/RubyKodiClient'
  spec.homepage      = 'https://github.com/cfe86/RubyKodiClient'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = 'https://github.com/cfe86/RubyKodiClient'
  spec.metadata['source_code_uri'] = 'https://github.com/cfe86/RubyKodiClient'
  spec.metadata['changelog_uri'] = 'https://github.com/cfe86/RubyKodiClient'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'http', '~> 5.0.4'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

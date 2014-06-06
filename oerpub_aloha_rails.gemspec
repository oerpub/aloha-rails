$:.push File.expand_path('../lib', __FILE__)

require 'oerpub/aloha/rails/version'

Gem::Specification.new do |s|
  s.name        = 'oerpub_aloha_rails'
  s.version     = Oerpub::Aloha::Rails::VERSION
  s.authors     = ['Dante Soares']
  s.email       = ['dante@openstax.org']
  s.homepage    = 'https://github.com/oerpub/aloha-rails'
  s.summary     = 'Easy integration of OERPUB Aloha Editor with Rails applications'
  s.description = 'This gem allows the OERPUB Aloha Editor to be easily integrated with Rails applications'
  s.licenses    = ['GPL-2', 'GPL-3']

  s.files = Dir["{app,lib,vendor}/**/*", 'GPL2-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 3.1'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end

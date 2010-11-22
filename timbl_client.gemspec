# -*- coding: utf-8 -*-
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

Gem::Specification.new do |s|
  s.name = %q{timbl_client}
  s.version = "0.0.1"
  s.summary = %q{timbl_client is a Ruby client for interacting with TimblServer.}
  s.description = %q{timbl_client is a Ruby client for interacting with TimblServer.}

  s.files = Dir['[A-Z]*', 'lib/**/*.rb', 'spec/*.rb']
  s.require_path = 'lib'
  s.test_files = Dir['spec/*_spec.rb']

  s.authors = ["Bjørn Arild Mæland"]
  s.email = %q{bjorn.maeland@gmail.com}
  s.homepage = "http://github.com/bmaland/timbl_client"
  s.rubyforge_project = "timbl_client"

  s.add_development_dependency('rspec-expectations')
  s.add_development_dependency('mocha')

  s.platform = Gem::Platform::RUBY
  s.rubygems_version = %q{1.3.7}
end

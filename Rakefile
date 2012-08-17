#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "omniauth-appdotnet/version"

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new

desc 'Run specs'
task :default => :spec

task :gem => :build
task :build do
  system "gem build omniauth-appdotnet.gemspec"
end

task :install => :build do
  system "sudo gem install omniauth-appdotnet-#{OmniAuth::AppDotNet::VERSION}.gem"
end

task :release => :build do
  # system "git tag -a v#{OmniAuth::AppDotNet::VERSION} -m 'Tagging #{OmniAuth::AppDotNet::VERSION}'"
  # system "git push --tags"
  system "gem push omniauth-appdotnet-#{OmniAuth::AppDotNet::VERSION}.gem"
end

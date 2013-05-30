#!/usr/bin/env rake
require "bundler/gem_tasks"

Bundler.setup

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c", "-fs"]
  t.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

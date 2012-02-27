require 'rubygems'
require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

task :flog do
  system 'flog -adg lib > flog/flog.txt'
end

task :default => [:spec, :flog]

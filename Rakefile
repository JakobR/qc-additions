$:.unshift("lib")

require "rake/testtask"

task :default => ['test']
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
  t.ruby_opts << "-rubygems" if RUBY_VERSION < "1.9"
end

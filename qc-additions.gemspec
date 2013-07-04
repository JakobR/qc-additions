#encoding: UTF-8
Gem::Specification.new do |s|
  s.name          = "qc-additions"
  s.version       = "0.0.1"
  s.date          = "2013-01-12"
  s.description   = "Add some methods to queue_classic to determine whether a job exists or how many times a given job is already queued."
  s.summary       = "Add some methods to queue_classic."
  s.authors       = ["Jakob Rath"]
  s.email         = "git@jakobrath.eu"
  s.homepage      = "https://github.com/JakobR/qc-additions"

  files = []
  files << "README.md"
  files << Dir["{lib,test}/**/*.rb"]
  s.files = files
  s.test_files = s.files.select { |path| path =~ /^test\/.*_test.rb/ }

  s.require_paths = %w[lib]

  s.add_dependency "queue_classic", "~> 2.2.0"
end

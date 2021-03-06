require "rake/testtask"

Rake::TestTask.new(:test => "db:test:prepare") do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task :default => :test

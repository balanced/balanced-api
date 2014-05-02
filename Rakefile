require 'cucumber/rake/task'
require 'parallel_tests/tasks'

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format progress --tags ~@failing"
end

Cucumber::Rake::Task.new(:focus) do |t|
  t.cucumber_opts = "--format progress --tags @focus"
end

namespace :features do
  desc "Run all features"
  Cucumber::Rake::Task.new(:all) do |t|
    t.cucumber_opts = "--format progress"
  end
end

require 'cucumber/rake/task'

class BuildFailure < Exception;
  def initialize(message = nil)
    message ||= "Build failed"
    super(message)
  end
end;

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

  desc "Run in-progress features"
  Cucumber::Rake::Task.new(:in_progress) do |t|
    t.cucumber_opts = "--require formatters/ --format Cucumber::Formatter::InProgress --tags @failing"
  end
end

desc "Run complete feature build"
task :cruise do
  finished_successful = run_and_check_for_exception("cucumber")
  in_progress_successful = run_and_check_for_exception("features:in_progress")

  unless finished_successful && in_progress_successful
    puts
    puts("Finished features had failing steps") unless finished_successful
    puts("In-progress Scenario/s passed when they should fail or be pending") unless in_progress_successful
    puts
    raise BuildFailure
  end
end

def run_and_check_for_exception(task_name)
  puts "*** Running #{task_name} features ***"
  begin
    Rake::Task["#{task_name}"].invoke
  rescue Exception => e
    return false
  end
  true
end

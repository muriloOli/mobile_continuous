# frozen_string_literal: true

require 'cucumber'
require 'cucumber/rake/task'

###
# Tasks
###

desc 'Run acceptance tests with selected platform (ios|android) Ex.: run_acceptance[android,@homepage]'
task :run_acceptance, :platform, :tags do |_, args|
  platform_check(args)

  tags = ''
  tags = "--tags #{args[:tags]}" unless args[:tags].nil?

  platform = args[:platform]

  Cucumber::Rake::Task.new(:run) do |t|
    puts "#{tags} #{generate_report(platform)}"
    t.cucumber_opts = "#{tags} #{generate_report(platform)}"
  end

  Rake::Task[:run].invoke
end

###
# Helpers
###

def run_rake_task(name, platform, tags)
  begin
    Rake::Task[name].invoke(platform, tags)
  rescue StandardError => e
    puts e.to_s
    return false
  end
  true
end

def generate_report(platform)
  "--format pretty --format html --out=./reports/report_#{platform}_#{Time.now.strftime('%d-%m.%H:%M')}.html"
  "--format pretty --format json --out=./reports/reports.json"
end

def platform_check(args)
  raise 'Selected platform (android|ios)' if args.nil? || args[:platform].nil?

  case args[:platform].downcase
  when 'android'
    ENV['PLATFORM_NAME'] = args[:platform]
  when 'ios'
    ENV['PLATFORM_NAME'] = args[:platform]
  else
    raise("Tests not supported for this platform #{args[:platform]}")
  end
end

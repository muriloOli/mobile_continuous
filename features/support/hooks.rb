# frozen_string_literal: true
# require 'report_builder'

Before do
  @home_screen = HomeScreen.new
  @pesquisa_screen = PesquisaScreen.new

  $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    unless File.directory?('./reports/screenshots')
      FileUtils.mkdir_p('screenshots')
    end

    time_stamp = Time.now.strftime('%Y-%m-%d.%H:%M')
    screenshot_name = time_stamp + '.png'
    screenshot_file = File.join('./reports/screenshots', screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", 'image/png')
  end

  sleep 2
  remove_app('br.com.digio')
  $driver.driver_quit
end

# at_exit do
#   ReportBuilder.configure do |config|
#       config.input_path = 'reports/reports.json'
#       config.report_path = 'reports/reports'
#       config.report_title = "Tests Execution Report"
#   end
#   ReportBuilder.build_report
# end
require 'rspec/expectations'

class HomeScreen
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'home', 'core'
  end

  def check_logo
    element_exists?(@mappings['logo'])
  end

  def tap_address_field
    click(@mappings['input_address'])
  end

end
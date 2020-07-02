require 'rspec/expectations'


class PesquisaScreen
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'pesquisa', 'core'
  end

  def edit_text
    element_exists?(@mappings['edit_text'])
  end

  def fill_address(text)
    fill_in(@mappings['edit_text'], text)
  end

  def tap_first_location
    click(@mappings['location'])
  end

  def button_available
    element_exists?(@mappings['list'])
  end

  def tap_viewlist
    click(@mappings['list'])
  end
end
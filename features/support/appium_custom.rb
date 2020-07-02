# frozen_string_literal: true

def click(el)
  element_exists?(el)
  case el['tipo_busca']
  when 'XPATH'
    find_element(:xpath, el['value']).click
  when 'ID'
    find_element(:id, el['value']).click
  when 'CLASS'
    find_element(:class, el['value']).click
  end
end

def click_index(el, index)
  element_exists?(el)
  case el['tipo_busca']
  when 'XPATH'
    find_elements(:xpath, el['value'])[index].click
  when 'ID'
    find_elements(:id, el['value'])[index].click
  when 'CLASS'
    find_elements(:class, el['value'])[index].click
  end
end

def click_subelement_index(element, el, index)
  element_exists?(el)
  case el['tipo_busca']
  when 'XPATH'
    element.find_elements(:xpath, el['value']).get(index).click
  when 'ID'
    element.find_elements(:id, el['value']).get(index).click
  when 'CLASS'
    element.find_elements(:class, el['value']).get(index).click
  end
end

def element_exists?(el)
  case el['tipo_busca']
  when 'XPATH'
    $wait.until { find_element(:xpath, el['value']).displayed? }
  when 'ID'
    $wait.until { find_element(:id, el['value']).displayed? }
  when 'CLASS'
    $wait.until { find_element(:class, el['value']).displayed? }
  end
end

def refresh_screen
  $driver.refresh
end

def element_is_enabled?(el)
  case el['tipo_busca']
  when 'XPATH'
    find_element(:xpath, el['value']).enabled?
  when 'ID'
    find_element(:id, el['value']).enabled?
  when 'CLASS'
    find_element(:class, el['value']).enabled?
  end
end

def element_is_checked?(el)
  case el['tipo_busca']
  when 'XPATH'
    find_element(:xpath, el['value']).checked?
  when 'ID'
    find_element(:id, el['value']).checked?
  when 'CLASS'
    find_element(:class, el['value']).checked?
  end
end

def get_text(el)
  case el['tipo_busca']
  when 'XPATH'
    find_element(:xpath, el['value']).text
  when 'ID'
    find_element(:id, el['value']).text
  when 'CLASS'
    find_element(:class, el['value']).text
  end
end

def get_value(el)
  case el['tipo_busca']
  when 'XPATH'
    find_element(:xpath, el['value']).value
  when 'ID'
    find_element(:id, el['value']).value
  when 'CLASS'
    find_element(:class, el['value']).value
  end
end

def get_subelement_text_index(element, el, index)
  case el['tipo_busca']
  when 'XPATH'
    element.find_elements(:xpath, el['value']).get(index).text
  when 'ID'
    element.find_elements(:id, el['value']).get(index).text
  when 'CLASS'
    element.find_elements(:class, el['value']).get(index).text
  end
end

def get_text_index(el, index)
  case el['tipo_busca']
  when 'XPATH'
    return $driver.find_elements(:xpath, el['value']).get(index).text
  when 'ID'
    return $driver.find_elements(:id, el['value']).get(index).text
  when 'CLASS'
    return $driver.find_elements(:class, el['value']).get(index).text
  end
end

def fill_in(el, text)
  case el['tipo_busca']
  when 'XPATH'
    element = find_element(:xpath, el['value'])
  when 'ID'
    element = find_element(:id, el['value'])
  when 'CLASS'
    element = find_element(:class, el['value'])
  end
  element.clear
  element.send_keys text
end

def hide_keyboard
  if android?
    $driver.hide_keyboard
  elsif ios?
    $driver.hide_keyboard :pressKey
  end
end

def clear_input(el)
  find_element(:id, el['value']).clear
end

def scroll_screen(element)
  if android?
     scroll_to(element['value'])
  else
    el = find_element(:id, element['value'])
    $driver.execute_script('mobile: scroll', {"element": el, "toVisible": true})
  end
end

def scroll_to_text(text)
    scroll_to(text, scrollable_index = 0)
end

def scroll_exact_text(text)
  scroll_to_exact(text)
end

def swipe
  $driver.swipe start_x: 2, start_y: 200, end_x: 1000, end_y: 200
end

def id_text(el)
  find_element(:id, el['value']).text
end

def text_exists?(text)
  find_element(:xpath, "//*[contains(@text,'#{text}')]").displayed?
end

def element_not_exists(text)
  if android?
    find_elements(:xpath, "//*[contains(@text, '#{text}')]").empty?
  else
    find_elements(:id, "#{text}").empty?
  end
end

def element_exists_in_screen(elemento)
  case elemento['tipo_busca']
  when 'XPATH'
    find_elements(:xpath, elemento['value']).empty?
  when 'ID'
    find_elements(:id, elemento['value']).empty?
  when 'CLASS'
    find_elements(:class, elemento['value']).empty?
  when 'NAME'
    find_elements(:class, elemento['value']).empty?
  end
end

def click_text(text)
  # element_exists?
  find_element(:xpath, "//*[contains(@text,'#{text}')]").click
end

def date_is_enable?(date)
  find_element(:xpath, "//*[contains(@text, #{date})]").enabled? 
end

def android?
  device_is_android?
end

def ios?
  device_is_ios?
end

def send_key(el, value)
  element = find_element(:id, el['value'])
  # element.click

  case value
  when '2' then press_keycode(9)
  when '5' then press_keycode(12)
  when '4' then press_keycode(11)
  when '1' then press_keycode(8)
  end
end

def fill_key_code(value)
  case value
  when '0' then press_keycode(7)
  when '1' then press_keycode(8)
  when '2' then press_keycode(9)
  when '3' then press_keycode(10)
  when '4' then press_keycode(11)
  when '5' then press_keycode(12)
  when '6' then press_keycode(13)
  when '7' then press_keycode(14)
  when '8' then press_keycode(15)
  when '9' then press_keycode(16)
  end
end


def skip_invalid_link_page
 page = $driver.find_elements :id,'Invalid Dynamic Link'
 if page.empty? == false
    back = Appium::TouchAction.new.press(x: -1000, y: -1000).release.perform
 end
end

def ios_geolocation_true
  $driver.execute_script('mobile: launchApp', 'bundleId': 'com.apple.Preferences')
  $driver.swipe start_x: 200, start_y: 220, end_x: 200, end_y: 50
  $driver.find_element(id:'digio').click
  sleep 2
  #posicao x e y do botao location
  location = Appium::TouchAction.new.press(x: 15, y: 135).wait(1000).release.perform
  $driver.find_element(id:'While Using the App').click
  back_to_app = Appium::TouchAction.new.press(x: -1000, y: -1000).release.perform
end
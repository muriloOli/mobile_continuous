# frozen_string_literal: true

def delete_favored
  @first_screen.tap_button_enter
  @login_screen.login
  @welcome_screen.skip_welcome_screen
  @home_screen.tap_button_transfer
  @select_transfer_screen.tap_select_transfer_p2p
  @beneficiary_identification_p2p_screen.tap_tab_favored
  @beneficiary_identification_p2p_screen.tap_option_favored
  @beneficiary_identification_p2p_screen.tap_remove_favored
end

def include_favored
  @first_screen.tap_button_enter
  @login_screen.login
  @welcome_screen.skip_welcome_screen
  @home_screen.tap_button_transfer
  @select_transfer_screen.tap_select_transfer_p2p
  p2p_transfer_success_cpf
end

def p2p_transfer_success_cpf
  @beneficiary_identification_p2p_screen.fill_in_cpf(USUARIOS['carlos']['cpf'])
  @beneficiary_identification_p2p_screen.swipe if ios?
  @beneficiary_identification_p2p_screen.tap_button_continue
  @value = '12,00'
  if android?
    @value_transfer_screen.press_value(@value)
  else
    @value_transfer_screen.fill_in_value_transfer(@value)
  end  
  @text = Faker::Lorem.word
  @value_transfer_screen.fill_in_description(@text)
  @value_transfer_screen.select_radio_today
  @value_transfer_screen.tap_button_continue
  @review_screen.tap_button_continue
  if android?
    @review_screen.fill_in_password('2541')
  else
    @review_screen.fill_password_one_ios('2')
    @review_screen.fill_in_password_two_ios('5')
    @review_screen.fill_in_password_three_ios('4')
    @review_screen.fill_in_password_for_ios('1')
  end  
  @review_screen.tap_button_confirm
end

def p2p_transfer_success_data
  if android?
    @beneficiary_identification_p2p_screen.fill_in_bank_data('0000042', '6')
  else
    @beneficiary_identification_p2p_screen.click_agency
    @beneficiary_identification_p2p_screen.fill_in_bank_data('0000042', '6')
  end 
  @beneficiary_identification_p2p_screen.tap_button_continue
  @value = '10,00'
  if android?
    @value_transfer_screen.press_value(@value)
  else
    @value_transfer_screen.fill_in_value_transfer(@value)
  end  
  @value_transfer_screen.select_radio_today
  @text = Faker::Lorem.word
  @value_transfer_screen.fill_in_description(@text)
  @value_transfer_screen.tap_button_continue
  @review_screen.tap_button_continue
  if android?
    @review_screen.fill_in_password('2541')
    else
      @review_screen.fill_password_one_ios('2')
      @review_screen.fill_in_password_two_ios('5')
      @review_screen.fill_in_password_three_ios('4')
      @review_screen.fill_in_password_for_ios('1')
    end  
  @review_screen.tap_button_confirm
end

def accept_alerts
  if ios? 
   find_and_accept = lambda do |label|
      loop do
        sleep 0.5
        elements = $driver.find_elements :id, label
        unless elements.empty?
            elements.first.click
            break
        end
      end
   end
    find_and_accept.call('OK')
    find_and_accept.call('Allow While Using App')
    find_and_accept.call('Allow')
  end
end

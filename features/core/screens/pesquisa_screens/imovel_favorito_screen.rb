class ImovelFavoritoScreen 
    def initialize
        check_screen'address_text_view'
    end
    def find_favored_address(text)
        sleep 1
        $driver.find_element(:xpath, "//*[contains(@text,'#{text}')]")
    end

end
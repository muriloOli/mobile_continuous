class PesquisaScreen 
    def initialize
        check_screen'search_edit_text'
    end
    def fill_address(text)
        insert_text'search_edit_text',text
    end
    def click_first_location
        waitElement'location'
        btn = finding_element'location'
        btn.click
    end
    def button_available
        waitElement'view_list_label'
    end
    def click_viewlist
        btn = finding_element'view_list_label'
        btn.click
    end
    def swipe_menu
        swipe 
    end
    def click_favored_menu
        btn = finding_xpath '//*[@text="Favorite Listings"]'
        btn.click
    end


end
class ResultadoPesquisaScreen
    def initialize
        check_screen'statusBadge'
    end
    def click_first_imovel
        waitElement'listingImageView'
        btn = finding_element'listingImageView'
        btn.click
    end
end
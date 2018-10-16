require_relative 'pages/bbc_homepage.rb'
require_relative 'pages/bbc_sign_in_pages.rb'

class BBCSite

    def bbc_homepage
        BBCHomepage.new
    end

    def bbc_sign_in_page
        BBCSignInPage.new
    end

end
require 'capybara'

class BBCSignInPage
    SIGN_IN_PAGE_URL = 'https://account.bbc.com/signin'
    EMAIL_ID = '#user-identifier-input'
    PASSWORD_ID = '#password-input'
    SUBMIT_ID = '#submit-button'
    LOGIN_IN_ID = '#idcta-username'
    LOGIN_IN_VALUE = 'christianmils…'
    MAIN_ERROR_ID = '#form-message-general'
    PASSWORD_ERROR_ID = '#form-message-password'
    USERNAME_ERROR_ID = '#form-message-username'

    def initialize
        Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, :browser => :chrome)
        end
        @session = Capybara::Session.new(:chrome)
    end

    def visit_sign_in_page
        @session.visit(SIGN_IN_PAGE_URL)
    end

    def find_email_field
        @session.find(EMAIL_ID)
    end

    def find_password_field
        @session.find(PASSWORD_ID)
    end

    def find_submit_button
        @session.find(SUBMIT_ID)
    end

    def find_login_in_field
        @session.find(LOGIN_IN_ID)
    end

    def find_incorrect_password_div
        @session.find(PASSWORD_ERROR_ID)
    end

    def find_incorrect_username_div
        @session.find(USERNAME_ERROR_ID)
    end

    def find_main_error_div
        @session.find(MAIN_ERROR_ID)
    end

    def input_email(email)
        find_email_field.fill_in(with: email)
        if find_email_field.value == email
            return true
        end
        return false
    end

    def input_password(password)
        find_password_field.fill_in(with: password)
        if find_password_field.value == password
            return true
        end
        return false
    end

    def click_submit_button
        find_submit_button.click
        return check_logged_in
    end

    def check_logged_in
        return find_login_in_field.has_content?(LOGIN_IN_VALUE)
    end

    def click_submit_button_incorrect_password
        find_submit_button.click
        if find_incorrect_password_div.visible?
            find_submit_button.click
            return find_main_error_div.visible?
        end
        return false
    end

    def click_submit_button_incorrect_username
        find_submit_button.click
        if find_incorrect_username_div.visible?
            find_submit_button.click
            return find_main_error_div.visible?
        end
        return false
    end


end
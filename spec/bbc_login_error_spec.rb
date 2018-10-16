describe 'Incorrect user details' do

    context 'it should respond with the correct error when incorrect details are input' do

        before(:each) do
            # @bbc_page = BBCSite.new.bbc_homepage
            # @bbc_page.visit_homepage
            @sign_in_page = BBCSite.new.bbc_sign_in_page
            @sign_in_page.visit_sign_in_page
        end

        it 'should successfully login' do
            expect(@sign_in_page.input_email('christianmilson@icloud.com')).to eq(true)
            expect(@sign_in_page.input_password('Didercuche1234')).to eq(true)
            expect(@sign_in_page.click_submit_button).to eq(true)
        end

        it 'should detect an incorrect username' do
            expect(@sign_in_page.input_email('chritianmilson@icloud.com')).to eq(true)
            expect(@sign_in_page.input_password('Didercuche1234')).to eq(true)
            expect(@sign_in_page.click_submit_button_incorrect_username).to eq(true)
        end

        it 'should detect an incorrect password' do
            expect(@sign_in_page.input_email('christianmilson@icloud.com')).to eq(true)
            expect(@sign_in_page.input_password('Didercuche134')).to eq(true)
            expect(@sign_in_page.click_submit_button_incorrect_password).to eq(true)
        end

    end
end
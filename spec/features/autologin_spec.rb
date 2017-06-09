require 'rails_helper'

feature 'Autologin' do

  background do
    @nif = '12345678N'
    @encoded_nif = Base64.strict_encode64(@nif)
    @user = create(:user, username: "Manuela Colau", document_number: @nif)
  end

  scenario 'Autologin feature with valid NIF' do
    visit "/Pedidos/?NIF=#{@encoded_nif}"

    expect(page).to have_content('My account')
  end

  scenario 'Autologin feature with invalid NIF' do
    visit "/Pedidos/?NIF=FOOOO"

    expect(page).to_not have_content('My account')
  end

end

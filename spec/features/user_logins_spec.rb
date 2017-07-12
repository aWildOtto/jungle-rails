require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @login = User.create!(
      first_name: "Otto",
      last_name: "Hu",
      email: "ottohu101@gmail.com",
      password: "1234567"
    )
  end

  scenario "They should go back to homepage with login message displayed after logging in successfully" do
    visit root_path
    visit find('#log_in')['href']

    fill_in 'email', with: 'ottohu101@gmail.com'
    fill_in 'password', with: '1234567'
    find('.submit-btn').click
    save_screenshot

    expect(page.find(".navbar")).to have_css(".login_msg")
  end

  scenario "They should see a notice message displayed when logging in unsuccessfully" do
    visit root_path
    visit find('#log_in')['href']

    fill_in 'email', with: 'ottohu101@gmail.com'
    fill_in 'password', with: '123456789'
    find('.submit-btn').click
    save_screenshot

    expect(page).to have_css(".alert")
    expect(page.find(".alert")).to have_content("wrong credentials")
  end
end

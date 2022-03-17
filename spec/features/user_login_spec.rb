require 'rails_helper'

RSpec.feature "User can login", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Albert',
      last_name: 'Einstein',
      email: 'og@physics.com',
      password: 'eequalsmc2',
      password_confirmation: 'eequalsmc2'
    )
  end

  scenario "User can login with their credentials" do
    # ACT
    visit root_path
    find('#navbar')
      .find('.navbar-right')
        .find('.dropdown')
        .find('.dropdown-toggle')
        .click
  
    # DEBUG / VERIFY
    puts page.html
    save_screenshot

    expect(page).to have_css 'i.fa.fa-sign-in'
  end
end

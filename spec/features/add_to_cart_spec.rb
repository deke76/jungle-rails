require 'rails_helper'

RSpec.feature "Visitor can add an item to cart", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(word_count: 3),
          description: Faker::Hipster.paragraph(sentence_count: 4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They can add an item to a cart" do
      # ACT
      visit root_path
      click_on('Add', match: :first)
  
      # DEBUG / VERIFY
      save_screenshot

      expect(page).to have_text 'My Cart (1)'
    end

end

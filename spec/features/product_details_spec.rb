require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see details of a product when they click the product" do
    # ACT
    visit root_path
    visit first('.product').find('.pull-right')['href']
    
    save_screenshot
    expect(page).to have_css(".main-img")
    expect(page).to have_css(".dl-horizontal")
  end
end

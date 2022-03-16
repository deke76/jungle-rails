require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves a new product with a name" do
      @test_category = Category.create({name: 'Appliances'})
      @test_product = @test_category.products.create({
        name: 'Microwave',
        description: Faker::Hipster.paragraph(sentence_count: 4),
        quantity: 5,
        price: 124.95
      })
      expect(@test_product.name).to be_present
    end

    it "saves a new product with a price" do
      @test_category = Category.create({name: 'Appliances'})
      @test_product = @test_category.products.create({
        name: 'Microwave',
        description: Faker::Hipster.paragraph(sentence_count: 4),
        quantity: 5,
        price: 124.95
      })
      expect(@test_product.price).to be_present
    end

    it "saves a new product with a quantity" do
      @test_category = Category.create({name: 'Appliances'})
      @test_product = @test_category.products.create({
        name: 'Microwave',
        description: Faker::Hipster.paragraph(sentence_count: 4),
        quantity: 5,
        price: 124.95
      })
      expect(@test_product.quantity).to be_present
    end

    it "saves a new product with a category" do
      @test_category = Category.create({name: 'Appliances'})
      @test_product = @test_category.products.create({
        name: 'Microwave',
        description: Faker::Hipster.paragraph(sentence_count: 4),
        quantity: 5,
        price: 124.95
      })
      expect(@test_product.category_id).to be_present
    end
  end

end

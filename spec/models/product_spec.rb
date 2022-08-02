


require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is a valid product" do 
    @category = Category.create
    @product = Product.new(name: "Salmy", price_cents: 25, quantity: 10, category: @category)
    @product.save
    expect(@product).to be_valid
  end
  it "is not valid without a name" do 
    @category = Category.create
    @product = Product.new(name: nil, price_cents: 25, quantity: 10, category: @category)
    @product.save
    expect(@product).to_not be_valid
  end
  

   it "is not valid without a price" do 
    @category = Category.create
    @product = Product.new(name: "Salmy", price_cents: nil, quantity: 10, category: @category)
    @product.save
    expect(@product).to_not be_valid
  end

  it "is not valid without a quantity" do 
    @category = Category.create
    @product = Product.new(name: "Salmy", price_cents: 24, quantity: nil, category: @category)
    @product.save
    expect(@product).to_not be_valid
  end

  it "is not valid without a category" do 
    @product = Product.new(name: "Salmy", price_cents: 35, quantity: 10, category: nil)
    @product.save
    expect(@product).to_not be_valid
  end


  end
end
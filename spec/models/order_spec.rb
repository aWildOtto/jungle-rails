require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category1 = Category.create!(name: "Food")
      @product1 = Product.create!(
        name: "what",
        category: @category1,
        description: "qwjeiqojklkdfafjl",
        quantity: 100,
        price: 1000
      )
      @product2 = Product.create!(
        name: "something",
        category: @category1,
        description: "qweqweiouojzvncxvnzn",
        quantity: 80,
        price: 10000
      )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: "ottohu101@gmail.com",
        total: 2* @product1.price,
        stripe_charge_id: "stripe_charge.id"
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be_eql 98
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(
        email: "ottohu101@gmail.com",
        total: 2* @product2.price,
        stripe_charge_id: "stripe_charge.id"
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price,
        total_price: @product2.price * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be_eql 100
    end
  end
end

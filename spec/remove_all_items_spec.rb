# 
# run this with bundle exec rspec spec/remove_all_items_spec.rb -fd

require 'spec_helper'

RSpec.describe "Remove all items from the shopping cart" do
    home_page = nil
    checkout_cart_page = nil
        
    before(:all) do
        @browser = Watir::Browser.new :firefox
    end

    after(:all) do
        @browser.close
    end    
    
    it "view the DEMOQA web page" do
        home_page = Home.new(@browser)        
        home_page.goto

        expect(home_page.valid?).to be true        
    end
    
    it "select an item and checkout" do
        product_page = home_page.select_category :iPhone
        
        expect(product_page.valid?).to be true        
        item_page = product_page.select_item :magic_mouse

        expect(item_page.valid?).to be true 
        
        mouse_price = item_page.price
        log "PRICE IS #{mouse_price}"
        
        checkout_cart_page = item_page.add_to_cart
        expect(checkout_cart_page.valid?).to be true
    end
    
    it "shopping cart has an item" do
       expect(checkout_cart_page.is_empty?).to be false
    end
    
    
    it "item is removed and shopping cart is empty" do
       checkout_cart_page.empty_all
       expect(checkout_cart_page.is_empty?).to be true        
    end

end

# 
# run this with bundle exec rspec spec/submit_order_spec.rb -fd

require 'spec_helper'

RSpec.describe "Validate iPhone Order Total" do
    home_page = nil
    product_page = nil
    checkout_info_page = nil
    
    iphone_price = nil
    
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
    
    it "select the iPhone product category" do
        product_page = home_page.select_category :iPhone
        
        expect(product_page.valid?).to be true        
     end

    it "select the iPhone 4S and checkout" do
        item_page = product_page.select_item :iPhone_4S_Black

        expect(item_page.valid?).to be true 
        
        iphone_price = item_page.price
        log "PRICE IS #{iphone_price}"
        
        checkout_cart_page = item_page.add_to_cart
        expect(checkout_cart_page.valid?).to be true
        
        checkout_info_page = checkout_cart_page.continue
        expect(checkout_info_page.valid?).to be true 
    end
    
    it "validate shipping plus item cost equals total price" do
        expect(checkout_info_page.select_country("India")).to be true 
        expect(checkout_info_page.total_price_valid?).to be true 
    end

end

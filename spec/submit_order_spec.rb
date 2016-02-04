# 
# run this with bundle exec rspec spec/submit_order_spec.rb -fd

require 'spec_helper'

RSpec.describe "Submit Order for iPhone" do
    home_page = nil
    product_page = nil
    checkout_page = nil
    
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
        
        checkout_page = item_page.add_to_cart
        expect(checkout_page.valid?).to be true
    end
    
    it "validate price and tax" 

end

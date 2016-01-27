# 
# run this with bundle exec rspec spec/submit_order_spec.rb -fd

require 'spec_helper'

RSpec.describe "Submit Order for iPhone" do
    home_page = nil
    product_page = nil
    
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
        product_page = home_page.select_iphone_category
        
       expect(product_page.valid?).to be true        
     end

    it "select the iPhone 4S" do
    end
end

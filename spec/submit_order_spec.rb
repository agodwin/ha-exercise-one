require 'watir-webdriver'
require 'page-object'

# TODO: FIX THIS???
require '/home/tgodwin/dev/ruby/ha-exercise-one/page/Home.rb'

# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

# exit suite as soon as one example fails
# does not run remaining examples 
RSpec.configure do |c|
  c.fail_fast = true
end


RSpec.describe "Submit Order for iPhone" do
    before(:all) do
        @browser = Watir::Browser.new :firefox
        @home_page = Home.new(@browser)        
    end

    after(:all) do
        @browser.close
    end    
    
    it "view the DEMOQA web page" do
        @home_page.goto
        expect(@home_page.iphone?).to be true
        
        log("did it work?", true)
    end
end

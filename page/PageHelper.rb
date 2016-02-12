# Page Helper
# mixin for methods which can be used on more than one Page

module PageHelper
    
    # Common to Checkout pages
    def progress_bar_element(stage)
       browser.div(:class => 'progress_wrapper', :class => 'top').li(:class => stage, :class => 'act')
    end

    # Common to Item pages    
    def add_checkout msg
        #click button
        self.buy
        
        #deal with a pop-up - click checkout
        Watir::Wait.until {browser.text.include?(msg)}
        
        browser.link(:href => 'http://store.demoqa.com/products-page/checkout/').focus      
        browser.send_keys :enter
        
        #return shopping cart page
        next_page = Checkout_Cart.new(browser)
        next_page.loaded?
        next_page      
    end
    
    def add_continue msg
        #click button
        self.buy
        
        #deal with a pop-up - click continue shopping
        Watir::Wait.until {browser.text.include?(msg)}
        browser.link(:class => 'continue_shopping').focus      
        browser.send_keys :enter
        
        #return this item page
        self
    end

end

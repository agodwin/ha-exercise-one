class Black_iPhone_4s
  include PageObject

  
  def valid?
      browser.title().start_with?("Apple iPhone 4S 16GB SIM-Free - Black")
  end
  
  def loaded?
      browser.h1(:class => 'prodtitle', :text => 'Apple iPhone 4S 16GB SIM-Free – Black').wait_until_present
      self.valid?
  end

  def price
      self.price.text
  end
  
  def add_to_cart
      #click button
      self.buy

      #deal with a pop-up - click checkout
      Watir::Wait.until {browser.text.include?('You just added "Apple iPhone 4S 16GB SIM-Free - Black" to your cart.')}
      
      browser.link(:href => 'http://store.demoqa.com/products-page/checkout/').focus      
      browser.send_keys :enter
      
      #return shopping cart page
      next_page = Checkout_Cart.new(browser)
      next_page.loaded?
      next_page      
  end
  
  def add_to_cart_continue_shopping
      #click button
      self.buy

      #deal with a pop-up - click continue shopping
      Watir::Wait.until {browser.text.include?('You just added "Apple iPhone 4S 16GB SIM-Free - Black" to your cart.')}
      browser.link(:class => 'continue_shopping').focus      
      browser.send_keys :enter
      
      #return this item page
      self
  end
  
private
    span(:price, :class => 'currentprice')
    button(:buy, :name => 'Buy')
end

class Black_iPhone_4s
  include PageObject
  include PageHelper
  
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
      add_checkout 'You just added "Apple iPhone 4S 16GB SIM-Free - Black" to your cart.'
  end
  
  def add_to_cart_continue_shopping
      add_continue 'You just added "Apple iPhone 4S 16GB SIM-Free - Black" to your cart.'
  end

private
    span(:price, :class => 'currentprice')
    button(:buy, :name => 'Buy')
end

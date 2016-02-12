class Magic_Mouse
  include PageObject
  include PageHelper
  
  def valid?
      browser.title().start_with?("Magic Mouse | ONLINE")
  end
  
  def loaded?
      browser.h1(:class => 'prodtitle', :text => 'Magic Mouse').wait_until_present
      self.valid?
  end

  def price
      self.price.text
  end

  def add_to_cart
      add_checkout 'You just added "Magic Mouse" to your cart.'
  end
  
  def add_to_cart_continue_shopping
      add_continue 'You just added "Magic Mouse" to your cart.'
  end

private
    span(:price, :class => 'currentprice')
    button(:buy, :name => 'Buy')
end

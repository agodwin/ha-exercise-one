class Checkout
  include PageObject

  
  def valid?
      browser.title().start_with?("Checkout")
  end
  
  def loaded?
      browser.table(:class => 'checkout_cart').wait_until_present
      self.valid?
  end
  
  
private
end

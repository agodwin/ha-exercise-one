class Checkout_Info
  include PageObject

  
  def valid?
      browser.title().start_with?("Checkout") &&
          browser.li(:class => 'info act')
  end
  
  def loaded?
      browser.div(:id => 'wpsc_shopping_cart_container').wait_until_present
      self.valid?
  end
  
  def continue
      continue
      next_page = Black_iPhone_4s.new(browser)
      next_page.loaded?        
  end
  
private
    button(:remove_item, :value => 'Remove', :name => 'submit')
    link(:continue, :class => 'step2')
end

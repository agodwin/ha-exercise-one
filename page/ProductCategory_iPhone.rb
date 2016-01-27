class ProductCategory_iPhone
  include PageObject

  
  def valid?
      browser.title().start_with?("iPhones | ONLINE")
  end
  
  def loaded?
      browser.h1(:class => 'entry-title', :text => 'iPhones').wait_until_present
      self.valid?
  end

private
    

end

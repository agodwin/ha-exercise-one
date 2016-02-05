class ProductCategory_iPhone
  include PageObject

  
  def valid?
      browser.title().start_with?("iPhones | ONLINE")
  end
  
  def loaded?
      browser.h1(:class => 'entry-title', :text => 'iPhones').wait_until_present
      self.valid?
  end

  def select_item(title)
      next_page = nil
      
      case title
      when :iPhone_4S_Black
          iphone_4s_black
          next_page = Black_iPhone_4s.new(browser)
          next_page.loaded?

      when :magic_mouse
          magic_mouse
          next_page = Magic_Mouse.new(browser)
          next_page.loaded?

      #TODO: finish adding additional products...         
      when :iphone_4S_white
          iphone_4s_white
          #next_page = ???.new(browser)
          #next_page.loaded?
      else
          raise ArgumentError, "Did not understand argument => #{title}"
      end
      
      # return the new page
      next_page
  end

private
    link(:magic_mouse, :href => 'http://store.demoqa.com/products-page/product-category/iphones/magic-mouse/')
    link(:iphone_4s_black, :href => 'http://store.demoqa.com/products-page/product-category/iphones/apple-iphone-4s-16gb-sim-free-black/')
    link(:iphone_4s_white, :href => 'http://store.demoqa.com/products-page/product-category/iphones/apple-iphone-4s-32gb-sim-free-white/')

end

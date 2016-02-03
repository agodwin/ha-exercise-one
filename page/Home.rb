class Home
  include PageObject

  page_url 'http://store.demoqa.com/'
  
  def valid?
      browser.title().start_with?("ONLINE STORE")
  end

  def loaded?
      self.goto
      self.valid?
  end

  def select_category(product)
      next_page = nil
      
      product_menu_element.hover
      
      case product
      when :iPhone
          iphone_menu_item          
          next_page = ProductCategory_iPhone.new(browser)
          next_page.loaded?
 
      #TODO: finish adding additional menu options           
      when :accessory
         accesory_menu_item
     else
         raise ArgumentError, "Did not understand argument => #{product}"
     end
      # return the new page
      next_page
  end

private
  link(:product_menu, :href => 'http://store.demoqa.com/products-page/product-category/')
  link(:iphone_menu_item, :href => 'http://store.demoqa.com/products-page/product-category/iphones/')  
  link(:accesory_menu_item, :href => 'http://store.demoqa.com/products-page/product-category/accessories/')
end

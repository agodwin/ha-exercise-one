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

  def select_iphone_category
      product_menu_element.hover
      iphone_menu_item

      # logic to get to the new page
      pc = ProductCategory_iPhone.new(browser)
      pc.loaded?
      pc
  end

private
  link(:product_menu, :href => 'http://store.demoqa.com/products-page/product-category/')
  link(:iphone_menu_item, :href => 'http://store.demoqa.com/products-page/product-category/iphones/')  
end

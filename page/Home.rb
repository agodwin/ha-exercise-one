class Home
  include PageObject

  page_url 'http://store.demoqa.com/'
  
  link(:iphone, :href => 'http://store.demoqa.com/products-page/product-category/iphones/')

end

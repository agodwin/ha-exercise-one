class Checkout_Cart
  include PageObject

  
  def valid?
      browser.title().start_with?("Checkout") &&
          progress_bar_element('cart').exists?
  end
  
  def loaded?
      browser.table(:class => 'checkout_cart').wait_until_present
      progress_bar_element('cart').wait_until_present
      self.valid?
  end
  
  def continue
      continue
      next_page = Checkout_Info.new(browser)
      next_page.loaded?        
  end
  
private
    button(:remove_item, :value => 'Remove', :name => 'submit')
    link(:continue, :class => 'step2')

    #TODO: move this into a page/Page_Helper.rb as it is used in other Checkout pages
    def progress_bar_element(stage)
       browser.div(:class => 'progress_wrapper', :class => 'top').ul.li(:class => stage, :class => 'act')
    end
end

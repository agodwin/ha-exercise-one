class Checkout_Info
  include PageObject

  
  def valid?
      browser.title().start_with?("Checkout") &&
         progress_bar_element('info').exists?
  end
  
  def loaded?
      browser.div(:id => 'wpsc_shopping_cart_container').wait_until_present
      progress_bar_element('info').wait_until_present

      self.valid?
  end
  
private

    #TODO: move this into a page/Page_Helper.rb as it is used in other Checkout pages
    def progress_bar_element(stage)
       browser.div(:class => 'progress_wrapper', :class => 'top').ul.li(:class => stage, :class => 'act')
    end
end

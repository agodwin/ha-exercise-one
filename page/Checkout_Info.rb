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
  
  def select_country(name)
      log "COUNTRY REQUESTED is #{name}"    

      # verify name an option in the country select list?
      #TODO: VERIFICATION IS VERY VERY SLOW ??? WHY ???
      #list = country_options
      #if (list.find_index(name) == nil) then
      #    log "DID NOT FIND COUNTRY \"#{name}\" in #{list}", true
      #    return false
      #end
      
      # set the option and update the page
      # need to use "self" to access the existing Chessy element locator - WHY?
      self.country = name
      self.calculate_button
      
      # wait for the page to update
      self.loaded?
      
      log "COUNTRY SELECTED is #{country}"
      
      # give feedback on the result
      self.country.eql? name      
  end
  
  def total_price_valid?
      # convert strings to integers
            
      log "SHIPPING PRICE #{shipping_price_str}"      
      log "ITEM PRICE #{product_price_str}"     
      log "TOTAL PRICE #{total_price_str}"

      shipping = convert_currency shipping_price_str
      item = convert_currency product_price_str
      total = convert_currency total_price_str
      log "DOES #{shipping} + #{item} EQUAL #{total}"
      shipping + item == total
  end
  
private
    button(:calculate_button, :name => 'wpsc_submit_zipcode')
    select_list(:country, :id => 'current_country')
    
    #TODO: move this into a page/Page_Helper.rb as it is used in other Checkout pages
    def progress_bar_element(stage)
       browser.div(:class => 'progress_wrapper', :class => 'top').ul.li(:class => stage, :class => 'act')
    end
    
    def shipping_price_str
        browser.tr(:class => 'total_shipping').span(:class => 'pricedisplay').text
    end
    def product_price_str
        browser.tr(:class => 'total_item').span(:class => 'pricedisplay').text
    end
    def total_price_str
        browser.span(:id => 'checkout_total').span(:class => 'pricedisplay').text
    end
    
    # TODO: FIX THIS - too many assumptions 
    def convert_currency currency_str
        # assume string starts with a currency symbol, remove it
        str = currency_str[1..currency_str.length];
        
        # remove ',' characters - TODO: this needs to be LOCALIZED
        digits = str.gsub(/,/,'')
        
        # Convert to Integer - TODO: this will truncate cents 5.12 => 5
        digits.to_i
    end
end

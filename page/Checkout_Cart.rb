class Checkout_Cart
    include PageObject
    include PageHelper

  
    def valid?
        browser.title().start_with?("Checkout")
    end
    
    def loaded?
        #TODO: prevent this from failing when the shopping cart is empty
        browser.table(:class => 'checkout_cart').wait_until_present        
        progress_bar_element('cart').wait_until_present
    end
    
    def continue
        continue_button
        
        next_page = Checkout_Info.new(browser)
        next_page.loaded?
        next_page
    end
      
    def empty_all
        while (self.is_empty? == false) do
            self.remove_item_button
        end
    end
  
    def is_empty?
        #TODO: fix this it is VERY SLOW when the shopping cart has items
        empty_message.include?("Oops, there is nothing in your cart")
    end
   
private
    button(:remove_item_button, :value => 'Remove', :name => 'submit')
    link(:continue_button, :class => 'step2')
    table(:shopping_cart, :class => 'checkout_cart')
    div(:empty_message, :class => 'entry-content')
end

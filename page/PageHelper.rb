# Page Helper
# mixin for methods which can be used on more than one Page

module PageHelper
    
    # Common to Checkout pages
    def progress_bar_element(stage)
       browser.div(:class => 'progress_wrapper', :class => 'top').li(:class => stage, :class => 'act')
    end
end

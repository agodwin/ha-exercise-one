require 'watir-webdriver'
require 'page-object'

# pull in all the page files
#   the Page Helper must come first
require File.expand_path("../page/PageHelper.rb", __dir__)
#   now any and all remaining pages 
Dir[File.expand_path("../page/*.rb", __dir__)].each { |f| require f }

# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

# exit suite as soon as one example fails
# does not run remaining examples 
RSpec.configure do |c|
  c.fail_fast = true
end

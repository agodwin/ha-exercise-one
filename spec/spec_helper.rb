require 'watir-webdriver'
require 'page-object'

# pull in all the page files
Dir[File.expand_path("../page/*.rb", __dir__)].each {|f| require f}

# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

# exit suite as soon as one example fails
# does not run remaining examples 
RSpec.configure do |c|
  c.fail_fast = true
end

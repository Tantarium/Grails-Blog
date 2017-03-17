require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/login'
include Navigation
include Login


Given (/^I am logged in as a blogger$/) do
  goto_login_page
  login('Lp3','password')
end

When (/^I publish a new blog post$/) do
  click_on_create_button

end
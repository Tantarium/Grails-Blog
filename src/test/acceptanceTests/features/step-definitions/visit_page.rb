require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/login'
include Navigation
include Login

When(/^I visit the blog for my favorite blogger$/) do
  goto_login_page
  login('Lp3','password')
end
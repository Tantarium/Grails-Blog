require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/login'
require_relative '../workflows/new_blog_information'
require_relative '../workflows/random_input'
include RandomInput
include Navigation
include Login
include NewBlogEntry


Given (/^I am logged in as a blogger$/) do
  goto_login_page
  login('Lp3','password')
end

When (/^I publish a new blog post$/) do
  click_on_create_link
  add_title_and_text
  click_on_create_button
end

Then (/^I am notified that the blog post was successfully added$/) do
  expectedMessage = 'Blog created'
  expect(success_message_from_page).to eq expectedMessage
end

And (/^the newly added blog post is at the top of the recent posts list$/) do
  
end
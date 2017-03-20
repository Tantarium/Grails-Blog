require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/reading_blog_information'
require_relative '../workflows/login'
include Navigation
include ReadingBlog
include Login

Given (/^my favorite blogger has been very active$/) do
  goto_login_page
  login('Lp3','password')
  create_ten_blog_posts
end

Then (/^then I should see a summary of my favorite blogger's 10 most recent posts in reverse order$/) do
  
  clean_up_blogs_created
end

Given (/^I visit the blog for my favorite blogger$/) do
  visit_page(Home)
end

When (/^I choose a blog post$/) do
  @title = get_title_off_page
  click_on_blog_post
end

Then (/^I should see the blog post$/) do
  expected_title = @title
  expect(get_title_off_show_page).to eq(expected_title)
end


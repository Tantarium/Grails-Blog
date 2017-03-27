require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/login'
require_relative '../workflows/random_input'

include Navigation
include Login
include RandomInput

Given (/^I am reading a blog post from my favorite blogger$/) do
  goto_login_page
  login('Lp3','password')
  click_on_create_link
  @title = "Random Title of Blog #{random_string(5)}"
  add_title_and_text(@title)
  click_on_create_button

  visit_page(Home)
  title = get_title_off_page
  click_on_blog_post(title)
end

When (/^I add my genius comment to the blog post$/) do
  @commenter = 'Cucumber Test'
  @commentText = random_comment_text
  add_comment_to_blog(@commenter, @commentText)
end

Then (/^my genius comment is at the top of the blog post comments$/) do
  expect(name_of_commenter_off_page).to eq(@commenter)
  expect(text_of_comment_off_page).to eq(@commentText)

  visit_page(Home)
  delete_added_blog(get_title_off_page)
end

Then (/^I should see comments left by other readers$/) do
  commenter = 'Cucumber Test'
  commentText = random_comment_text
  add_comment_to_blog(commenter, commentText)

  expect(name_of_commenter_off_page).to eq(commenter)
  expect(text_of_comment_off_page).to eq(commentText)

  visit_page(Home)
  delete_added_blog(get_title_off_page)
end
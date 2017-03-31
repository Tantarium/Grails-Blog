require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
require_relative '../workflows/reading_blog_information'
require_relative '../workflows/login'
require_relative '../workflows/random_input'
include RandomInput
include Navigation
include ReadingBlog
include Login

Given (/^My favorite blogger has been very active$/) do
  goto_login_page
  login('Lp3','password')
  create_ten_blog_posts
  visit_page(Home)
  on_page(Home).logout
end

Then (/^then I should see a summary of my favorite blogger's 10 most recent posts in reverse order$/) do
  array = grab_ten_most_recent_blogs
  expected = 'true'
  expect(compare_dates(array[0], array[1])).to eq expected
  expect(compare_dates(array[1], array[2])).to eq expected
  expect(compare_dates(array[2], array[3])).to eq expected
  expect(compare_dates(array[3], array[4])).to eq expected
  expect(compare_dates(array[4], array[5])).to eq expected
  expect(compare_dates(array[5], array[6])).to eq expected
  expect(compare_dates(array[6], array[7])).to eq expected
  expect(compare_dates(array[7], array[8])).to eq expected
  expect(compare_dates(array[8], array[9])).to eq expected

  goto_login_page
  login('Lp3','password')
  visit_page(Home)
  clean_up_blogs_created
  visit_page(Home)
  on_page(Home).logout
end

Given (/^I visit the blog for my favorite blogger$/) do
  visit_page(Home)
end

When (/^I visit my favorite blogger's blog$/) do
  visit_page(Home)
end

When (/^I choose a blog post$/) do
  @title = get_title_off_page
  click_on_blog_post(@title)
end

Then (/^I should see the blog post$/) do
  expected_title = @title
  expect(get_title_off_show_page).to eq(expected_title)
end

When (/^I search for a blog post$/) do
  @top_title_from_page = on_page(Home).top_title
  click_on_search_button
  on_page(Search) do |page|
    page.search = "#{@top_title_from_page}"
  end
  on_page(Search).submit_click
end

Then (/^I should see posts with that value in the title$/) do
  expected = @top_title_from_page
  expect(get_title_of_first_result).to eq(expected)
end

Then (/^the url should contain information about the post$/) do
  title = get_title_off_show_page.downcase.gsub! ' ', '-'
  current_url = @browser.url
  url_array = current_url.split('/')
  title_from_page = url_array.last
  expect(title_from_page).to eq(title)
end


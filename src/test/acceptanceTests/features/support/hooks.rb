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


Before() do
  @browser = Watir::Browser.new :chrome
end

Before() do
  goto_login_page
  login('Lp3','password')
  click_on_create_link
  title = "Random Title of Blog #{random_string(5)}"
  add_title_and_text(title)
  click_on_create_button
  visit_page(Home)
  on_page(Home).logout
end

After() do |scenario|
  sleep(5)
end

After() do
  goto_login_page
  login('Lp3','password')
  visit_page(Home)
  delete_added_blog(get_title_off_page)
  visit_page(Home)
  on_page(Home).logout
end
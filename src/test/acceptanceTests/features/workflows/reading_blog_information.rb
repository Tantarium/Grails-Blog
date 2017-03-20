require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
include Navigation

module ReadingBlog
  include PageObject::PageFactory

  def get_title_off_page
    on_page(Home).top_title
  end

  def get_title_off_show_page
    on_page(ViewBlog).title
  end

  def create_ten_blog_posts
    for i in 0..9
      click_on_create_link
      add_title_and_text("Random Title of Blog #{random_string(5)}")
      click_on_create_button
      visit_page(Home)
    end
  end

  def clean_up_blogs_created
    for i in 0..9
      visit_page(Home)
      on_page(Home).view
      on_page(ViewBlog).delete
      @browser.alert.ok
    end
  end

end
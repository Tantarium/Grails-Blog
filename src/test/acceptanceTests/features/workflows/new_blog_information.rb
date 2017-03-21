require 'page-object'
require 'watir'

module NewBlogEntry
  include PageObject::PageFactory

  def add_title_and_text(title)
    on_page(Create) do |page|
      page.title = title
      page.author = "Cucumber Test #{random_string(2)}"
      page.description = "Random string for test #{random_string(5)}"
      page.text = random_blog_text
    end
  end

  def click_on_create_button
    on_page(Create).create
  end

  def success_message_from_page
    on_page(PostCreate).success
  end

  def get_title_of_top_entry
    on_page(Home).top_title
  end

  def delete_added_blog(title)
    @browser.div(:text => title).click
    on_page(ViewBlog).delete
    @browser.alert.ok
  end

end
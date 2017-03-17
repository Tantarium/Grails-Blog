require 'page-object'
require 'watir'

module NewBlogEntry
  include PageObject::PageFactory

  def add_title_and_text
    on_page(Create) do |page|
      page.title = "Random Title of Blog #{random_string(5)}"
      page.text = random_blog_text
    end
  end

  def click_on_create_button
    on_page(Create).create
  end

  def success_message_from_page
    on_page(PostCreate).success
  end


end
require 'page-object'
require 'watir'

module Navigation
  include PageObject::PageFactory

  def goto_login_page
    visit_page(LoginPage)
  end

  def click_on_create_link
    @browser.li(:text => 'New Blog Entry').click
  end

  def click_on_home_link
    @browser.li(:text => 'Home').click
  end

  def click_on_blog_post(title)
    @browser.div(:text => title).click
  end

  def click_on_search_button
    @browser.li(:text => 'Search').click
  end

end
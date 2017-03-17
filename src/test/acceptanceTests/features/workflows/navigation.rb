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

end
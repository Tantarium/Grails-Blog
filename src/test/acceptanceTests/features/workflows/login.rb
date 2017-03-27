require 'page-object'

module Login

  include PageObject::PageFactory

  def login(username, password)
    on_page(LoginPage) do |page|
      page.username = username
      page.password = password
    end

    on_page(LoginPage).submit

  end



end
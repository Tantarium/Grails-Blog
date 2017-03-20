require 'page-object'

class LoginPage
  include PageObject
  page_url "localhost:8080/login/auth"
  text_field(:username, id: 'username')
  text_field(:password, id: 'password')
  button(:submit, id: 'submit')
end
require 'page-object'
require 'watir'

class PostCreate
  include PageObject

  div(:success, class: 'message')
end
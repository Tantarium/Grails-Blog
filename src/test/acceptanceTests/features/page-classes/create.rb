require 'page-object'
require 'watir'

class Create
  include PageObject
  text_field(:title, id: 'title')
  text_area(:text, id: 'text')
  button(:create, id: 'create')
end
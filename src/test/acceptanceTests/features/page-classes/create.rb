require 'page-object'
require 'watir'

class Create
  include PageObject
  text_field(:title, id: 'title')
  text_area(:text, id: 'text')
  text_field(:author, id: 'author')
  text_field(:description, id: 'description')
  button(:create, id: 'create')
end
require 'page-object'
require 'watir'

class Create
  include PageObject
  text_area(:title, id: 'title')
  text_area(:text, id: 'text')
  text_area(:author, id: 'author')
  text_area(:description, id: 'description')
  button(:create, id: 'create')
end
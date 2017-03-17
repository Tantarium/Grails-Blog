require 'page-object'
require 'watir'

class Create
  include PageObject
  text_field(:title, id: 'title')
  text_field(:text, id: 'text')
end
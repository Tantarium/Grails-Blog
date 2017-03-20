require 'page-object'
require 'watir'

class ViewBlog
  include PageObject
  button(:delete, :class => 'delete')
  div(:title, id: 'title')
end
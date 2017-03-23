require 'page-object'
require 'watir'

class ViewBlog
  include PageObject
  button(:delete, :class => 'delete')
  div(:title, id: 'title')
  text_field(:name, id: 'commenter')
  text_area(:comment, id: 'commentText')
  button(:save_comment, id: 'create')
  span(:first_commenter, id: 'commenter_0')
  div(:first_commentText, id: 'commentText_0')
end
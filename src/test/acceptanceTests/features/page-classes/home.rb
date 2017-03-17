require 'page-object'
require 'watir'

class Home
  include PageObject
  div(:top_title, id: 'Row 0')
  link(:viewAdded, id: '0')
end
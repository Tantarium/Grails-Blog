require 'page-object'
require 'watir'

class Home
  include PageObject
  page_url "localhost:8080"
  div(:top_title, id: 'Row 0')
  link(:view, id: '0')

end
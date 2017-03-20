require 'page-object'
require 'watir'

class Home
  include PageObject
  page_url "localhost:8080"
  div(:top_title, id: 'Row 0')
  div(:top_date, id: 'date 0')
  div(:second_date, id: 'date 1')
  div(:third_date, id: 'date 2')
  div(:fourth_date, id: 'date 3')
  div(:fifth_date, id: 'date 4')
  div(:sixth_date, id: 'date 5')
  div(:seventh_date, id: 'date 6')
  div(:eighth_date, id: 'date 7')
  div(:ninth_date, id: 'date 8')
  div(:tenth_date, id: 'date 9')
  link(:view, id: '0')
end
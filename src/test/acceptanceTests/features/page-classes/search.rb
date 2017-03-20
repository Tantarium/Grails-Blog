require 'page-object'

class Search
  include PageObject
  text_field(:search, id: 'searchValue')
  button(:submit_click, id: 'submitButton')
  div(:title_of_top_result, id: 'title 0')
end
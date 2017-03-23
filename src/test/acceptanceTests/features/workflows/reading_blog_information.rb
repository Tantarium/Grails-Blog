require 'page-object'
require 'watir'
require_relative '../workflows/navigation'
include Navigation

module ReadingBlog
  include PageObject::PageFactory

  def get_title_off_page
    on_page(Home).top_title
  end

  def get_title_off_show_page
    on_page(ViewBlog).title
  end

  def create_ten_blog_posts
    for i in 0..9
      click_on_create_link
      add_title_and_text("Random Title of Blog #{random_string(5)}")
      click_on_create_button
      visit_page(Home)
    end
  end

  def clean_up_blogs_created
    for i in 0..9
      visit_page(Home)
      title = get_title_off_page
      @browser.div(:text => title).click
      on_page(ViewBlog).delete
      @browser.alert.ok
    end
  end

  def grab_ten_most_recent_blogs
    array_of_dates = [on_page(Home).top_date, on_page(Home).second_date, on_page(Home).third_date, on_page(Home).fourth_date,
            on_page(Home).fifth_date, on_page(Home).sixth_date, on_page(Home).seventh_date, on_page(Home).eighth_date,
            on_page(Home).ninth_date, on_page(Home).tenth_date]
  end

  def compare_dates(date1, date2)
    @string_return = 'false'
    year1 = date1[14..17].to_i
    month1 = date1[19..20].to_i
    day1 = date1[22..23].to_i
    hour1 = date1[25..26].to_i
    minute1 = date1[28..29].to_i
    second1 = date1[31..36].to_f

    year2 = date2[14..17].to_i
    month2 = date2[19..20].to_i
    day2 = date2[22..23].to_i
    hour2 = date2[25..26].to_i
    minute2 = date2[28..29].to_i
    second2 = date2[31..36].to_f

    if year1 > year2
      @string_return = 'true'
    elsif month1 > month2
      @string_return = 'true'
    elsif day1 > day2
      @string_return = 'true'
    elsif hour1 > hour2
      @string_return = 'true'
    elsif minute1 > minute2
      @string_return = 'true'
    elsif second1 > second2
      @string_return = 'true'
    end

    @string_return
  end

  def get_title_of_first_result
    on_page(Search).title_of_top_result
  end

  def add_comment_to_blog(name, text)
    on_page(ViewBlog) do |page|
      page.name = name
      page.comment = text
    end
    on_page(ViewBlog).save_comment
  end

  def name_of_commenter_off_page
    on_page(ViewBlog).first_commenter
  end

  def text_of_comment_off_page
    on_page(ViewBlog).first_commentText
  end
end
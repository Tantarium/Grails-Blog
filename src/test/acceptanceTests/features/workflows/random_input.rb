


module RandomInput

  def random_string(x)
    (0...x).map { (65 + rand(26)).chr.downcase }.join
  end

  def random_blog_text
    @string_to_return
    for i in 0..50
      @string_to_return = "#{@string_to_return} #{random_string(10)}"
    end
    @string_to_return
  end

  def random_comment_text
    @comment_text_to_return = 'Random Comment. Just fyi, I did not read this blog post.'
    for i in 0..10
      @comment_text_to_return = "#{@comment_text_to_return} #{random_string(5)}"
    end
    @comment_text_to_return = "#{@comment_text_to_return}."
    @comment_text_to_return
  end

end
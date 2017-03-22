


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

end
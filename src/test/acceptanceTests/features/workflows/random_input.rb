


module RandomInput

  def random_string(x)
    (0...x).map { (65 + rand(26)).chr }.join
  end

  def random_blog_text
    "#{random_string(50)} #{random_string(50)} #{random_string(50)} #{random_string(50)} #{random_string(50)}
    #{random_string(50)} #{random_string(50)} #{random_string(50)} #{random_string(50)} #{random_string(50)}"
  end

end
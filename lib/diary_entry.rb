class DiaryEntry
  def initialize(title,contents)
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_word
    return @contents.split(" ").length
  end

  def reading_time(wpm)
    return "#{(@contents.split(" ").length.to_f/wpm).round(1)} minutes"
  end

  def reading_chunk(wpm, minutes) 
    words_readable = wpm * minutes
    start_from = @furthest_word_read
    end_at = @furthest_word_read + words_readable
    word_list = words[start_from, end_at]
    if end_at >= count_word
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(" ")
  end

  private

  def words
    return @contents.split(" ")
  end

end
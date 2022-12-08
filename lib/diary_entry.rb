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
    @furthest_word_read = end_at
    return word_list.join(" ")
  end

  private

  def words
    return @contents.split(" ")
  end

    
    
    # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
  # Returns a string with a chunk of the contents that the user could read
  # in the given number of minutes.
  # If called again, `reading_chunk` should return the next chunk, skipping
  # what has already been read, until the contents is fully read.
  # The next call after that it should restart from the beginning.
end
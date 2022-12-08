require_relative '../lib/diary_entry'

describe "DiaryEntry Class" do
  it "returns content" do
    new_entry = DiaryEntry.new("Thursday 8th", "words of stuff")
    expect(new_entry.contents).to eq "words of stuff"
  end

  it "returns title" do
    new_title = DiaryEntry.new("Friday 9th", "entry 2")
    expect(new_title.title).to eq "Friday 9th"
  end

  it "returns the number of words in the contents as an int" do
    words = DiaryEntry.new("Word Count", "This is the sentence to count")
    expect(words.count_word).to eq 6
  end

  it "returns the reading time of the entry" do
    new_entry = DiaryEntry.new("WPM","How many words can you read per minute this should be taking longer I dont know why its not working?")
    expect(new_entry.reading_time(60)).to eq "0.3 minutes"
  end

  it "returns a string they can read with enough time given" do
   new_entry = DiaryEntry.new("Lorem", "One two three") 
   expect(new_entry.reading_chunk(2,1)).to eq "One two"
  end

  it "returns the next chunk next time it is called" do
    new_entry = DiaryEntry.new("Lorem", "One two three") 
    new_entry.reading_chunk(2,1)
    chunk = new_entry.reading_chunk(2,1)
   expect(chunk).to eq "three"
  end
end
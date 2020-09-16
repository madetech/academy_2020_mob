require_relative '../src/wordwrap'

describe "wordwrap" do
  
  it "has two arguments" do      
    expect(WordWrap.new).to respond_to(:wrap).with(2).argument
  end

  same_length_string = {
      "hello" => "hello",
      "oryeh" => "oryeh",
      "coffee" => "coffee"
    } 
  
  same_length_string.each do |string, output|
    it "doesn't wrap if line length is same as word length" do
      expect(WordWrap.new.wrap(string, string.length)).to eq(output)
    end
  end

  ## NB: The following test is implemented three times to compare different methods.
  
  two_words_string_01 = {
    "hello\nworld" => ["hello world", 5],
    "hello\nhello" => ["hello hello", 5],
    "coffee\ncoffee" => ["coffee coffee", 6]
  } 
  two_words_string_01.each do |output, input|
    it "wraps after space (v1)" do
      expect(WordWrap.new.wrap(input[0], input[1])).to eq(output)
    end
  end 

  two_words_string_02 = [
    ["hello world", 5, "hello\nworld"],
    ["hello hello", 5, "hello\nhello"],
    ["coffee coffee", 6, "coffee\ncoffee"]
  ] 
  two_words_string_02.each do |string_to_wrap, line_length, expected_output|
    it "wraps after space (v2)" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end 
  
  two_words_string_03 = {
    "hello world" => {:line_length => 5, :expected_output => "hello\nworld"},
    "hello hello" => {:line_length => 5, :expected_output => "hello\nhello"},
    "coffee coffee" => {:line_length => 6, :expected_output => "coffee\ncoffee"}
  } 
  two_words_string_03.each do |string_to_wrap, values|
    it "wraps after space (v3)" do
      expect(WordWrap.new.wrap(string_to_wrap, values[:line_length])).to eq(values[:expected_output])
    end
  end 

  two_words_string_04 = {
    {:string => 'hello world', :length: 5} => "hello\nworld",
    {:string => 'hello hello', :length 5} => "hello\nhello",
    {:string => 'coffee coffee', :length => 6} => "coffee\ncoffee",
  }
  two_words_string_04.each do |input, output|
    it "wraps after space (v4)" do
      expect(WordWrap.new.wrap(input[:string], input[:length])).to eq(output)
    end
  end

end
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
  
  two_words_string = [
    ["hello world", 5, "hello\nworld"],
    ["hello hello", 5, "hello\nhello"],
    ["coffee coffee", 6, "coffee\ncoffee"]
  ] 

  two_words_string.each do |string_to_wrap, line_length, expected_output|
    it "wraps after space" do
      expect(WordWrap.new.wrap(string_to_wrap, line_length)).to eq(expected_output)
    end
  end 

end
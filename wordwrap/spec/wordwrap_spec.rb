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
  
  two_words_string = {
    "hello world" => {:line_length => 5, :expected_output => "hello\nworld"},
    "hello hello" => {:line_length => 5, :expected_output => "hello\nhello"},
    "coffee coffee" => {:line_length => 6, :expected_output => "coffee\ncoffee"}
  } 

  two_words_string.each do |string_to_wrap, values|
    it "wraps after space" do
      expect(WordWrap.new.wrap(string_to_wrap, values[:line_length])).to eq(values[:expected_output])
    end
  end 

end
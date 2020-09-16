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
    "hello world" => "hello\nworld"
  } 

  two_words_string.each do |string, output|
    it "wraps after whitespace" do
      expect(WordWrap.new.wrap(string, 5)).to eq(output)
    end
  end 

end
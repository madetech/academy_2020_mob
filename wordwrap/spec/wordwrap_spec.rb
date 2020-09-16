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
    "hello\nworld" => ["hello world", 5],
    "hello\nhello" => ["hello hello", 5],
    "coffee\ncoffee" => ["coffee coffee", 6]
  } 

  two_words_string.each do |output, input|
    it "wraps after space" do
      expect(WordWrap.new.wrap(input[0], input[1])).to eq(output)
    end
  end 

end
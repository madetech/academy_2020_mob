
  
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
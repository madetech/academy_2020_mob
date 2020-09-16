require_relative '../src/wordwrap'

describe "wordwrap" do
  
  it "has two arguments" do      
    expect(WordWrap.new).to respond_to(:wrap).with(2).argument
  end

  it "doesn't wrap if line length is same as word length" do
    expect(WordWrap.new.wrap("Hello", 5)).to eq("Hello")
  end

  it "returns different words" do
    expect(WordWrap.new.wrap("oryeh", 5)).to eq("oryeh")
  end

end
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

  # expected_scores_no_spares_no_strikes = {
  #     "44 44 44 44 44 44 44 44 44 44" => 80,
  #     "44 44 44 44 44 44 44 44 44 44" => 80
  # }

  # expected_scores_no_spares_no_strikes.each do |rolls, score|
  #     it "adds rolls in '#{rolls}' to score #{score}, because all rolls knock some (but not all) pins down" do
  #         bowling = Bowling.new            
  #         expect(bowling.score(rolls)).to eq(score)
  #     end
  # end

end
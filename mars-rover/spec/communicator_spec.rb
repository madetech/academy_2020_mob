require_relative '../lib/communicator'
require_relative '../lib/grid'

describe Communicator do    
    context "#get_input" do
        it "outputs the specified input prompt" do
            # Arrange
            communicator = described_class.new
            EXPECTED_INPUT_PROMPT = "Give me some input pretty pls"

            # Act/Assert
            expect{communicator.get_input(EXPECTED_INPUT_PROMPT)}.to output(EXPECTED_INPUT_PROMPT).to_stdout
        end
        
        it "returns stdin" do
            # Arrange
            communicator = described_class.new
            EXPECTED_INPUT = "Here's my input thx bye"
            allow(communicator).to receive(:gets).and_return(EXPECTED_INPUT)

            # Act
            user_input = communicator.get_input("Give me input pls")

            # Assert
            expect(user_input).to eq(EXPECTED_INPUT)
        end

        bad_inputs = ["!", "*"] # plus a lot more examples of bad input
        
        bad_inputs.each do |bad_input|
            it "raises an exception when input is invalid: '#{bad_input}'" do
                # Arrange
                communicator = described_class.new
                allow(communicator).to receive(:gets).and_return(bad_input)
    
                # Act & Assert
                expect{communicator.get_input("Give me input pls")}.to raise_exception
            end
        end
    end
end
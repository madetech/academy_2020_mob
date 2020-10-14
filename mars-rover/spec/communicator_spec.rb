require_relative '../lib/communicator'
require_relative '../lib/grid'

describe Communicator do     
    context "#show_message" do
        it "outputs the specified message" do
            # Arrange
            communicator = described_class.new
            EXPECTED_MESSAGE = "Here is lots of useful information for the user."

            # Act/Assert
            expect{communicator.show_message(EXPECTED_MESSAGE)}.to output(a_string_starting_with(EXPECTED_MESSAGE)).to_stdout
        end
    end 

    context "#get_input" do
        it "outputs the specified input prompt" do
            # Arrange
            communicator = described_class.new
            EXPECTED_INPUT_PROMPT = "Give me some input pretty pls"
            allow(communicator).to receive(:gets).and_return("Some input") 

            # Act/Assert
            expect{communicator.get_input(EXPECTED_INPUT_PROMPT)}.to output(a_string_starting_with(EXPECTED_INPUT_PROMPT)).to_stdout
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
            xit "raises an exception when input is invalid: '#{bad_input}'" do
                # Arrange
                communicator = described_class.new
                allow(communicator).to receive(:gets).and_return(bad_input)
    
                # Act & Assert
                expect{communicator.get_input("Give me input pls")}.to raise_exception
            end
        end
    end
end
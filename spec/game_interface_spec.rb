require 'game_interface'
require 'pry'

RSpec.describe GameInterface do
  let(:game_interface) { GameInterface.new }

  before { allow(game_interface).to receive(:gets).and_return(option) }

  describe 'valid options' do
    context "when entered option is 0" do
      let(:option) { "0" }

      it 'returns nil and exit the program' do
        expect(game_interface.select_option).to eq(nil)
      end
    end

    context "when entered option is 1" do
      let(:option) { "1" }

      it 'starts the game' do
        expect(Game).to receive(:setup)

        game_interface.select_option
      end
    end

    context "when entered option is 2" do
      let(:option) { "2" }

      it 'show statistics' do
        expect(Statistics).to receive(:show)
        
        game_interface.select_option
      end
    end

    context "when entered option is 3" do
      let(:option) { "3" }

      it 'starts the game' do
        expect(Credits).to receive(:show)
        
        game_interface.select_option
      end
    end    
  end

  shared_examples "invalid user input" do
    it 'prints an error message and retries' do
      output = /Selected option is invalid, valid options are 0, 1, 2, 3\nYou have \d+ attempts left/

      expect { game_interface.select_option }.to output(output).to_stdout
    end
  end

  describe 'invalid options' do
    context "when option is empty" do
      let(:option) { "" }

      it_behaves_like "invalid user input"
    end

    context "when option is outside the range" do
      let(:option) { "9" }

      it_behaves_like "invalid user input"
    end

    context "when option is not a number" do
      let(:option) { "gg" }

      it_behaves_like "invalid user input"
    end
  end
end
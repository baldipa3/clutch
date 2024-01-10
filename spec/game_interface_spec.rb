require 'game_interface'
require 'pry'

RSpec.describe GameInterface do
  context 'valid options' do
  end

  context 'invalid options' do
    let(:game_interface) { GameInterface.new }

    before { allow_any_instance_of(GameInterface).to receive(:gets).and_return(option) }

    context "when option is nil" do
      let(:option) { nil }
      
      it '' do
        binding.pry
      end
    end

    context "when option is outside the range" do
    end

    context "when option is not a number" do
    end
  end
end

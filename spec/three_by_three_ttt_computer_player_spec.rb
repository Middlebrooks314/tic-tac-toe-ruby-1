require_relative '../lib/three_by_three_ttt_computer_player.rb'
require_relative '../lib/player.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe ThreeByThreeTTTComputerPlayer do

  let(:computer_player) { ThreeByThreeTTTComputerPlayer.new }

  it "is a subclass of the Player class" do
    expect(ThreeByThreeTTTComputerPlayer.superclass).to eq(Player)
  end

  describe "#make_selection(board)" do
    it "selects the first box of the board when passed a board array with all empty boxes" do
      board = ThreeByThreeTTTBoard.new
      expect(computer_player.make_selection(board)).to eq(1)
    end

    it "selects the first empty box of the board when passed a board array with some moves made already" do 
      board = ThreeByThreeTTTBoard.new(["X", "O", " ", " ", " ", " ", " ", " ", " "])
      expect(computer_player.make_selection(board)).to eq(3)
    end
  end
 end

require_relative '../lib/three_by_three_ttt_user_view.rb'
require_relative '../lib/three_by_three_ttt_board.rb'

describe "ThreeByThreeTTTUserView" do 

  let(:user_view) { ThreeByThreeTTTUserView.new }

  describe "#welcome" do
    it "is a string with a welcome message" do
      expected_message = <<~MESSAGE
        
        Welcome to Tic Tac Toe!

        MESSAGE
      
      expect(user_view.welcome).to eq(expected_message)
    end
  end

  describe "#instructions" do
    it "is a string with instructions" do 
      expected_message = <<~MESSAGE
        
        Instructions: 

        There are two players. 
        Player 1's marker is "X" and Player 2's marker is "O".  
        Players take turns selecting empty boxes on a board.
        A player wins by filling a row, column, or diagonal on
        the board with only that player's marker.
        If all boxes on the board are filled without a win, 
        the game is a tie.
        
        A player selects a box by picking a number corresponding
        to that box, as indicated on the board below:

          1 | 2 | 3 
         -----------
          4 | 5 | 6
         -----------
          7 | 8 | 9
    
      MESSAGE
      
      expect(user_view.instructions).to eq(expected_message)
    end
  end

  describe "#board_with_numbers" do
    it "is a string displaying the board with numbers each box" do
      expected_message = <<~MESSAGE

        1 | 2 | 3 
       -----------
        4 | 5 | 6
       -----------
        7 | 8 | 9
    
      MESSAGE

      expect(user_view.board_with_numbers).to eq(expected_message)
    end
  end

  describe "#current_board" do
    it "is a string representing the current state of the board" do
      board = ThreeByThreeTTTBoard.new(["X", " ", " ", " ", "X", " ", " ", " ", " "])
      expected_message = <<~MESSAGE

        X |   |  
       -----------
          | X |  
       -----------
          |   |  
    
      MESSAGE

      expect(user_view.current_board(board)).to eq(expected_message)
    end
  end

  describe "#user_selection_error" do
    it "is a string with a generic error message" do
      expected_message = <<~MESSAGE 

        Sorry, invalid selection.

      MESSAGE
      
      expect(user_view.user_selection_error).to eq(expected_message)
    end
  end

  describe "#request_user_select_box" do
    it "is a string with a message for the current player to select a box" do
      player = double
      allow(player).to receive(:name).and_return("Bob")
      expected_message = <<~MESSAGE 

        Bob, please select a box and hit return.

      MESSAGE
      expect(user_view.request_user_select_box(player)).to eq(expected_message)
    end
  end

  describe "#move_confirmation" do
    it "is a string with a message describing the player's move" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph has selected box 5.

      MESSAGE
    
      expect(user_view.move_confirmation(player, "5")).to eq(expected_message)
    end
  end

  describe "#game_won_by" do
    it "is a string with a message that the winning player won the game" do
      player = double
      allow(player).to receive(:name).and_return("Ralph")
      expected_message = <<~MESSAGE 

        Ralph wins!

        Thanks for playing!

      MESSAGE
    
      expect(user_view.game_won_by(player)).to eq(expected_message)
    end
  end

  describe "#game_tied" do
    it "is a string with a message that the game ended in a tie" do
      expected_message = <<~MESSAGE 

        Tie game!

        Thanks for playing!

      MESSAGE
      expect(user_view.game_tied).to eq(expected_message)
    end
  end

  describe "#request_user_play_again" do
    it "is a string asking the user to play again" do
      expected_message = <<~MESSAGE

        Would you like to play again? Type 'y' or 'Y' and hit return if so.

      MESSAGE
      expect(user_view.request_user_play_again).to eq(expected_message)
    end
  end

  describe "#good_bye" do 
    it "is a string with a message bidding the user farewell" do
      expected_message = <<~MESSAGE

        Thanks for playing! Good bye!

      MESSAGE
      expect(user_view.good_bye).to eq(expected_message)
    end
  end
end

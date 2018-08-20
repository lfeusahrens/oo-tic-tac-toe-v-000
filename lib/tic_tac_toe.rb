class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,4,6],
  [2,5,8],
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    elsif @board[index] == " " || "" || nil
      false
    end
  end 
 
  def valid_move?(index)
    position_taken?(index) && index.between?(0, 8)
  end

 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def won?(board)
    
    WIN_COMBINATIONS.detect do |combos|
      board[combos[0]] == board[combos[1]] && board[combos[2]] == board[combos[1]] && position_taken?(board, combos[0])
    end
  end
  
  def full?(board)
    board.all? {|token| token == "X" || token == "O"}
  end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(board)
    draw?(board) || won?(board)
  end
  
  def winner(board)
    winner = won?(board)
    
    if winner 
      index = winner[0]
      board[index]
      
    else
      nil
    end
  end 

  def play(board)
    until over?(board)
      turn(board)
    end
 
    if won?(board)
      puts "Congratulations #{winner(board) + "!"}"
    else draw?(board)
      puts "Cat's Game!"
    end
  end
  
end
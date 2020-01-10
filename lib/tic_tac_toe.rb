class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    board = self.board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    self.board[index] = current_player
  end

  def position_taken?(index)
    !(self.board[index].nil? || self.board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index)
  end

  def turn_count
    turn = 0
    self.board.each do |spot|
      if spot != " " && spot != "" && spot != nil
        turn += 1
      end
    end
    turn
  end

  def current_player
    turn  = self.turn_count
    if turn % 2  == 0 #is even
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
    else
      self.turn
    end
  end

end

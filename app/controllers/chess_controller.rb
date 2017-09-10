class ChessController < Sinatra::Base

  class Game

    def self.init
      @@board = Chessboard.new
    end

    def self.board
      # 1 pawn
      # 2 knight
      # 3 bishop
      # 4 rook
      # 5 queen
      # 6 king
      # negative - black
      # positive - white
      @@board.board.map do |row|
        row.map do |piece|
          to_unicode(class_to_i(piece) * color_to_sign(piece))
        end
      end
    end

    def self.delete(row, col)
      @@board.board[row][col] = nil
    end

    private
    def self.to_unicode(piece_code)
      case piece_code
      when 1
        "\u2659"
      when 2
        "\u2658"
      when 3
        "\u2657"
      when 4
        "\u2656"
      when 5
        "\u2655"
      when 6
        "\u2654"
      when -1
        "\u265F"
      when -2
        "\u265E"
      when -3
        "\u265D"
      when -4
        "\u265C"
      when -5
        "\u265B"
      when -6
        "\u265A"
      else
        " "
      end
    end

    def self.class_to_i(piece)
      case piece.class.to_s
      when "Pawn"
        1
      when "Knight"
        2
      when "Bishop"
        3
      when "Rook"
        4
      when "Queen"
        5
      when "King"
        6
      else
        0
      end
    end

    def self.color_to_sign(piece)
      if piece == nil
        0
      elsif piece.color == "black"
        -1
      elsif piece.color == "white"
        1
      end
    end
  end



  configure do
    Game::init()
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/board/:row/:col" do
    Game.delete(params[:row].to_i, params[:col].to_i)
    binding.pry
    redirect "/board"
  end

  get "/board" do
    binding.pry
    @board = Game.board
    erb :"board.html"
  end

  get "/game" do
    redirect "/board"
  end

  get "/start" do
    erb :"start.html"
  end

  get "/" do
    redirect "/start"
  end
end

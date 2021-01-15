############################################
############## TIC TAC TOE #################
############################################

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
temp_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
counter = 0
is_x = false
is_o = false

def draw_board(board,temp_board)
  puts "Numbers are the positions"
  puts "| #{temp_board[0]} | #{temp_board[1]} | #{temp_board[2]} | "
  puts "-------------"
  puts "| #{temp_board[3]} | #{temp_board[4]} | #{temp_board[5]} |"
  puts "-------------"
  puts "| #{temp_board[6]} | #{temp_board[7]} | #{temp_board[8]} |"

  puts
  puts
  14.times{print "-"}
  puts
  puts

  puts "| #{board[0]} | #{board[1]} | #{board[2]} | "
  puts "-------------"
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts "-------------"
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
end

def check_winner(board, counter)
  #first check the diagonals for X
  if(board[0] == "X" && board[4] == "X" && board[8] == "X")
    return "X is your winner!"
  elsif(board[2] == "X" && board[4] == "X" && board[6] == "X")
    return "X is your winner!"
    #check horizontal for X
  elsif(board[0] == "X" && board[1] == "X" && board[2] == "X")
    return "X is your winner!"
  elsif(board[3] == "X" && board[4] == "X" && board[5] == "X")
    return "X is your winner!"
  elsif(board[6] == "X" && board[7] == "X" && board[8] == "X")
    return "X is your winner!"
    #check vertical for X
  elsif(board[0] == "X" && board[3] == "X" && board[6] == "X")
    return "X is your winner!"
  elsif(board[1] == "X" && board[4] == "X" && board[7] == "X")
    return "X is your winner!"
  elsif(board[2] == "X" && board[5] == "X" && board[8] == "X")
    return "X is your winner!"

    ###check for O
  elsif(board[0] == "O" && board[4] == "O" && board[8] == "O")
    return "O is your winner!"
  elsif(board[2] == "O" && board[4] == "O" && board[6] == "O")
    return "O is your winner!"
    #check horizontal for O
  elsif(board[0] == "O" && board[1] == "O" && board[2] == "O")
    return "O is your winner!"
  elsif(board[3] == "O" && board[4] == "O" && board[5] == "O")
    return "O is your winner!"
  elsif(board[6] == "O" && board[7] == "O" && board[8] == "O")
    return "O is your winner!"
    #check vertical for O
  elsif(board[0] == "O" && board[3] == "O" && board[6] == "O")
    return "O is your winner!"
  elsif(board[1] == "O" && board[4] == "O" && board[7] == "O")
    return "O is your winner!"
  elsif(board[2] == "O" && board[5] == "O" && board[8] == "O")
    return "O is your winner!"
  elsif(counter == 9)
    return "It is a tie!"
  end
end

def check_if_winner(board, counter)
  #first check the diagonals for X
  if(board[0] == "X" && board[4] == "X" && board[8] == "X")
    return true
  elsif(board[2] == "X" && board[4] == "X" && board[6] == "X")
    return true
    #check horizontal for X
  elsif(board[0] == "X" && board[1] == "X" && board[2] == "X")
    return true
  elsif(board[3] == "X" && board[4] == "X" && board[5] == "X")
    return true
  elsif(board[6] == "X" && board[7] == "X" && board[8] == "X")
    return true
    #check vertical for X
  elsif(board[0] == "X" && board[3] == "X" && board[6] == "X")
    return true
  elsif(board[1] == "X" && board[4] == "X" && board[7] == "X")
    return true
  elsif(board[2] == "X" && board[5] == "X" && board[8] == "X")
    return true

    ###check for O
  elsif(board[0] == "O" && board[4] == "O" && board[8] == "O")
    return true
  elsif(board[2] == "O" && board[4] == "O" && board[6] == "O")
    return true
    #check horizontal for O
  elsif(board[0] == "O" && board[1] == "O" && board[2] == "O")
    return true
  elsif(board[3] == "O" && board[4] == "O" && board[5] == "O")
    return true
  elsif(board[6] == "O" && board[7] == "O" && board[8] == "O")
    return true
    #check vertical for O
  elsif(board[0] == "O" && board[3] == "O" && board[6] == "O")
    return true
  elsif(board[1] == "O" && board[4] == "O" && board[7] == "O")
    return true
  elsif(board[2] == "O" && board[5] == "O" && board[8] == "O")
  return true
  elsif(counter == 9)
  return true
else
  return false
  end
end

def tic_toe(board, counter, temp_board)
  #For Start of Game Only
  while(check_if_winner(board, counter) == false)
    draw_board(board,temp_board)
    print "Player one go first: " if counter == 0
    if(counter == 0)
      is_x = true
      decision = gets.chomp
      while(decision != "1" && decision != "2" && decision != "3" && decision != "4" && decision != "5" && decision != "6" && decision != "7" && decision != "8" && decision != "9")
        puts "Invalid Input, try again: "
        decision = gets.chomp
      end
      decision = decision.to_i-1
      board[decision] = "X"
      counter += 1
      if(check_if_winner(board, counter) == true)
        answer = check_winner(board, counter)
        return answer
      end

      system("cls")

    elsif(is_x == true)
      print "Player two turn: "
      is_x = false
      is_o = true
      decision = gets.chomp
      while(decision != "1" && decision != "2" && decision != "3" && decision != "4" && decision != "5" && decision != "6" && decision != "7" && decision != "8" && decision != "9" && counter <= 9)
        puts "Invalid Input"
        decision = gets.chomp
      end
      decision = decision.to_i-1

      ##incase space is occupied
      while(board[decision] != " " && counter <= 9)
        puts "Space already occupied please try again"
        decision = gets.chomp
        while(decision != "1" && decision != "2" && decision != "3" && decision != "4" && decision != "5" && decision != "6" && decision != "7" && decision != "8" && decision != "9" && counter <= 9)
          puts "Invalid Input"
          decision = gets.chomp
        end
        decision = decision.to_i-1
      end
      board[decision] = "O"
      counter += 1
      if(check_if_winner(board, counter) == true)
        answer = check_winner(board, counter)
        return answer
      end
      system("cls")

    elsif(is_o == true)
      print "Player one turn: "
      is_x = true
      is_o = false
      decision = gets.chomp
      while(decision != "1" && decision != "2" && decision != "3" && decision != "4" && decision != "5" && decision != "6" && decision != "7" && decision != "8" && decision != "9" && counter <= 9)
        puts "Invalid Input"
        decision = gets.chomp
      end
      decision = decision.to_i-1

      ##incase space is occupied
      while(board[decision] != " " && counter <= 9)
        puts "Space already occupied please try again"
        decision = gets.chomp
        while(decision != "1" && decision != "2" && decision != "3" && decision != "4" && decision != "5" && decision != "6" && decision != "7" && decision != "8" && decision != "9" && counter <= 9)
          puts "Invalid Input"
          decsion = gets.chomp
        end
        decision = decision.to_i-1
      end
      board[decision] = "X"

      counter += 1
      if(check_if_winner(board, counter) == true)
        answer = check_winner(board, counter)
        return answer
      end
      system("cls")
    end
    puts counter
  end
end

  system("cls")
  answer = tic_toe(board, counter, temp_board)
  system("cls")
  draw_board(board,temp_board)
  puts 
  puts answer

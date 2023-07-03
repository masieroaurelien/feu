# Sudoku

#Créez un programme qui trouve et affiche la solution d’un Sudoku.

def solve_sudoku(board)
  return true if solved?(board)

  row, col = find_empty_cell(board)

  (1..9).each do |num|
    if valid_move?(board, row, col, num)
      board[row][col] = num.to_s

      if solve_sudoku(board)
        return true
      else
        board[row][col] = '.' # Effacer la valeur et essayer une autre possibilité
      end
    end
  end

  false # Aucune solution trouvée
end

def solved?(board)
  (0..8).each do |row|
    (0..8).each do |col|
      return false if board[row][col] == '.'
    end
  end
  true
end

def find_empty_cell(board)
  (0..8).each do |row|
    (0..8).each do |col|
      return [row, col] if board[row][col] == '.'
    end
  end
  nil
end

def valid_move?(board, row, col, num)
  return false if used_in_row?(board, row, num)
  return false if used_in_col?(board, col, num)
  return false if used_in_box?(board, row - (row % 3), col - (col % 3), num)
  true
end

def used_in_row?(board, row, num)
  (0..8).each do |col|
    return true if board[row][col] == num.to_s
  end
  false
end

def used_in_col?(board, col, num)
  (0..8).each do |row|
    return true if board[row][col] == num.to_s
  end
  false
end

def used_in_box?(board, start_row, start_col, num)
  (0..2).each do |row|
    (0..2).each do |col|
      return true if board[row + start_row][col + start_col] == num.to_s
    end
  end
  false
end

def print_board(board)
  board.each { |row| puts row }
end

# Lire le contenu du fichier Sudoku
sudoku_file = ARGV[0]
board = File.readlines(sudoku_file).map(&:chomp)

# Résoudre le Sudoku
solve_sudoku(board)

# Afficher la solution
puts "Solution :"
print_board(board)

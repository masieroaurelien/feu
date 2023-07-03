# Trouver une forme

# Créez un programme qui affiche la position de l’élément le plus en haut à gauche (dans l’ordre) d’une forme au sein d’un plateau.

def find_shape(board_file, shape_file)
  # Lire le contenu du plateau et de la forme à partir des fichiers
  board = File.readlines(board_file).map(&:chomp)
  shape = File.readlines(shape_file).map(&:chomp)

  # Obtenir les dimensions du plateau et de la forme
  board_rows = board.length
  board_cols = board[0].length
  shape_rows = shape.length
  shape_cols = shape[0].length

  # Parcourir chaque cellule du plateau pour trouver la forme
  (0..(board_rows - shape_rows)).each do |row|
    (0..(board_cols - shape_cols)).each do |col|
      found = true

      # Vérifier si la forme correspond aux cellules du plateau
      (0...shape_rows).each do |i|
        (0...shape_cols).each do |j|
          if shape[i][j] != ' ' && shape[i][j] != board[row + i][col + j]
            found = false
            break
          end
        end
        break unless found
      end

      # Si la forme est trouvée, afficher les coordonnées et retourner
      if found
        puts "Trouvé ! (entièrement avec chatGPT)"
        puts "Coordonnées : #{row + 1},#{col + 1}"

        (0...shape_rows).each do |i|
          (0...shape_cols).each do |j|
            print shape[i][j] != ' ' ? shape[i][j] : '-'
          end
          puts
        end
        return
      end
    end
  end

  # Si la forme n'est pas trouvée, afficher un message correspondant
  puts "Introuvable"
end


# Appel de la fonction avec les noms des fichiers en argument
find_shape("board.txt", "to_find.txt")

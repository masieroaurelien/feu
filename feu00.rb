# Echauffement

#Créez un programme qui affiche un rectangle dans le terminal.

def draw_rectangle(width, height)
  if width <= 0 || height <= 0
    puts "Les dimensions doivent être supérieures à zéro."
    return
  end

  horizontal_line = "o" + "-" * (width - 2) + "o"
  vertical_line = "|" + " " * (width - 2) + "|"

  puts horizontal_line
  (height - 2).times { puts vertical_line }
  puts horizontal_line
end

if ARGV.length != 2
  puts "Erreur : nombre d'arguments incorrect."
  puts "Utilisez : ruby feu00.rb <largeur> <hauteur>"
  exit
end

width = ARGV[0].to_i
height = ARGV[1].to_i

draw_rectangle(width, height)

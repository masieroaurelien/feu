# Évaluer une expression

#Créez un programme qui reçoit une expression arithmétique dans une chaîne de caractères et en retourne le résultat après l’avoir calculé.

#Vous devez gérer les 5 opérateurs suivants : “+” pour l’addition, “-” pour la soustraction, “*” la multiplication, “/” la division et “%” le modulo.

def evaluate_expression(expression)
  # Supprimer les espaces en trop dans l'expression
  expression = expression.gsub(/\s+/, "")

  result = eval(expression)

  puts result
end

if ARGV.length != 1
  puts "Erreur : nombre d'arguments incorrect."
  exit
end

expression = ARGV[0]

# Évaluer l'expression et afficher le résultat
evaluate_expression(expression)

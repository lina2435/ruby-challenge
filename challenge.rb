# Supón que existe una forma secreta de ordenar las 26 letras del abecedario inglés,
# y de asignar un valor numérico a cada una dependiendo del lugar en que se encuentre.
# Siendo 26 las letras del abecedario inglés
# (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z),
# el puntaje de cada letra puede ir de 1 a 26.
# En el caso de una palabra, su puntaje es la suma del puntaje de todas sus letras.
# Por ejemplo, si el orden fuera el abecedario al revés, la Z valdría 26 y la A valdría 1.
# En ese caso, el valor de la palabra "ZA" sería Z(26) + A(1) = 27, y el valor de la palabra
# "ZAA" sería Z(26) + A(1)+ A(1) = 28.
# Tú no conoces el orden secreto, y por lo tanto, tampoco el puntaje de cada letra.
# Crea un programa que diga cuál es el máximo valor que podría tener una palabra.

# Toma en cuenta:
# - El sistema puede estar programado en el lenguaje y framework que quieras.
# Puede ser una aplicación de consola o terminal, una aplicación web, una app de escritorio, o una app móvil.
# - No es necesario que gastes tiempo haciendo que la UI sea bonita (si tuviese UI).
# - Sólo lo probaré con palabras escritas las mayúsculas listadas arriba,
# sin espacios, números, acentos, ni otros caracteres especiales.

# letras = ["A","B","C","D","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

# Ejemplos:
# A = 26
# AB = 51
# YZ = 51
# EEOOO = 128
# EOEOO = 128
# AGENDAPRO = 206
# FERROCARRIL = 258
# lo que busca el ejer es encontrar el valor maximo de cada palabra indiferente de que
# que posicion se encuentre en el alfabeto
# lo que importa es otorgar el valor maximo a la letra que mas se repite.

puts "ingrese palabra"
palabra = gets.chomp


letras = palabra.split("")
letras = letras
  .group_by{|i|i}
  .entries
  .sort_by{|i| i[1].size}
  .reverse
  .map{|i| i[0]}

# puts letras
max_valor = 26
hash_letras = {}

letras.each do |letra|
  letra_valor = max_valor
  hash_letras[letra]= letra_valor
  max_valor = max_valor-1
end

acumulador = 0

palabra.split("").each do |letra|
  acumulador = (acumulador + hash_letras[letra])
end
# puts hash_letras
puts acumulador

# Collections recap

# 1. *Arrays*

# Create
beatles = ["John", "Paul", "George", "Ringos"]
# also Array.new to create an empty one (less common)

# Read
puts beatles[0] # => John
puts beatles[1] # => Paul
puts beatles[5] # => nil, because it doesn't exist!
# or in a loop:
beatles.each { |beatle| puts beatle }

# Update
beatles[3] = "Ringo"

# Delete
beatles.delete_at(2)
puts beatles

# 2. *Hashes*

# Create
beatles = {
  "singer" => "John",
  "guitarist" => "Paul",
  "bassist" => "George",
  "drummer" => "Ringos"
}
# also Hash.new to create an empty hash (less common)

# Read
puts beatles["singer"]
puts beatles["guitarist"]
puts beatles["pianist"] # => nil, because it doesn't exist! I could specify a different default value when I create the hash just if I use Hash.new("a default value")
# or in a loop:
beatles.each do |role, name|
  puts "The #{role} is #{name}"
end

# Update
beatles["drummer"] = "Ringo"

# Delete
beatles.delete("bassist")
puts beatles

##############################

# *Symbols*
# just another data type, used mainly to "label" something (so perfect for hash keys!)

my_symbol = :gabriele
puts my_symbol
puts my_symbol.class # => Symbol

# Convert strings to symbols
names = ["gabriele", "mariana", "shannon"]
names.each do |name|
  puts name.to_sym
end

# Let's refactor the beatles!

# Create
beatles = {
  singer: "John",
  guitarist: "Paul",
  bassist: "George",
  drummer: "Ringos"
}

# Read
puts beatles[:singer]
beatles.each do |role, name|
  puts "The #{role} is #{name}"
end

# Update
beatles[:drummer] = "Ringo"

# Delete
beatles.delete(:bassist)
puts beatles

#############################

# Bonus: the select/filter method (different name, same method!)
# use it to filter records from a collection

# With an array
numbers = [-12, 334, 0, 31, -91, -11, 28]
positive_numbers = numbers.filter { |n| n > 0 }
puts positive_numbers

# With an hash
movie_ratings = {
  pulp_fiction: 5,
  memento: 4.5,
  parasite: 4,
  the_matrix: 4.5,
  truman_show: 4,
  full_metal_jacket: 5
}
my_top_movies = movie_ratings.filter { |movie, rating| rating == 5 }
puts my_top_movies

#################################

# Other hash methods
# there are a lot of powerful methods for hashes! Check them all on ruby-doc.org

movie_ratings = {
  pulp_fiction: 5,
  memento: 4.5,
  parasite: 4,
  the_matrix: 4.5,
  truman_show: 4,
  full_metal_jacket: 5
}

# Loop through the keys
movie_ratings.each_key do |movie|
  puts movie
end
# same as
movie_ratings.keys.each do |movie|
  puts movie
end

# Loop through the
movie_ratings.each_value do |rating|
  puts rating
end
# same as
movie_ratings.values.each do |rating|
  puts rating
end



# CLASE  -------------------------

=begin
# Array
array = Array.new
array = ["nico", "santi"]
# INDEX    0        1

# CRUD -> ARRAY
  # C: CREATE (CREAR / AGREGAR)
  array.push("fer")
  array << "fer"
  # R: READ (LEER / ACCEDER)
  array[0] # => "nico"
  # U: UPDATE (ACTUALIZAR / MODIFICAR)
  array[0] = "NICO"
  # D: DELETE (BORRAR / ELIMINAR)
  array.delete_at(0) # => Elimina a "NICO"
  array.delete("nico") # => Elimina todos los elementos que sean ese valor

hash = {}
hash = Hash.new

# No hay INDICE, pero tenemos CLAVES
# Las CLAVES son UNICAS
# SIEMRPE, SIEMPRE va de a PARES

# CRUD -> HASH
  # C: CREATE (CREAR / AGREGAR)
  hash["pizza"] = 150
  # => {"pizza" => 150}
  # U: UPDATE (ACTUALIZAR / MODIFICAR)
  hash["pizza"] = 180
  # R: READ (LEER / ACCEDER)
  hash["pizza"] # => valor (150)
  # D: DELETE (BORRAR / ELIMINAR)
  hash.delete("pizza")

# SYMBOL
  array_hash = [
    {
      name: "Nicolas",
      last_name: "Kennedy",
      fan: "Independiente"
    },
    {
      name: "Fer",
      last_name: "Jacquier",
      fan: "Racing"
    }
  ]
puts "Ingrese su nombre:"
name = gets.chomp
array_hash << { name: name, last_name: }


hash = {
  "pizza" => 12
}

puts "Ingrese ingrediente:"
ingredient = gets.chomp
puts "Ingrese valor:"
price = gets.chomp

hash[ingredient] = price

puts "Que ingrediente quiere consultar"
answer = gets.chomp
hash[answer]
=end

=begin
array_hash.each do |person|
  # person => {:name=>"Nicolas", :last_name=>"Kennedy", :fan=>"Independiente"}
  # person[:name]
  # person[:fan]
end
=end

# ARRAY


=begin
array.each do |element|
  element
end

hash = { name: "Nico", last_name: "Kennedy"}

hash.each do |key, value|
  # p pair  # => [key, value]
  # puts key   # => 1: name / 2: last_name
  # puts value # => 1: "Nico" / 2: "Kennedy"
end
=end

=begin
array = [1, 3, -20, -25, 30]

new_array = array.filter do |number|
  # condition? true o false
  number.positive?
end

p new_array
=end

=begin
movie_ratings = {
  pulp_fiction: 5,
  memento: 4.5,
  parasite: 4,
  the_matrix: 4.5,
  truman_show: 4,
  full_metal_jacket: 5
}

# five_stars = movie_ratings.select {|movie, star| star == 5 }
=end

=begin
student = {:name=>"Nicolas", :last_name=>"Kennedy", :fan=>"Independiente"}
p student.values
=end

=begin
hash = Hash.new(0)
hash["nico"] = 0
hash["nico"] = hash["nico"] + 1
# hash["nico"] += 1
p hash
hash["santi"] = hash["santi"] + 1
p hash
=end

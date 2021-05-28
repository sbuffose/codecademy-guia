# *One-line conditions*
# use them *only* when you have one condition (and no `elsif` or `else`)

# 1. One-line if statement

names = ["gabriele", "mariana", "shannon"]

if names.include?("shannon")
  puts "Shannon is with us today!"
end
# will become
puts "Shannon is with us today!" if names.include?("shannon")

# 2. One-line unless statement

movies = {
  pulp_fiction: 5,
  memento: 4
}

unless movies[:pulp_fiction] != 5
  puts "Pulp Fiction is a top movie!"
end
# will become
puts "Pulp Fiction is a top movie!" unless movies[:pulp_fiction] != 5

##################

# *Ternary operator* (one line if-else statement)
# also here use it *only* when you have one if and one else condition!

names = ["gabriele", "mariana", "shannon"]

if names.include?("shannon")
  puts "Shannon is with us today!"
else
  puts "Shannon is always too busy :("
end
# will become
puts names.include?("shannon") ? "Shannon is with us today!" : "Shannon is always too busy :("

###################

# *Case statement* (a.k.a switch statement)
# use it when you have a lot of elsif conditions!

puts "Where are you from?"
country = gets.chomp

if country == "England"
  puts "Hello!"
elsif country == "Italy"
  puts "Ciao!"
elsif country == "Portugal"
  puts "Olá!"
elsif country == "Germany"
  puts "Halo!"
else
  puts "👋"
end
# will become
case country
  when "England"
    puts "Hello!"
  when "Italy"
    puts "Ciao!"
  when "Portugal"
    puts "Olà!"
  when "Germany"
    puts "Halo!"
  else
    puts "👋"
end
# or, even shorter:
case country
  when "England" then puts "Hello!"
  when "Italy" then puts "Ciao!"
  when "Portugal" then puts "Olà!"
  when "Germany" then puts "Halo!"
  else puts "👋"
end

#################

# *Conditional assignment*
# you assign a variable *only* if the variable is not already defined

beatles = {
  singer: "John",
  guitarist: "Paul",
  bassist: "George",
}

beatles[:singer] ||= "Mick" # will not be assigned here! The singer already exists
beatles[:drummer] ||= "Ringo" # it will assign it here, because the drummer doesn't exist yet!

beatles.each do |role, name|
  puts "#{name} is the #{role}"
end

##################

# *Implicit return*
# never use the return keyword to return the last line of your method (the return is automatic!)

def reverse_and_upcase_name(name)
  reversed_name = name.reverse
  reversed_name.upcase # no return here!
end

my_name = reverse_and_upcase_name("gabriele")
puts my_name

##################

# *One-line blocks*

# Ranges and arrays
numbers = (1..100).to_a # `1..100` is a range, `to_a` makes it an array with all the elements in that range!
# other ways:
numbers = 1.upto(100).to_a
numbers = 100.downto(1).to_a
# also with letters!
letters = "G".upto("Z").to_a

numbers.each do |n|
  if n % 2 == 0
    puts n
  end
end
# will become
numbers.each { |n| puts n if n % 2 == 0 }

#######################

# *Other methods*

# `respond_to?`
# use it to check if a method can be applied on a specific element (not very common, just test the method manually!)
[1, 2, 3].respond_to?(:push) # => true, I can apply `push` on an array
[1, 2, 3].respond_to?(:to_sym) # => false, `to_sym` can't be applied on an array
"hello".respond_to?(:reverse) # => true
"hello".respond_to?(:delete_at) # => false

# The `<<` operator
# on an array:
array = [1, 2, 3]
array.push(4)
array << 5 # same as `array.push(5)`
puts array
# on a string:
string = "hello"
string += " there!"
string << " how are you doing?" # same as `string += " how are you doing?"`
puts string

# Interpolation (we already know it!)
name = "gabriele"
puts "My name reversed is " + name.reverse # DON'T use this, use interpolation!
puts "My name reversed is #{name.reverse}"

# `times`
# use it to repeating something n times
3.times { puts "I'm a refactoring master!" }


# staff = %w(nico santi fer)

# STANDARD
=begin
if staff.include?("feli")
  puts "feli esta en la clase!"
  puts "otra coas"
  puts "otra"
end

# INLINE IF
# do_something if condition
puts "feli esta no en la clase!" if !staff.include?("feli")
puts "feli esta no en la clase!" unless staff.include?("feli")

# TERNARY
if condition
  puts "somthing if true"
  puts "otra coas"
else
  puts "somthing if false/nil"
end
=end

=begin
number = 3
puts number.even? ? "es verdadero" : "es false"
=end

=begin
hash = {
  name: "nico",
  apellido: "kennedy",
  club: "independiente"
}

hash[:club] ||= "racing"
p hash

teacher = ""
teacher ||= "feli"
puts teacher

puts "¿De donde sos?"
answer = gets.chomp

if answer == "argentina"
  puts "Bienvenido!"
elsif answer == "eeuu"
  puts "Welcome!"
elsif answer == "francia"
  puts "Bonjour!"
else
  puts "Ciao"
end

case answer
when "argentina"
  puts "Bienvenido!"
when "eeuu"
  puts "Welcome!"
when "francia"
  puts "Bonjour!"
else
  puts "Ciao!"
end

case answer
when "argentina" then puts "Bienvenido!"
when "eeuu"      then puts "Welcome!"
when "francia"   then puts "Bonjour!"
else
  puts "Ciao!"
end

puts "¿Cuantos años tenes?"
print "> "
age = gets.chomp.to_i
=end

=begin
if age > 16
  puts "Usted puede votar!"
else
  puts "Usted no puede votar!"
end
=end

=begin
# condtion ? code_if_true : code_if_false
can_vote = age > 16 ? "si" : " no"

puts "Usted#{can_vote} puede votar!"

def age(input)
  "algo"
end

puts age(0)

staff = ["nico", "santi", "fer"]
staff.each do |person|
  puts person
end

staff.each { |person| puts person }
=end
=begin
students = [
            {name: "nico", last_name: "kennedy"} ,
            {name: "santi", last_name: "llapur"}
           ]

           students = {
             names:     [{teacher: "santi"}, {teacher: "nico"}],
             last_name: ["llapur", "kenndey"]
            }

            p students[:names]
=end
=begin
def es_impar(number)
  puts "#{number} es un numero impar?"
  puts number.odd? ? "Si" : "No"
end

def es_positivo(number)
  puts "Este es un numero postivo!"
  puts "Algo mas sobre positivo"
  puts "Algo mas mas sobre positivo"
  es_impar(number)
end

def es_negativo(number)
  puts "Este es un numero negativo!"
  puts "Algo mas sobre negativo"
  puts "Algo mas mas sobre negativo"
  es_impar(number)
end

puts "Ingrese un valor:"
print "> "
answer = gets.chomp.to_i

answer.positive? ? es_positivo(answer) : es_negativo(answer)


es_positivo(20)


puts "Ingrese un valor:"
print "> "
answer = gets.chomp.to_i


if answer.positive?
  puts "Este es un numero postivo!"
  puts "Algo mas sobre positivo"
  puts "Algo mas mas sobre positivo"
  puts "#{answer} es un numero impar?"
  puts answer.odd? ? "Si" : "No"
else
  puts "Este es un numero negativo!"
  puts "Algo mas sobre negativo"
  puts "Algo mas mas sobre negativo"
  puts "#{answer} es un numero impar?"
  puts answer.odd? ? "Si" : "No"
end
=end

=begin
if answer.positive?
  es_positivo(answer)
elsif answer.negative?
  es_negativo(answer)
end
=end


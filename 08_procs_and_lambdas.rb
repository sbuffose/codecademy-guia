
# *Blocks recap*

names = ["mariana", "gabriele", "shannon"]

names.each do |name|
  # Everything inside here is a *block*!
  reversed_name = name.reverse
  puts reversed_name.upcase
end

# A new powerful method: `map`
# same as `collect` (less common), it modifies each element of a collection

names.map { |name| name.upcase }
puts names
# Nothing happened, because `map` returns just a copy of the original collection, it doesn't modify it!

# I should assign this copy to a new variable
upcase_names = names.map { |name| name.upcase }
puts upcase_names
# or add `!` to the method to modify the original collection (a method with the `!` is a *destructive method*, because it alters the state of the original object)
names.map! { |name| name.upcase }
puts names # it changed!

#############################

# *Yield*
# Use it when you want your method to accept a block

def print_welcome_message
  puts "Welcome to today's lesson!"
  yield
end

print_welcome_message do
  # Everything inside here will replace the yield above!
  puts "Today the teachers are Mariana and Gabriele"
  puts "We'll talk about yield, procs, lambdas, and other cool stuff!"
end

# What if I don't give a block?
print_welcome_message # => 'no block given' error!

# But there's a solution! Just use `yield if block_given?`
def print_welcome_message
  puts "Welcome to today's lesson!"
  yield if block_given?
end

print_welcome_message # no error!

# I can also pass parameters to the yield:
def print_welcome_message(teacher_name)
  puts "Welcome to today's lesson!"
  yield(teacher_name) if block_given?
end

print_welcome_message("gabriele") do |name| # here I have the same variable ("gabriele") available as a parameter (called `name`, but it's arbitrary)!
  puts "Today's teacher is #{name.upcase}"
end

#############################

# *Procs*
# Use them to assign a block to a variable

def print_welcome_message
  puts "Welcome to today's lesson!"
  yield if block_given?
end

today_lecture = Proc.new do
  puts "Today's teachers are Mariana and Gabriele"
  puts "We'll talk about procs and lambdas!"
end

# Pass the proc (so, the block!) with this syntax:
print_welcome_message(&today_lecture)

# A proc can also be called without relating it to a method, just use the `call` method on the same proc!
today_lecture.call

# Other example: print even numbers

numbers = (1..100).to_a

numbers.each { |n| puts n if n.even? }
# The block above could be reused, let's make it a proc!
print_if_even = Proc.new { |n| puts n if n.even? }
numbers.each(&print_if_even)

#############################

# *Procs and symbols*
# In Ruby, we can pass a method name (*name*, not the whole method!) with a symbol
# This symbol can be easily turned into a proc!

names = ["mariana", "gabriele"]
names.map! { |name| name.upcase }
# We can refer to the `upcase` method with a symbol (`:upcase`), and convert it to a proc by adding a `&` before
names.map!(&:upcase) # note the colon, we are passing a symbol here!
puts names

#############################

# *Lambdas*
# Same as procs, except for (mainly 2) small differences

def print_welcome_message
  puts "Welcome to today's lesson!"
  yield if block_given?
end

today_lecture = lambda do # just a different keyword, it does the same!
  puts "Today's teachers are Mariana and Gabriele"
  puts "We'll talk about procs and lambdas!"
end

print_welcome_message(&today_lecture)

# Differences with procs:

# 1. Lambdas check the number of arguments, procs don't
my_proc = Proc.new { |x, y| puts "I don't care about arguments!" }
my_proc.call

my_lambda = lambda { |x, y| puts "I will return an error if you don't give me the right arguments! 🤬" }
my_lambda.call # => 'wrong number of arguments' error! I should pass 2 arguments, x and y

# 2. When they return inside a method, lambas don't interrupt the execution of the function after the `call`, procs do
def lambda_method
  my_lambda = lambda { return "Call me, but if you do other stuff after that, I won't be returned :(" }
  my_lambda.call # it doesn't stop here!
  "You just called the lambda, but I'm not a lambda!"
end

def proc_method
  my_proc = Proc.new { return "Call me, and I'll stop the method here!" }
  my_proc.call # it stops here!
  "This text will never be printed :("
end

puts lambda_method
puts proc_method

#############################

# Some other examples:

# Proc returning student's grades below 10

students_grades = [10, 15, 5, 4, 19, 14, 2, 7, 13]

under_10 = Proc.new { |grade| grade < 10 } # I could use a lambda here, it would be the same!

low_grades = students_grades.select(&under_10)
puts low_grades

# Lambda returning only the symbols inside an array

names = ["mariana", :gabriele, "shannon"]

filter_symbols = lambda { |x| x.is_a? Symbol } # I could use a proc here, it would be the same!

symbols = names.select(&symbol_filter)
puts symbols


=begin
students = ["nico", "santi", "fer"]

# 1, El yield llama al bloque que tiene ese metodo que
# se esta ejecutando. En caso de pasar argumentos, deben recibirlos

students.each do |student|
  puts student.upcase
  puts "-----------"
end

students.each { |student| puts student.upcase }
=end
=begin
# DEFINICIÓN
def say_hi(students)
  students.each do |name|
    yield(name) if block_given?
  end
end

# puts "Veni al asado la semana que viene #{full_name('nico', 'kennedy')}"

students = ["nico", "santi"]

say_hi(students) do |bubu|
  puts "Hi #{bubu}"
end
=end

# DRY -> DO NOT REPEAT YOURSELF

=begin
def welcome
  puts "Ejecuto esto desde el método"
  yield if block_given?
end

def bienvenido
  puts "----- Ejecuto esto desde el método en castellano"
  yield if block_given?
end

# Asignando un Proc
ejecucion_desde_bloque = Proc.new do
  puts "Ejecuto esto desde el bloque"
end
=end

=begin
welcome(&ejecucion_desde_bloque)

puts "--------"

bienvenido(&ejecucion_desde_bloque)
=end

# ejecucion_desde_bloque.call


# EJECUCION
=begin
welcome_method do
  puts "-> Este código se ejecuta desde el bloque"
end

puts ""
puts "--------------"
puts ""

welcome_method
=end


=begin
numbers = [1, 2, 3, 4]

print_numbers = Proc.new { |n| puts n }
print_even_numbers = Proc.new { |n| puts n if n.even? }

numbers.each(&print_numbers)
puts "--------"
numbers.each(&print_even_numbers)
=end
=begin
def welcome
  puts "Desde método welcom"
  yield if block_given?
end

def bienvenido
  puts "Desde método bienvenido"
  yield if block_given?
end
=end

=begin
desde_bloque = Proc.new do
  puts "Esto viene desde el bloque"
  puts "Otra línea desde el bloque"
end
=end
=begin
desde_bloque = lambda do
  puts "Esto viene desde el bloque"
  puts "Otra línea desde el bloque"
end

welcome(&desde_bloque)
bienvenido(&desde_bloque)
=end

=begin
def proc_method
  my_proc = Proc.new do
    puts "Esto se ejecuta"
    return "Algo"
  end
  my_proc.call
  puts "esto no se ejecuta"
end

puts proc_method

puts "----------------------"

def lambda_method
  my_proc = lambda do
    puts "Esto se ejecuta"
    return "Algo lambda"
  end
  my_proc.call
  puts "esto se ejecuta dado que el return del lambda no corta le metodo"
end

puts lambda_method
=end

=begin
my_proc = Proc.new { |x, y| puts "#{x}, #{y} desde proc "}
my_proc.call

puts "-----------------"

my_lambda = lambda { |x, y| puts "#{x}, #{y} desde lambda "}
my_lambda.call("a", "c")
=end

=begin
def full_name(first_name, last_name)
  "#{first_name.capitalize} #{last_name.capitalize}"
end
=end

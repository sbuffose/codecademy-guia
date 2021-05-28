# DON'T EDIT OR REMOVE THIS FILE! This session will start soon!
# OOP = OBJECT ORIENTED PROGRAMMING
puts "*OOP I*"

# Ruby is an object-oriented language
# As any other OOP language, it uses *objects* to store *attributes* and *methods* to store *behaviours*

# ATTRIBUTES = (objects = intances of a Class)
# +
# BEHAVIOURS = (methods = instances of functions)

#####################################

# 1. Attributes

"Hello!".length # => I apply the method length on a string, and it returns the attribute `6` of type `Integer`
4.even? # => returns `true`, an attribute of type `TrueClass`
# N.B: a method with a question mark should always return a boolean, it's convention! check https://rubyonrails.org/doctrine/#convention-over-configuration


teachers = [ # => returns the variable `teachers`, an array with inside two hashes
  {
    name: "Mariana",
    age: 37,
    country: "Portugal"
  },
  {
    name: "Gabriele",
    age: 27,
    country: "Italy"
  },
  {
    name: "Shannon",
    age: 33,
    country: "USA"
  }
]

# Procs and lambdas (block of code contained in `do end` or `{ }`)
# A lambda *is a `Proc`* with some additional features (see previous the lesson!)

print_name = Proc.new { |person| puts person[:name] }
# or
print_name = lambda { |person| puts person[:name] }
# or new faster and cleaner way for an *inline* lambda!
print_name = ->(person) { puts person[:name] }

teachers.each(&print_name)

# From now on always use lambdas and the eventual inline syntax (using Proc.new is obsolete 👴🏻)

# Multi-line lambda syntax
get_flag = lambda do |person|
  case person[:country]
  when "Portugal" then "🇵🇹"
  when "Italy" then "🇮🇹"
  when "USA" then "🇺🇸"
  else "🌍"
  end
end

#####################################

# 2. Behaviours

# 2.1 Standard methods

# Let's pass the lambda to a method
# The most common methods for a collection:
# - :map  -> returns the values
# - :each -> returns always nil, but it can execute some other methods (actions) while looping

flags = teachers.map(&get_flag)

puts "---"
puts "Le Wagon guys:"
teachers.each_with_index do |teacher, index|
  puts "#{teacher[:name]} from #{flags[index]}"
end
puts "---"

# 2.2 Custom methods

def get_italians(people)
  is_italian = ->(person) { person[:country] == "🇮🇹" } # another lambda
  people.select(&is_italian) # pass the lambda to the select method, and return (implicitly!) the italian people
end

students = [
  {
    name: "Federico",
    country: "🇮🇹"
  },
  {
    name: "Nuno",
    country: "🇵🇹"
  },
  {
    name: "Flavia",
    country: "🇮🇹"
  },
  {
    name: "Riccardo",
    country: "🇮🇹"
  },
  {
    name: "Molly",
    country: "🇺🇸"
  }
]

italian_students = get_italians(students).map { |student| student[:name] } # call the method and map it to get a collection of names from the hashes
puts "Some italians guys following the course: #{italian_students.join(', ')}"

#####################################

# 3. Classes

# 3.1 Standard Classes

# Syntax:
# ClassName (the "mold")
# instance (the "cake", one unit of that class)

# I can initialize any object and 'label' it with a variable with ClassName.new,
# *except* booleans and numbers (they're too 'intuitive', we just type them witout quotes or any other symbol)

# Basic objects:
booleans = [true, false]
numbers  = [1993, 3.14]
"Hello there!" # String.new("Hello there!")

# Collections:
[] # Array.new
{} # Hash.new

# Blocks:
proc = Proc.new { |param| puts param } # don't use this! 👴🏻
# or
lambda = lambda do |param|
  puts param
end
# or
lambda = ->(param) { puts param } # use this one if inline!

# There are a lot of pre-defined classes, let's print all of them! 🤩
puts "---"
puts "All the available Ruby classes:"
ruby_classes = ObjectSpace.each_object(Class).to_a # => array with all available classes (don't worry about the :each_object method here)
puts ruby_classes

# One of them is the `File` class, to manipulate files
# Let's use it to store the `welcome.rb` file and print its content! ;)
welcome_file = File.new("test/welcome.rb")
file_content = welcome_file.read
puts "---"
puts file_content
# Check this article on RubyGuides to know more 👉 https://www.rubyguides.com/2015/05/working-with-files-ruby

# Methods
# Method.new does not exist because it's a *behaviour* and not an attribute
# I can just use `def end` to declare a new method

def say_hello
  puts "Hello there"
end

def return_hello
  puts "I'm another string"
  "I'm will be printed after!" # implicit return
end

puts "---"
say_hello
hello_string = return_hello # assign the string "hello"
puts hello_string
puts "---"

# 3.2 Custom Classes

# What if I want my own class with its own attributes and the behaviours I want?

# Place it in one file with the same name
# You need to convert the UpperCamelCase syntax of the model name to lower_snake_case.rb for the file
# LeWagonTeacher model => le_wagon_teacher.rb file

# To require a file we need to use the require_relative keyword, followed by the path relative to the current file
require_relative "test/teacher.rb"
# Why we don't use just require?
# Because require is reserved for gems (what is a gem? check it on RubyGuides!) and file systems, so we need to load the file relatively to where we are

attributes = {
  name: "Gabriele",
  age: 26,
  country: "Italy"
}

# Instances of the teacher model, initialized with some attributes
gabriele = Teacher.new(attributes)
mariana  = Teacher.new(name: "Mariana", country: "Portugal") # you can pass the attributes directly!

# Let's execute some actions (behaviours) on the instances of the teacher model

print_teacher_welcome_message = ->(teacher) { puts teacher.welcome_message }
[gabriele, mariana].each(&print_teacher_welcome_message)

gabriele.birthday
puts "He is turning #{gabriele.age}" # => 27

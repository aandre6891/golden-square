# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

# As a user
# So that I can keep track of my tasks
# I want to check if a text includes the string #TODO.

## 2. Design the Method Signature


_Include the name of the method, its parameters, return value, and side effects._

```ruby

string_checker_todo(string)

# it should return true if #TODO is included in the string or false if it's not 


## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

string_checker_todo("") => fail "no string found" V
string_checker_todo("#TODO") => true V
string_checker_todo("hello, this is the first #TODO") => true V
string_checker_todo("#") => false V
string_checker_todo("#TO") => false V
string_checker_todo("#todo") => false  V
string_checker_todo("hello, this is the first #todo") => false 
string_checker_todo(1) => fail "you haven't given a string"

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->
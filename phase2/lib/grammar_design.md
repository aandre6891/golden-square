# Grammar Methor Design Recipe

## 1. describe the problem

> As a user So that I can improve my grammar
> I want to verify that a text starts with a capital letter 
> and ends with a suitable sentence-ending punctuation mark.

## 2. design the method signature
ruby
is_correct = capital_grammar(text)

# * text is a string with words in it
# * is_correct is a boolean on whether it checks out

## 3. create examples as tests

# 1
check_grammar("")
# => fail "not a sentence"

# 2
check_grammar ("Hello, I am Kay.")
# => true

# 3
check_grammar("Hello, I am Kay")
# => false

# 4
check_grammar("hello, I am Kay".)
# => false

# 4.5
check_grammar("hello, I am Kay")
# => false

# 5
check_grammar("HELLO, I am Kay".)
# => true

# 6
check_grammar("Hello, I am Kay"!)
# => true

# 7
check_grammar("Hello, I am Kay"?)
# => true

# 8
check_grammar("HELLO, I am Kay",)
# => false


## 4. implement the behaviour
# A script to learn how to use function object 
# (as per section 3.14. Exercise 2 of ThinkPython2)

# Function that prints out the string 'spam'
def print_spam():
    print('spam')

# Function that takes in a function object and call in twice
def do_twice(f):
    f()
    f()

do_twice(print_spam)

# Function that takes in a function object and a value.
# The value is passed to the input function, and that function is called twice
def do_twice(f, value):
    f(value)
    f(value)

def print_twice(value):
    print(value)
    print(value)

do_twice(print_twice, 'Hello')

# Function that takes in a function object and a value.
# The value is passed to the input function, and that function is called four time
def do_four(f, value):
    do_twice(f, value)
    do_twice(f, value)

do_four(print_twice, 'World')
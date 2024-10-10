my_vector <- c(1,2,3,4,5)

my_vector <- c(my_vector, 7)


print(my_list)

my_matrix <- matrix(1:6, nrow=3, ncol=2)

new_row <- c(7,8)

my_matrix <- rbind(my_matrix,new_row)

print(my_matrix)


my_dataframe$Is_Active <- new_column

print(my_dataframe)


print(vec)


# Countdown Timer

countdown <- 10

while (countdown > 0) {
  
  print(countdown)
  
  countdown <- countdown-1
}

print('Countdown complete!')


# 1. Using While loop:

# A. Sum of Even numbers 
# Define the range
range <- 1:20

# Initialize variables
current_number <- 1
sum_even <- 0

# While loop to iterate through the range
while (current_number <= 20) {
  # Check if the current number is even
  if (current_number %% 2 == 0) {
    # Add the even number to sum_even
    sum_even <- sum_even + current_number
  }
  # Increment the current number
  current_number <- current_number + 1
}

# Display the sum of even numbers
print(sum_even)


# B. Odd
# Define the range
range <- 1:20

# Initialize variables
current_number <- 1
sum_odd <- 0  

# While loop to iterate through the range
while (current_number <= 20) {
  # Check if the current number is odd
  if (current_number %% 2 != 0) {  
    # Add the odd number to sum_odd
    sum_odd <- sum_odd + current_number
  }
  # Increment the current number
  current_number <- current_number + 1
}

# Print the result
print(paste("The sum of odd numbers from 1 to 20 is:", sum_odd))
# cat("The cumulative sum of all odd numbers from 1 to 20 is:", sum_odd)



# C. Even with inputs
# Define the range
start_value <- as.numeric(readline(prompt = "Please enter the starting value = "))
end_value <- as.numeric(readline(prompt = "Please enter the end value = "))

# Initialize variables
current_number <- start_value
sum_even <- 0

# While loop to iterate through the range
while (current_number <= end_value) {
  # Check if the current number is even
  if (current_number %% 2 == 0) {
    # Add the even number to sum_even
    sum_even <- sum_even + current_number
  }
  # Increment the current number
  current_number <- current_number + 1
}

# Display the sum of even numbers
print(sum_even)
# cat("The cumulative sum of all even numbers from", start, "to", end, "is:", sum_even, "\n")



# D. Odd with inputs
# Define the range
start_value <- as.numeric(readline(prompt = "Please enter the starting value = "))
end_value <- as.numeric(readline(prompt = "Please enter the end value = "))

# Initialize variables
current_number <- start_value
sum_odd <- 0  

# While loop to iterate through the range
while (current_number <= end_value) {
  # Check if the current number is odd
  if (current_number %% 2 != 0) {  
    # Add the odd number to sum_odd
    sum_odd <- sum_odd + current_number
  }
  # Increment the current number
  current_number <- current_number + 1
}

# Print the result
cat('The cumulative sum of all odd numbers from', start_value, 'to', end_value, 'is:', sum_odd)


# TEACHER: Example Code Outline for Even:
  # Initialize variables
  current_number <- 1
sum_even <- 0

# Start the while loop
while (current_number <= 20) {
  # Check if the current number is even
  if (current_number %% 2 == 0) {
    # Add the even number to the sum
    sum_even <- sum_even + current_number
  }
  
  # Increment the current number
  current_number <- current_number + 1
}

# Print the sum of even numbers
print(paste("The sum of even numbers from 1 to 20 is:", sum_even))




# 2. Using For Loop:

# A. for the sum of even numbers:
# Initialize variables
current_number <- 1
sum_even <- 0

# Start the for loop

for (current in 1:20) {
  # Check if the current number is even
  if (current_number %% 2 == 0) {
    # Add the even number to the sum
    sum_even <- sum_even + current_number
  }
  
  # Increment the current number
  current_number <- current_number + 1
}

# Print the sum of even numbers
print(paste("The sum of even numbers from 1 to 20 is:", sum_even))


# B. for the sum of odd numbers:
# Initialize variables
current_number <- 1
sum_odd <- 0

# Start the for loop

for (current in 1:20) {
  # Check if the current number is odd
  if (current_number %% 2 != 0) {
    # Add the odd number to the sum
    sum_odd <- sum_odd + current_number
  }
  
  # Increment the current number
  current_number <- current_number + 1
}

# Print the sum of odd numbers
cat("The sum of odd numbers from 1 to 20 is:", sum_odd)



# C. for the sum of Even numbers using Inputs:
# Define the range
x <- as.numeric(readline("Please enter the first number: "))
y <- as.numeric(readline("Please enter the last number: "))
                
# Initialize variables
current_number <- x
sum_even <- 0

# Start the for loop

for (current in x:y) {
  # Check if the current number is even
  if (current_number %% 2 == 0) {
    # Add the even number to the sum
    sum_even <- sum_even + current_number
  }
  
  # Increment the current number
  current_number <- current_number + 1
}

# Print the sum of even numbers
print(paste('The sum of even numbers from', x, 'to', y, 'is:', sum_even))


# D. for the sum of Odd numbers using Inputs:
# Define the range
x <- as.numeric(readline("Please enter the first number: "))
y <- as.numeric(readline("Please enter the last number: "))

# Initialize variables
current_number <- x
sum_odd <- 0

# Start the for loop

for (current in x:y) {
  # Check if the current number is not even
  if (current_number %% 2 != 0) {
    # Add the even number to the sum
    sum_odd <- sum_odd + current_number
  }
  
  # Increment the current number
  current_number <- current_number + 1
}

# Print the sum of odd numbers
cat('The sum of odd numbers from', x, 'to', y, 'is:', sum_odd)



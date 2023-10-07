
def alternating_sum(x, power)
  sum = 1
  (1..power).each do |i|
    sign = i.odd? ? -1 : 1
    coefficient = sign * (i + 1.0) / (i + 2.0)
    sum += coefficient * x ** i
  end
  sum
end

def power_sum(x, power)
  sum = 0
  (0..power).each do |i|
    sum +=  (3.0 ** -i)
  end
  sum
end

def factorial_sum(x, n)
  sum = 0
  xn = x
  fact = 1.0
  n.times do |i|
    fact *= (i+1)
    xn *= x
    sum += xn / fact
  end
  sum
end

def sin_sum(n)
  sum = 0
  under = 0
  n.times do |i|
    under += Math.sin(i+1)
    sum += 1/under
  end
  sum
end

def sqrt_sum(n)
  result = 0
  n.times do
    result = Math.sqrt(2 + result)
  end
  result
end
def expression1
  alternating_sum(2, 10)
end

def expression2
  power_sum(3, 8)
end

def expression3
  print "X:"
  x = gets.chomp.to_i
  print "N:"
  n = gets.chomp.to_i
  factorial_sum(x,n)
end

def expression3_auto
  factorial_sum(2,10)
end

def expression4
  sin_sum(5)
end

def expression5
  sqrt_sum(3)
end

puts("Expression 1: #{expression1}")
puts("Expression 2: #{expression2}")
puts("Expression 3: #{expression3_auto}")
puts("Expression 4: #{expression4}")
puts("Expression 5: #{expression5}")
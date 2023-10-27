#Variant 2

def calculate_f(x,a,b,c,req)
  1.0 / (a * x) - b if x + 5 < 0 and c == 0
  x - a / x.to_f if x + 5 > 0 and c != 0
  res = 10.0 * x / (c - 4)
  req ? res : res.to_i
end

def is_require_transform?(a, b, c)
  (a.truncate & b.truncate) | (b.truncate & c.truncate) != 0
end

def tabulate_f(x_begin, delta, x_end, a, b, c)
  req = is_require_transform?(a, b, c)
  (x_begin..x_end).step(delta) do |x|
    fx = calculate_f(x,a,b,c, req)
    puts "F(#{x}) = #{fx}"
  end
end

def receive_and_calculate
  print"X begin:"
  x_begin = gets.chop.to_f
  print"X delta:"
  delta = gets.chop.to_f
  print"X end:"
  x_end = gets.chop.to_f
  print"A:"
  a = gets.chop.to_f
  print"B:"
  b = gets.chop.to_f
  print"C:"
  c = gets.chop.to_f
  tabulate_f(x_begin,delta,x_end, a, b, c)
end

receive_and_calculate
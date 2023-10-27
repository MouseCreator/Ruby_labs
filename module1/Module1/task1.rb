#Variant 2
require 'minitest/autorun'
def calculate_f(x,a,b,c,req)
  if x + 5 < 0 and c == 0
    res = 1.0 / (a * x) - b
  elsif x + 5 > 0 and c != 0
    res = (x - a) / x.to_f
  else
    res = 10.0 * x / (c - 4.0)
  end
  req ? res : res.to_i
end

def is_require_transform?(a, b, c)
  ((a.truncate & b.truncate) | (b.truncate & c.truncate)) != 0
end

def tabulate_f(x_begin, delta, x_end, a, b, c)
  if x_end < x_begin && delta > 0
    raise ArgumentError, "X_end < X_begin: cannot tabulate function in reverse order!"
  end
  if x_end > x_begin && delta < 0
    raise ArgumentError, "Delta < 0: infinite loop!"
  end
  req = is_require_transform?(a, b, c)
  arr = []
  x_begin.step(to:x_end, by: delta) do |x|
    fx = calculate_f(x,a,b,c, req)
    arr << fx
  end
  arr
end
#Direct input
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
  arr = tabulate_f(x_begin,delta,x_end, a, b, c)

  i = 0
  x_begin.step(to:x_end, by: delta) do |x|
    xv = sprintf('%.2f', x)
    fv = sprintf('%.2f', arr[i])
    puts  "F(#{xv}) = #{fv}"
    i += 1
  end
end

def compare_float(f1,f2,eps=0.000001)
  (f1-f2).abs < eps
end
class TestService < MiniTest::Test
  def test_raises
    assert_raises(ArgumentError) do
      tabulate_f(1,-1,2,0,0,0)
    end
    assert_raises(ArgumentError) do
      tabulate_f(1,1,-2,0,0,0)
    end

  end
  def test_tabulation_single
    act =  tabulate_f(2,1,2, 1.1, 2.2, 3.3)
    assert_equal(1, act.length)
    assert(compare_float(act[0], 0.45), "Not equal with given approximation: #{act[0]} and 0.45")
  end

  def test_tabulation_multiple
    act =  tabulate_f(-7,3,7, 1, 2, 3)
    assert_equal([70.0, 1.25, 2.0, 0.5, 0.8], act)
  end

  def test_truncate
    act =  tabulate_f(2,1,4, 1, 2, 5)
    assert act.all? {|i| i.is_a?(Integer) }
  end
end
require 'minitest/autorun'
# problem 1
def find_repeat_groups(arr)
  i = 0
  count = 0
  while i < arr.length - 1
    n = arr[i]
    if arr[i+1] == n
      count += 1
      while arr[i+1] == n && i < arr.length
        i += 1
      end
    end
    i += 1
  end
  count
end

#problem 2
def calculate_even_sum_index(arr)
  element_sum = 0
  index_sum = 0
  arr.each_with_index do |element, index|
    el = element.to_i
    next if el.odd?
    element_sum += el
    index_sum += index
  end
  [element_sum, index_sum]
end

#problem 3

def array_overlap(arr1, arr2)
  arr1 & arr2
end
#problem 4
def shift(arr)
  copy = arr.dup
  if arr.empty?
    return copy
  end
  last = copy.last
  copy.pop
  copy.dup.unshift(last)
end
#problem 5
def sign_sort(arr)
  minus_arr = []
  zero_arr = []
  plus_arr = []
  arr.each do |element|
    case
    when element < 0
      minus_arr << element
    when element.zero?
      zero_arr << element
    else
      plus_arr << element
    end
  end
  minus_arr + zero_arr + plus_arr
end

def calculate_odd_even_sum(arr)
  arr.inject(0) do |result, element|
    result += element if element.even? && element < 0 || element.odd? && element > 0
    result
  end
end


class TestCalculateFunction < MiniTest::Test
  def test_find_repeat_groups
    assert_equal 0, find_repeat_groups([1, 2, 3, 4, 1, 2])
    assert_equal 1, find_repeat_groups([1, 2, 2, 3])
    assert_equal 1, find_repeat_groups([1, 2, 2, 2, 2, 2, 3])
    assert_equal 3, find_repeat_groups([1, 1, 2, 2, 3, 2, 2])
    assert_equal 0, find_repeat_groups([])
  end

  def test_calculate_even_sum_index
    assert_equal [6,4], calculate_even_sum_index([1.2, 2.2, 3.8, 4.5])
    assert_equal [0,0], calculate_even_sum_index([])
  end
  def test_overlap
    assert_equal [3,4], array_overlap([1,2,3,4], [3,4,5,6])
    assert_equal [], array_overlap([1,2,3,4], [5,6,7,8])
    assert_equal [], array_overlap([], [1,2])
  end

  def test_shift
    assert_equal [], shift([])
    assert_equal [4,1,2,3], shift([1,2,3,4])
    assert_equal [1], shift([1])
  end

  def test_sign_sort
    assert_equal [], sign_sort([])
    assert_equal [-2, -4, -5, 0, 0, 0, 1, 3, 6], sign_sort([0, 1, -2, 0, 3, -4, -5, 6, 0])
    assert_equal [1], sign_sort([1])
    assert_equal [-1, 1], sign_sort([-1, 1])
  end

  def test_calculate_odd_even_sum
    assert_equal 0, calculate_odd_even_sum([])
    assert_equal 9, calculate_odd_even_sum([1,2,3,4,5])
    assert_equal 3, calculate_odd_even_sum([1,-2,3,-4,5])
  end
end

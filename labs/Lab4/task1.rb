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
end

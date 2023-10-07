require 'minitest/autorun'
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

class TestCalculateFunction < MiniTest::Test
  def test_find_repeat_groups
    assert_equal 0, find_repeat_groups([1, 2, 3, 4, 1, 2])
    assert_equal 1, find_repeat_groups([1, 2, 2, 3])
    assert_equal 1, find_repeat_groups([1, 2, 2, 2, 2, 2, 3])
    assert_equal 3, find_repeat_groups([1, 1, 2, 2, 3, 2, 2])
  end
end

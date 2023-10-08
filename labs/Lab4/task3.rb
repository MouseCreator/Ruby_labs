
require 'minitest/autorun'
def create_matrix(dim, k)
  if dim < 3 || dim > 9
    raise ArgumentError, "dimension has to be inside [3,9] range"
  end
  diag = 2
  not_diag = k + 2
  matrix = []
  dim.times do |i|
    arr = []
    dim.times do |j|
      arr << (i == j ? diag : not_diag)
    end
    matrix << arr
  end
  matrix
end

def create_b_vector(dim)
  if dim < 3 || dim > 9
    raise ArgumentError, "dimension has to be inside [3,9] range"
  end
  (1..dim).to_a
end

class TestSystemSolve < MiniTest::Test
  def test_matrix_creation
    assert_raises(ArgumentError) do
      create_matrix(2,12)
    end
    assert_raises(ArgumentError) do
      create_matrix(12,12)
    end
    assert_equal([[2, 4, 4], [4, 2, 4], [4, 4, 2]], create_matrix(3,2))
  end
  def test_vector_creation
    assert_raises(ArgumentError) do
      create_b_vector(2)
    end
    assert_raises(ArgumentError) do
      create_b_vector(12)
    end
    assert_equal([1,2,3,4,5], create_b_vector(5))
  end
end

require 'matrix'
require 'minitest/autorun'
def multiply_by_num(matrix, n)
  matrix * n
end

def sum(matrix1, matrix2)
  matrix1 + matrix2
end

def transpose (matrix)
  matrix.transpose
end

def multiply (matrix1, matrix2)
  matrix1 * matrix2
end

def trace (matrix)
  matrix.trace
end


class TestProblems < MiniTest::Test
  def test_multiply_by_num
    matrix = Matrix[[1,2,3],[4,5,6],[7,8,9]]
    assert_equal(Matrix[[2, 4, 6], [8, 10, 12], [14, 16, 18]], multiply_by_num(matrix, 2))
  end

  def test_sum
    matrix_a = Matrix[[1,2],[4,5]]
    matrix_b = Matrix[[4,7],[8,2]]
    assert_equal(Matrix[[5,9],[12,7]], sum(matrix_a, matrix_b))
  end
  def test_transpose
    matrix = Matrix[[1,2],[3,4]]
    assert_equal(Matrix[[1,3],[2,4]], transpose(matrix))
  end

  def test_multiply
    matrix_a = Matrix[[1,2],[4,5]]
    matrix_b = Matrix[[4,7],[8,2]]
    assert_equal(Matrix[[20,11],[56,38]], multiply(matrix_a, matrix_b))
  end

  def test_trace
    matrix = Matrix[[2, 4, 6], [8, 10, 12], [14, 16, 18]]
    assert_equal(30, trace(matrix))
  end
end

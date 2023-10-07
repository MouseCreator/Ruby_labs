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

def vector_scalar_product(v1,v2)
  v1.inner_product(v2)
end

def vector_outer_product(v1,v2)
  v1.cross(v2)
end

def vector_norm(v)
  v.r
end

def vector_by_matrix(v, a)
  a * v
end

def matrix_by_vector(a, v)
  a * v
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

  def test_vector_scalar_product
    v1 = Vector[2, 4, 6]
    v2 = Vector[1, 5, 9]
    assert_equal(76, vector_scalar_product(v1,v2))
  end

  def test_vector_product
    v1 = Vector[2, 4, 6]
    v2 = Vector[1, 5, 9]
    assert_equal(Vector[6, -12, 6], vector_outer_product(v1,v2))
  end

  def test_vector_norm
    v1 = Vector[2, 4, 6]
    v2 = Vector[1, 5, 9]
    assert((7.48331477354788 - vector_norm(v1)).abs < 0.000001)
    assert((10.3440804327886 - vector_norm(v2)).abs < 0.000001)
  end

  def test_vector_by_matrix
    v = Vector[1, 5, 9]
    v2 = Matrix.column_vector([1, 2, 3])
    a = Matrix[[1,2,3],[4,5,6],[7,8,9]]
    assert_equal(Matrix[[14], [32], [50]], vector_by_matrix(v2, a))
    assert_equal(Vector[38, 83, 128], matrix_by_vector(a, v))
  end
end

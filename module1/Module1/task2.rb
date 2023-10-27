require 'minitest/autorun'

class Model

end
class Service

end


class TestService < MiniTest::Test
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

  def test_solve
    matrix = create_matrix(5,12)
    b = create_b_vector(5)
    x = solve(matrix, b)
    assert(comp_double(x[0], 19.0/87.0), "x[0] = #{x[0]} != 47.0/348.0")
    assert(comp_double(x[1], 47.0/348.0), "x[1] = #{x[1]} != 47.0/348.0")
    assert(comp_double(x[2], 3.0/58.0), "x[2] = #{x[2]} != 3.0/58.0")
    assert(comp_double(x[3], -11.0/348.0), "x[3] = #{x[3]} != -11.0/348.0")
    assert(comp_double(x[4], -10.0/87.0), "x[4] = #{x[4]} != -10.0/87.0")

    matrix2 = create_matrix(4,12)
    b2 = create_b_vector(5)
    assert_raises(ArgumentError) do
      solve(matrix2, b2)
    end
  end
end
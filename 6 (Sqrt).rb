require "minitest/autorun"

def solution(a, b)
  left_sqrt = Math.sqrt(a)
  
  if left_sqrt % 1 != 0
    left_sqrt = left_sqrt.to_i + 1
  end
  
  right_sqrt = Math.sqrt(b).to_i
  
  (right_sqrt - left_sqrt + 1).to_i
end

class SqrtTest < MiniTest::Test
  def test_solution1
    assert_equal 3, solution(4, 17)
  end

  def test_solution2
    assert_equal 4, solution(4, 25)
  end

  def test_solution3
    assert_equal 3, solution(5, 25)
  end

  def test_solution4
    assert_equal 0, solution(5, 6)
  end
  
  def test_solution4
    assert_equal 1, solution(5, 9)
  end
end
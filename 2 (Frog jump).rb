require "minitest/autorun"

class FrogJump
  def solution(x, y, d)
    return 0 if d == 0

    res = (y - x) / d
    res += 1 if ((y - x) % d) > 0

    res
  end
end

class FrogJumpTest < MiniTest::Test
  def test_frog_jump_1
    jumps = FrogJump.new.solution(10, 85, 30)
    
    assert_equal 3, jumps
  end
  
  def test_frog_jump_2
    jumps = FrogJump.new.solution(10, 10, 0)
    
    assert_equal 0, jumps
  end
  
  def test_frog_jump_3
    jumps = FrogJump.new.solution(10, 21, 10)
    
    assert_equal 2, jumps
  end
end
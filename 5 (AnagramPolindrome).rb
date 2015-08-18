require "minitest/autorun"

def solution(s)
  h = Hash.new(0)
  
  s.split('').each do |ch|
    h[ch] += 1
  end
  
  return 0 if h.keys.length == 1
  
  count_of_odd = h.select { |k, v| v.odd? }.length
  
  if count_of_odd > 1
    return 0
  else
    return 1
  end
end

class AnagramPolindromeTest < MiniTest::Test
  def test_solution1
    assert_equal 1, solution("dooernedeevrvn")
  end
  
  def test_solution2
    assert_equal 0, solution("aabcba")
  end
  
  def test_solution3
    assert_equal 0, solution("aa")
  end
end
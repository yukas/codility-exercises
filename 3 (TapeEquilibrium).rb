require "minitest/autorun"

# O(n²)
def solution1(a)
  return 0 if a.length < 2

  p = 1

  min = nil

  while p < a.length do
    left = (0...p).inject(0) { |sum, i| sum + a[i] }
    right = (p...a.length).inject(0) { |sum, i| sum + a[i] }

    res = (left - right).abs

    min = res if min == nil
    min = res if min > res

    p += 1
  end

  min
end

# O(n²)
def solution2(a)
  return 0 if a.length < 2

  s = a.inject(0) { |sum, e| sum + e }

  min = nil

  (1...a.length).each do |p|
    left = (0...p).inject(0) { |sum, i| sum + a[i] }
    right = s - left
    res = (left - right).abs
  
    min = res if min == nil
    min = res if res < min
  end

  min
end

# O(n)
def solution3(a)
  return 0 if a.length < 2
  
  s = a.inject(0) { |sum, e| sum + e }
  
  min = nil
  left = 0

  (0...(a.length-1)).each do |p|
    left = left + a[p]
    right = s - left
    res = (left - right).abs
    
    min = res if min == nil
    min = res if res < min
  end
  
  min
end

class TapeEqulibriumTest < MiniTest::Test
  def test_solution1
    assert_equal 1, solution1([3, 1, 2, 4, 3])
  end
  
  def test_solution2
    assert_equal 1, solution1([3, 1, 2, 4, 3])
  end
  
  def test_solution3
    assert_equal 1, solution3([3, 1, 2, 4, 3])
  end
end
require "minitest/autorun"

class Total
  def total(n)
    (1...n).inject(0) { |sum, e| sum + e }
  end
end

class TotalTest < MiniTest::Test
  def test_total_of_1
    total = Total.new.total(1)
    
    assert_equal 1, total
  end
  
  def test_total_of_2
    total = Total.new.total(2)
    
    assert_equal 3, total
  end
  
  def test_total_of_3
    total = Total.new.total(3)
    
    assert_equal 6, total
  end
end
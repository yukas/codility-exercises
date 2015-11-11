require "minitest/autorun"

# What is probability of rolling N dices and scoring sum S

class TestProbabilityCalculator < MiniTest::Test
  def test_probability_3_10
    assert_equal 27, probability(dices: 3, sum: 10)
  end
  
  def test_probability_3_12
    assert_equal 25, probability(dices: 3, sum: 12)
  end
  
  def test_probability_100_200
    assert_equal 130621690296647287464555678226154607406006293730699847744686886597125388711,
                 probability(dices: 100, sum: 200)
  end
  
  private
  
  def probability(dices:, sum:)
    DiceProbabilityCalculator.new(dices: dices, sum: sum).calculate
  end
end

class DiceProbabilityCalculator
  attr_reader :dices, :sum
  
  def initialize(dices:, sum:)
    @dices = dices
    @sum   = sum
    
    @result_table = create_2d_array
  end
  
  def calculate
    manually_fill_first_row
    fill_remaining_rows
    get_probability
  end
  
  private
  attr_reader :result_table
  
  def create_2d_array
    Array.new(dices + 1) { Array.new(sum + 1) }
  end
  
  def manually_fill_first_row
    0.upto(5)       { |i| result_table[0][i] = 1 }
    6.upto(sum - 1) { |i| result_table[0][i] = 0 }
  end
  
  def fill_remaining_rows
    second_row_index = 1
    
    second_row_index.upto(dices - 1) do |d|
      0.upto(sum - 1) do |s|
        result_table[d][s] = calculate_next_number(d, s)
      end
    end
  end
  
  def calculate_next_number(d, s)
    col = result_table.fetch(d - 1, [])
    
    1.upto(6).inject(0) { |sum, i| sum + col[s - i].to_i }
  end
  
  def get_probability
    result_table[dices - 1][sum - 1]
  end
end

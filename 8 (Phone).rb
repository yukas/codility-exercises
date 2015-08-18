require "minitest/autorun"

# < 5 min => 3 cents per second
# >= 5 min => 150 cents per minute
# longest duration - free
# tie - num value is smallest
def solution(log)
  return 0 if log.strip.empty?
  
  total_cents = 0
  
  book = Hash.new(0)
  
  log.each_line do |line|
    duration, phone_number = line.chomp.split(",", 2)

    h, m, s = time.split(":", 3).map(&:to_i)
    total_sec = h * 3600 + m * 60 + s
    
    book[phone_number] += total_sec
  end
  
  max_key = book.max_by{ |k, v| v }[0]
  
  phones.delete(max_key)
  
  phones.each do |phone, total_sec|
    if total_sec < 300
      res += total_sec * 3
    else
      res += total_sec / 60 * 150
      res += 150 if total_sec % 60 != 0
    end
  end
  
  res
end


class PhoneTest < MiniTest::Test
  def test_solution1
    log = "00:01:07,400-234-090
   00:05:01,701-080-080
   00:05:00,400-234-090"

    assert_equal 900, solution(log)
  end

  def test_solution2
    log = "00:01:00,400-234-091
   00:02:00,701-080-080
   00:02:00,701-080-081"

    assert_equal 540, solution(log)
  end
  
  def test_solution3
    log = "00:01:00,400-234-091"
    
    assert_equal 0, solution(log)
  end
end
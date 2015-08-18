def solution(a)
  return 1 if a.empty?
  
  n = a.length + 1
  
  total = (1..n).inject(:+)
  
  s = a.inject(:+)
  
  total - s
end
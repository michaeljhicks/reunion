numbers = [1 ,3 ,9 ,10]

numbers.reduce(0) do |sum, n|
  sum[n[0]]
  sum
end

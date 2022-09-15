def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  p counter.to_a.sort_by.max_by { |k, v| v }[0][0]
end
  
  # Intended output:
  # 
p get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"
  
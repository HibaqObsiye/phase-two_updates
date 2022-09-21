class LetterCounter
    def initialize(text)
      @text = text
      #I initialize an object with a text
    end
  
    def calculate_most_common()
      counter = Hash.new(0)
      most_common = nil
      most_common_count = 0
       @text.chars.each do |char| #splits the text into separate letters
        next unless is_letter?(char) #it won't undergo the next step unless it is a loop
          counter[char] = ( counter[char] || 1) + 1
        if counter[char] > most_common_count #if the index of the letter is greater than 1
            most_common = char
          p most_common_count = counter[char]
        end
      end
      return [most_common_count, most_common]
    end
  
    private
  
    def is_letter?(letter)
      return letter =~ /[a-z]/i #letters case insensitive
    end
  end
  
  counter = LetterCounter.new("Digital Punk")
  p counter.calculate_most_common
  
  # Intended output:
  # [2, "i"]
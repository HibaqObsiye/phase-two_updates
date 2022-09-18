class GrammarStats
    def initialize
      @correct_texts = []
      @total_texts = []
    end
  
    def check(text) # text is a string
      raise "Give me a string" if !text.is_a? String or text == ""
      @total_texts << text

      return false unless text.match?(/^[A-Z][\s\S]*?\+?[.?!](?:\n\n|$)/)
      @correct_texts << text
      true
  end
  

  def percentage_good
    ((@correct_texts.count.to_f/@total_texts.count) * 100).ceil
  end
end
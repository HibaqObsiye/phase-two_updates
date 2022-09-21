class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
       @last_read_word = 0
    end
  
    def title
      @title
    end
  
    def contents
      @contents
    end
  
    def count_words
        count = @contents.split.size
        return count
    end
  
    def reading_time(wpm) 
        fail "reading time must be above zero" unless wpm.positive?
        (count_words/wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) #To come back to
      #words = wpm * words gives the words I can read e.g 50 words in total
        words_I_can_read = wpm * minutes
         end_chunk = words_I_can_read + @last_read_word
        sentence = @contents.split(" ")[@last_read_word, end_chunk].join(" ")
        if end_chunk >= count_words
          @last_read_word = 0
        else
          
          @last_read_word = words_I_can_read
        
        end
          
       return sentence
        
      
        
      
  
      
    
  end

 
     
      
   
  
 
  
  
 

#   end_of_chunk = word_to_read + @end
#   word_list = @contents.split(" ")[@end, end_of_chunk]
#   if end_of_chunk >= count_words
#    @end = 0
#   else
#    @end = end_of_chunk
#   end
#    return word_list.join(" ")
 end
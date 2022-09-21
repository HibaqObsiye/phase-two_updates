class Diary
    def initialize
      @entries = []
      @end = 0
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      @entries << entry
    end
  
    def all
      @entries
    end
  
    def count_words
       @entries.map{|entry|entry.count_words}.sum #need to understand this better
    end
  
    def reading_time(wpm) 
     fail "reading time must be above zero" unless wpm.positive?
     (count_words/wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes) # 10, 5
      # word_to_read = minutes * wpm # 50 wordds max
      # #end_of_chunk = word_to_read + @end # 
      # p @entries
      # word_list = @entries.map do |entry| # <DiaryEntry:24353 ...@content = "my content" >
      #   entry.reading_chunk(wpm,minutes) # my content
      # end
      # return word_list   
      return readable_entries(wpm, minutes).max_by(&:count_words)
    end

    private 

    def readable_entries(wpm, minutes) #to come back to
      return @entries.filter do |entry|
        entry.reading_time(wpm) <= minutes
      end
    end

   

  
end


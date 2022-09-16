class DiaryEntry

def initialize(title,contents)
    @title = title
    @contents = contents
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
   fail "reading time must be above zero" unless wpm > 0
   count = @contents.split.size
   (count.to_f/ wpm).ceil
   
end

def reading_chunk(wpm, minutes)
   @contents
end

end


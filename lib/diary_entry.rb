class DiaryEntry

def initialize(title,contents)
    @title = title
    @contents = contents
    @end = 0
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

def reading_chunk(wpm,minutes)
   word_to_read = minutes * wpm
   end_of_chunk = word_to_read + @end
   word_list = @contents.split(" ")[@end, end_of_chunk]
    word_list
   if end_of_chunk >= count_words
    @end = 0
   else
    @end = end_of_chunk
   end
    return word_list.join(" ")
  end
end





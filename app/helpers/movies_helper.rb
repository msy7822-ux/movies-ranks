module MoviesHelper
    def text_num_over(text)
        if text.size > 60
            return text.slice(0, 59) + '...'
        else
            return text
        end
    end
end

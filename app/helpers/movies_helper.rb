module MoviesHelper
    # 文字数が超過している場合に、文字数を調整するメソッド
    def text_num_over(text)
        if text.size > 60
            return text.slice(0, 59) + '...'
        else
            return text
        end
    end

    # 投票されたポイントに応じて、配列の中見を並べ替えるメソッド
    def new_movies(movies)
        movies = movies.sort_by{|a|
            a.votes.count
        }
        return movies
    end
end

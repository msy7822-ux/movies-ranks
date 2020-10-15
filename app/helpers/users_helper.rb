module UsersHelper
    def movies(vote_arr)
        # ユーザーが投票ないしは、コメントした映画情報を格納する配列
        movies = []
        vote_arr.each do |vote|
            movies << Movie.find(vote.movie_id)
        end
        return movies
    end
end

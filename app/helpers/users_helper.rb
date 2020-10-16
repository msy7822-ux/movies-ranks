module UsersHelper
    def movies(vote_arr)
        # ユーザーが投票ないしは、コメントした映画情報を格納する配列
        # movies = vote_arr.pluck(:movie_id)
        movies = Movie.where(id: vote_arr.pluck(:movie_id))
        return movies
    end
end

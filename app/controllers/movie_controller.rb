class MovieController < ApplicationController
  def get_all
    @all = Movie.pluck(:id, :title, :director_id)
    @route = 'movies'
    render({ :template => "misc_templates/list_movie" })
  end

  def get_movie
    id = params["movie_id"].to_i
    movie = Movie.find(id)
    @name = movie.title
    @year = movie.year
    @duration = movie.duration
    @desc = movie.description
    dir_id = movie.director_id
    @director = Director.where(id: dir_id)[0].name
    render({ :template => "misc_templates/single_movie" })
  end
end
